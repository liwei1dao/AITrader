package collection

import (
	"context"
	"encoding/json"
	"fmt"
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
	"lego_trader/sys/db"
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
		if val, err = json.Marshal(item); err != nil {
			continue
		}
		// 插入到队列
		redisPip.RPush(context.Background(), fmt.Sprintf("%s:%s", comm.Redis_RealtimeNewsQueue, source), val)
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
