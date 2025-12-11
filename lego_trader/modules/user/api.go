package user

import (
	"lego_trader/lego/core"
	"lego_trader/modules"
)

type apiComp struct {
	modules.MCompSocketGate
}

// Init websocket服务初始化
func (this *apiComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	err = this.ModuleCompBase.Init(service, module, comp, options)

	return
}
