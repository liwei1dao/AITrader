package user

import (
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/modules"
)

func NewModule() *User {
	return &User{}
}

type User struct {
	modules.ModuleBase
	api   *apiComp
	model *modelComp
}

func (this *User) GetType() core.M_Modules {
	return comm.ModuleUser
}

func (this *User) NewOptions() (options core.IModuleOptions) {
	return new(Options)
}

// Init 模块初始化函数
func (this *User) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	if err = this.ModuleBase.Init(service, module, options); err != nil {
		return
	}

	return
}

func (this *User) OnInstallComp() {
	this.ModuleBase.OnInstallComp()
	this.api = this.RegisterComp(new(apiComp)).(*apiComp)
	this.model = this.RegisterComp(new(modelComp)).(*modelComp)
}
