package services

import (
	"context"
	"lego_trader/comm"
	"lego_trader/lego/base/rpcx"
	"lego_trader/lego/core"
	"lego_trader/lego/sys/pools"
)

// 基础服务对象
type ServiceBase struct {
	rpcx.RPCXService
}

func (this *ServiceBase) Init(service core.IService) (err error) {
	if err = this.RPCXService.Init(service); err != nil {
		return
	}
	pools.Add(comm.Pool_UserSession, func() comm.IUserSession { return comm.NewUserSession() })
	return
}

// 初始化相关系统
func (this *ServiceBase) InitSys() {
	this.RPCXService.InitSys()
}

func (this *ServiceBase) GetUserSession(ctx context.Context, values string) (session comm.IUserSession) {
	session = pools.Get[comm.IUserSession](comm.Pool_UserSession)
	ctx = context.WithValue(ctx, comm.ContextKey_Service, this)
	session.SetSession(ctx, values)
	return
}

func (this *ServiceBase) PutUserSession(session comm.IUserSession) {
	session.Reset()
	pools.Put(comm.Pool_UserSession, session)
}
