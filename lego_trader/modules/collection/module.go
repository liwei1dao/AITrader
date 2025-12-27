package collection

import (
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/modules"
)

func NewModule() *Collection {
	return &Collection{}
}

/*
收藏模块
集合模块
提供集合数据 股票, 基金, 指数等
*/
type Collection struct {
	modules.ModuleBase
	model   *modelComp
	akshare *stockAkshareComp
	timer   *timerComp
}

func (this *Collection) GetType() core.M_Modules {
	return comm.ModuleCollection
}

func (this *Collection) NewOptions() (options core.IModuleOptions) {
	return new(Options)
}

func (this *Collection) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	this.ModuleBase.Init(service, module, options)
	return
}

func (this *Collection) OnInstallComp() {
	this.ModuleBase.OnInstallComp()
	this.model = this.RegisterComp(new(modelComp)).(*modelComp)
	this.akshare = this.RegisterComp(new(stockAkshareComp)).(*stockAkshareComp)
	this.timer = this.RegisterComp(new(timerComp)).(*timerComp)
}

func (this *Collection) RPC_InitStock(code string) (err error) {
	this.ModuleBase.Start()
	return
}
