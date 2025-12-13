package collection

import (
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
	"lego_trader/sys/akshare"
)

/*
市场组件
提供股票数据
使用akshare库获取股票数据
*/
type marketAkshareComp struct {
	cbase.ModuleCompBase
	module *Collection
}

func (this *marketAkshareComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*Collection)
	return
}

// GetStockZhIndexSpot 读取沪深主要指数的实时数据并写入Redis
// 参数: 无
// 返回值: 错误信息；成功时返回nil
// 异常: 上游AkShare访问失败、JSON序列化失败、Redis写入失败时返回错误
func (this *marketAkshareComp) GetStockZhIndexSpot() (err error) {
	var (
		records []akshare.IndexSpotRecord
	)
	records, err = akshare.GetStockZhIndexSpot()
	if err != nil {
		return
	}
	for _, v := range records {
		this.module.model.UpdateMarketSpot(&pb.DBMarketSpotItem{
			Code:      v.Code,
			Name:      v.Name,
			Last:      v.Last,
			ChangePct: v.ChangePct,
			TurnOver:  v.TurnOver,
		})
	}
	return
}
