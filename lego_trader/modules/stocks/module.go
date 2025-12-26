package stocks

import (
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/modules"
)

func NewModule() *Stock {
	return &Stock{}
}

type Stock struct {
	modules.ModuleBase
	api   *apiComp
	model *modelComp
}

func (this *Stock) GetType() core.M_Modules {
	return comm.ModuleStock
}

func (this *Stock) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	if err = this.ModuleBase.Init(service, module, options); err != nil {
		return
	}
	return
}

func (this *Stock) OnInstallComp() {
	this.ModuleBase.OnInstallComp()
	this.api = this.RegisterComp(new(apiComp)).(*apiComp)
	this.model = this.RegisterComp(new(modelComp)).(*modelComp)
}
