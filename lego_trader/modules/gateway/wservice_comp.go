package gateway

import (
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
)

type WSServiceComp struct {
	cbase.ModuleCompBase
	options *Options
	module  *Gateway // 网关
}

// Init websocket服务初始化
func (this *WSServiceComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	err = this.ModuleCompBase.Init(service, module, comp, options)
	this.options = options.(*Options)
	this.module = module.(*Gateway)
	return
}
