package collection

import (
	"context"
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

// UpdateMarketSpot 将 pb.DBStockSpotItem 以 Hash 形式写入 Redis
// 参数: item - 待写入的指数实时数据
// 返回值: 错误信息；成功时返回 nil
// 异常: Redis 写入失败时返回错误
func (this *modelComp) UpdateMarketSpot(item *pb.DBMarketSpotItem) (err error) {
	return db.Redis().HMSet(context.Background(), fmt.Sprintf("%s:%s", comm.Redis_MarketSpot, item.Code), item).Err()
}
