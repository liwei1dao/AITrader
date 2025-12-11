package gateway

import (
	"lego_trader/comm"
	"lego_trader/lego/base"
	"lego_trader/lego/core"
	"lego_trader/lego/sys/log"
	"lego_trader/modules"
)

func NewModule() core.IModule {
	m := new(Gateway)
	return m
}

type Gateway struct {
	modules.ModuleBase
	options *Options
	service base.IRPCXService
	agents  *AgentsComp //客户端websocket连接管理
	gin     *ginComp    //websocket服务 监听websocket连接
}

func (this *Gateway) GetType() core.M_Modules {
	return comm.ModuleGateway
}
func (this *Gateway) NewOptions() (options core.IModuleOptions) {
	return new(Options)
}
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
	return
}

// OnInstallComp 装备组件
func (this *Gateway) OnInstallComp() {
	this.ModuleBase.OnInstallComp()
	this.agents = this.RegisterComp(new(AgentsComp)).(*AgentsComp)
	this.gin = this.RegisterComp(new(ginComp)).(*ginComp)
}

// Connect 有新的连接对象进入
func (this *Gateway) Connect(a IAgent) {
	this.Debug("have new connect", log.Field{Key: "SessionId", Value: a.SessionId()})
	this.agents.Connect(a)
}

// DisConnect 有用户断开连接
func (this *Gateway) DisConnect(a IAgent) {
	this.Debug("have new disconnect", log.Field{Key: "SessionId", Value: a.SessionId()})
	this.agents.DisConnect(a)
}
