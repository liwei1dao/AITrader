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

// 清理缓存
func (this *modelComp) clearnCache() (err error) {
	var (
		keys []string
		ctx  = context.Background()
	)

	// Scan all keys matching the pattern
	iter := db.Redis().Scan(ctx, 0, fmt.Sprintf("%s:*", comm.Redis_StockSpotQueue), 0).Iterator()
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

// 更新实时股价
func (this *modelComp) updateDayilSpot(items []*pb.DBStockRealTimeItem) (err error) {
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
		redisPip.RPush(context.Background(), fmt.Sprintf("%s:%s", comm.Redis_StockSpotQueue, item.Code), val)
	}

	_, err = redisPip.Exec(context.Background())
	if err != nil {
		this.module.Errorf("批量执行股票实时价格队列更新失败 err:%v\n", err)
	}
	return
}

// UpdateMarketSpot 将 pb.DBStockSpotItem 以 Hash 形式写入 Redis
// 参数: item - 待写入的指数实时数据
// 返回值: 错误信息；成功时返回 nil
// 异常: Redis 写入失败时返回错误
func (this *modelComp) UpdateMarketSpot(item *pb.DBMarketSpotItem) (err error) {
	return db.Redis().HMSet(context.Background(), fmt.Sprintf("%s:%s", comm.Redis_MarketSpot, item.Code), item).Err()
}
