package market

import (
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/modules"
)

func NewModule() *Market {
	return &Market{}
}

/*
市场模块
提供市场数据 大盘, 小盘, 股票, 基金, 指数,快讯等
*/
type Market struct {
	modules.ModuleBase
	api   *apiComp
	model *modelComp
}

func (this *Market) GetType() core.M_Modules {
	return comm.ModuleMarket
}

// Init 模块初始化函数
func (this *Market) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	if err = this.ModuleBase.Init(service, module, options); err != nil {
		return
	}

	return
}

func (this *Market) OnInstallComp() {
	this.ModuleBase.OnInstallComp()
	this.api = this.RegisterComp(new(apiComp)).(*apiComp)
	this.model = this.RegisterComp(new(modelComp)).(*modelComp)
}
