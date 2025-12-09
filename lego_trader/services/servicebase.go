package services

import (
	"lego_trader/lego/base/rpcx"
	"lego_trader/lego/core"
)

// 基础服务对象
type ServiceBase struct {
	rpcx.RPCXService
}

func (this *ServiceBase) Init(service core.IService) (err error) {
	if err = this.RPCXService.Init(service); err != nil {
		return
	}
	return
}

// 初始化相关系统
func (this *ServiceBase) InitSys() {
	this.RPCXService.InitSys()
}
