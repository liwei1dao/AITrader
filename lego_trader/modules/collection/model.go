package collection

import (
	"context"
	"encoding/json"
	"fmt"
	"strconv"
	"time"

	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/lego/utils/crypto/md5"
	"lego_trader/pb"
	"lego_trader/sys/db"

	"github.com/redis/go-redis/v9"
)

// 代理模型
type modelComp struct {
	cbase.ModuleCompBase
	module *Collection
}

func (this *modelComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*Collection)
	return
}

/*
过滤并保存新个股新闻
参数: items - 原始新闻列表
返回值: newItems - 去重后的新新闻列表; err - 错误信息
说明: 使用 Redis Set 存储已处理的新闻 URL，返回 Set 中不存在的新闻，并将其加入 Set
*/
func (this *modelComp) filterNewStockNews(items []*pb.DBStockNews) (newItems []*pb.DBStockNews, err error) {
	var (
		ctx      = context.Background()
		pipeline = db.Redis().Pipeline()
		seenKey  = "collection:stock_news:seen"
		futures  []*redis.BoolCmd
	)

	// 1. 批量检查是否存在 (使用MD5作为key)
	for _, item := range items {
		urlHash := md5.MD5EncToLower(item.Url)
		futures = append(futures, pipeline.SIsMember(ctx, seenKey, urlHash))
	}
	if _, err = pipeline.Exec(ctx); err != nil {
		this.module.Errorf("Redis pipeline exec failed: %v", err)
		return
	}

	// 2. 筛选新新闻并准备写入
	newItems = make([]*pb.DBStockNews, 0)
	writePipeline := db.Redis().Pipeline()
	hasNew := false

	for i, future := range futures {
		exists := future.Val()
		if !exists {
			item := items[i]
			newItems = append(newItems, item)
			urlHash := md5.MD5EncToLower(item.Url)
			writePipeline.SAdd(ctx, seenKey, urlHash)
			hasNew = true
		}
	}

	// 3. 批量写入新标记
	if hasNew {
		if _, err = writePipeline.Exec(ctx); err != nil {
			this.module.Errorf("Redis SAdd failed: %v", err)
			// 即使写入失败，也返回筛选出的新闻，虽然可能导致下次重复，但保证了本次可用
			return newItems, nil
		}
	}

	return
}

func (this *modelComp) cleranCacheList(keyPrefix string) (err error) {

	var (
		keys []string
		ctx  = context.Background()
	)

	// Scan all keys matching the pattern
	iter := db.Redis().Scan(ctx, 0, fmt.Sprintf("%s:*", keyPrefix), 0).Iterator()
	for iter.Next(ctx) {
		keys = append(keys, iter.Val())
	}

	if err = iter.Err(); err != nil {
		fmt.Printf("Scan redis keys error: %v\n", err)
		return
	}

	// Batch delete if keys found
	if len(keys) > 0 {
		batchSize := 1000
		for i := 0; i < len(keys); i += batchSize {
			end := i + batchSize
			if end > len(keys) {
				end = len(keys)
			}
			if err = db.Redis().Del(ctx, keys[i:end]...).Err(); err != nil {
				fmt.Printf("Delete redis keys error: %v\n", err)
				return
			}
		}
	}
	return
}

/*--------------------------------------------新闻------------------------------------------------------*/
// 更新实时新闻
// 参数: source - 新闻来源；items - 新闻数据列表
// 返回值: err 错误信息；成功时返回 nil
// 异常: Redis 写入失败时返回错误
func (this *modelComp) updateRealTimeNews(source string, items []*pb.DBRealTimeGlobalNews) (err error) {
	var (
		redisPip = db.Redis().Pipeline()
		item     *pb.DBRealTimeGlobalNews
		val      []byte
	)
	for _, item = range items {
		// 去重检查
		if db.Redis().SIsMember(context.Background(), "collection:news:seen", item.Url).Val() {
			continue
		}

		if val, err = json.Marshal(item); err != nil {
			continue
		}
		// 插入到队列
		redisPip.RPush(context.Background(), fmt.Sprintf("%s:%s", comm.Redis_RealtimeNewsQueue, source), val)
		// 记录已处理
		redisPip.SAdd(context.Background(), "collection:news:seen", item.Url)
	}
	_, err = redisPip.Exec(context.Background())
	if err != nil {
		this.module.Errorf("批量执行股票实时价格队列更新失败 err:%v\n", err)
	}
	return
}

/*--------------------------------------------市场数据------------------------------------------------------*/
// 更新市场实时指数
func (this *modelComp) updateRealTimeIndexs(items []*pb.DBMarketIndexRealTimeItem) (err error) {
	var (
		redisPip = db.Redis().Pipeline()
		item     *pb.DBMarketIndexRealTimeItem
		val      []byte
	)
	for _, item = range items {
		if val, err = json.Marshal(item); err != nil {
			this.module.Errorf("序列化股票实时价格失败 code:%s err:%v\n", item.Code, err)
			continue
		}
		// 插入到队列
		redisPip.RPush(context.Background(), fmt.Sprintf("%s:%s", comm.Redis_RealtimeIndexQueue, item.Code), val)
	}

	_, err = redisPip.Exec(context.Background())
	if err != nil {
		this.module.Errorf("批量执行股票实时价格队列更新失败 err:%v\n", err)
	}
	return
}

/*--------------------------------------------股票数据------------------------------------------------------*/
/*
更新股票实时行情数据
参数: items - 股票实时行情数据列表
返回值: err 错误信息；成功时返回 nil
异常: Redis 写入失败时返回错误
*/
func (this *modelComp) updateRealTimeStock(items []*pb.DBStockRealTimeItem) (err error) {
	var (
		redisPip = db.Redis().Pipeline()
		item     *pb.DBStockRealTimeItem
		val      []byte
	)
	for _, item = range items {
		if val, err = json.Marshal(item); err != nil {
			this.module.Errorf("序列化股票实时价格失败 code:%s err:%v\n", item.Code, err)
			continue
		}
		// 插入到队列
		redisPip.RPush(context.Background(), fmt.Sprintf("%s:%s", comm.Redis_RealtimeStockQueue, item.Code), val)
	}

	_, err = redisPip.Exec(context.Background())
	if err != nil {
		this.module.Errorf("批量执行股票实时价格队列更新失败 err:%v\n", err)
	}
	return
}

// 更新股票日K线数据（ZSet 按时间戳去重/更新）
// 参数: symbol - 股票符号；period - 周期（如 day）；items - 股票日K线数据列表
// 返回值: err 错误信息；成功时返回 nil
// 异常: Redis 写入失败时返回错误
func (this *modelComp) updateStockDayHit(symbol string, period string, items []*pb.DBStockBar) (err error) {
	var (
		ctx      = context.Background()
		redisPip = db.Redis().TxPipeline() // 使用事务管道，保证操作的原子性
		key      = fmt.Sprintf("%s:%s:%s", comm.Redis_HitStockQueue, symbol, period)
		item     *pb.DBStockBar
		val      []byte
		score    float64
		t        time.Time
		scoreStr string
	)
	for _, item = range items {
		if val, err = json.Marshal(item); err != nil {
			this.module.Errorf("序列化股票K线数据失败 symbol:%s err:%v\n", item.Symbol, err)
			continue
		}
		// 解析日期字符串为时间戳 (支持 YYYYMMDD 或 YYYY-MM-DD)
		// 优先尝试 YYYYMMDD (Proto定义的标准格式)
		t, err = time.Parse("20060102", item.Date)
		if err != nil {
			// 尝试 YYYY-MM-DD
			t, err = time.Parse("2006-01-02", item.Date)
			if err != nil {
				this.module.Errorf("解析股票K线日期失败 symbol:%s date:%s err:%v\n", item.Symbol, item.Date, err)
				continue
			}
		}
		score = float64(t.Unix())
		scoreStr = strconv.FormatFloat(score, 'f', -1, 64)

		// 覆盖模式：先删除同分值的旧数据，确保相同时间点只有一条记录
		// 在 TxPipeline 中，ZRemRangeByScore 和 ZAdd 会按顺序在事务中执行
		redisPip.ZRemRangeByScore(ctx, key, scoreStr, scoreStr)

		// 以时间戳作为 score
		redisPip.ZAdd(ctx, key, redis.Z{Score: score, Member: val})
	}

	_, err = redisPip.Exec(ctx)
	if err != nil {
		this.module.Errorf("批量执行股票K线数据ZSet更新失败 err:%v\n", err)
	}
	return
}
