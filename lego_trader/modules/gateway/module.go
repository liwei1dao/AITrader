/*
网关模块 用于调度所有外部的访问数据
*/
package gateway

import (
	"lego_trader/comm"
	"lego_trader/modules"

	"lego_trader/lego/base"
	"lego_trader/lego/core"

	"lego_trader/lego/sys/pools"
)

func NewModule() core.IModule {
	m := new(Gateway)
	return m
}

type Gateway struct {
	modules.ModuleBase
	options   *Options
	service   base.IRPCXService //rpcx服务接口 主要client->server
	wsservice *WSServiceComp    //websocket服务 监听websocket连接
}

// GetType 获取模块服务类型
func (this *Gateway) GetType() core.M_Modules {
	return comm.ModuleGate
}

// NewOptions 模块自定义参数
func (this *Gateway) NewOptions() (options core.IModuleOptions) {
	return new(Options)
}

// Service 获取rpcx服务接口
func (this *Gateway) Service() base.IRPCXService {
	return this.service
}

// Init 模块初始化函数
func (this *Gateway) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	if err = this.ModuleBase.Init(service, module, options); err != nil {
		return
	}
	this.options = options.(*Options)
	this.service = service.(base.IRPCXService)
	pools.InitTypes(httpReqTyoe, httpRespTyoe)
	return
}

// Start 模块启动函数 注册rpc服务接口提供用户相关的rpc接口服务
func (this *Gateway) Start() (err error) {
	if err = this.ModuleBase.Start(); err != nil {
		return
	}
	return
}

// OnInstallComp 装备组件
func (this *Gateway) OnInstallComp() {
	this.ModuleBase.OnInstallComp()
	this.wsservice = this.RegisterComp(new(WSServiceComp)).(*WSServiceComp)
}
