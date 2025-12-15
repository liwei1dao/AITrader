package news

import (
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/modules"
)

/*
新闻模块
提供新闻数据 股票新闻, 指数新闻, 要闻等
*/

func NewModule() *News {
	return &News{}
}

type News struct {
	modules.ModuleBase
	api   *apiComp
	model *modelComp
}

func (this *News) GetType() core.M_Modules {
	return comm.ModuleNews
}
func (this *News) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	this.ModuleBase.Init(service, module, options)
	return
}

func (this *News) OnInstallComp() {
	this.ModuleBase.OnInstallComp()
	this.api = this.RegisterComp(new(apiComp)).(*apiComp)
	this.model = this.RegisterComp(new(modelComp)).(*modelComp)
}
