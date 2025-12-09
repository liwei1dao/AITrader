package collection

import (
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
)

/*
收藏模块
集合模块
提供集合数据 股票, 基金, 指数等
*/
type CollectionModule struct {
	cbase.ModuleBase
}

func (this *CollectionModule) GetType() core.M_Modules {
	return comm.ModuleCollection
}
func (this *CollectionModule) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	this.ModuleBase.Init(service, module, options)
	return
}
