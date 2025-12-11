package user

import (
	"lego_trader/lego/core"
	"lego_trader/modules"
)

func NewModule() *User {
	return &User{}
}

type User struct {
	modules.ModuleBase
}

// Init 模块初始化函数
func (this *User) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	if err = this.ModuleBase.Init(service, module, options); err != nil {
		return
	}

	return
}
