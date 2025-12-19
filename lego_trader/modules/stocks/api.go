package stocks

import (
	"lego_trader/lego/core"
	"lego_trader/modules"
)

type apiComp struct {
	modules.MCompSocketGate
	module *Stock
}

// Init websocket服务初始化
func (this *apiComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	err = this.MCompSocketGate.Init(service, module, comp, options)
	this.module = module.(*Stock)
	return
}
