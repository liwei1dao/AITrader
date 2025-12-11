package gateway

import (
	"context"
	"fmt"
	"lego_trader/pb"
	"sync"

	"lego_trader/lego/base"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
)

/*
用户代理对象管理组件
*/

type AgentsComp struct {
	cbase.ModuleCompBase
	options *Options
	service base.IRPCXService
	module  *Gateway
	agents  *sync.Map
}

func (this *AgentsComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	err = this.ModuleCompBase.Init(service, module, comp, options)
	this.options = options.(*Options)
	this.service = service.(base.IRPCXService)
	this.module = module.(*Gateway)
	this.agents = new(sync.Map)
	return
}

func (this *AgentsComp) Start() (err error) {
	err = this.ModuleCompBase.Start()
	return
}

func (this *AgentsComp) getAgent(sid string) (agent IAgent) {
	var (
		a  any
		ok bool
	)
	if a, ok = this.agents.Load(sid); !ok {
		return
	}
	agent = a.(IAgent)
	return
}

// Connect 加入新的用户
func (this *AgentsComp) Connect(a IAgent) {
	this.agents.Store(a.SessionId(), a)
}

// DisConnect 移除断开的用户
func (this *AgentsComp) DisConnect(a IAgent) {
	this.agents.Delete(a.SessionId())
}

// SendMsgToAgent 向用户发送消息
func (this *AgentsComp) SendMsgToAgent(ctx context.Context, args *pb.Rpc_GatewaySendMsgToAgentReq, reply *pb.Rpc_GatewaySendMsgToAgentResp) error {
	this.module.Debugf("SendMsgToAgent: agent:%s msg:%v", args.UserSessionId, args.Reply)
	if a, ok := this.agents.Load(args.UserSessionId); ok {
		a.(IAgent).WriteMsgs(args.Reply...)
	} else {
		reply.ErrorData = &pb.ErrorData{
			Code:    pb.ErrorCode_UserSessionNobeing,
			Message: fmt.Sprintf("用户:%s 不存在了!", args.UserSessionId),
		}
	}
	return nil
}

// SendMsgsToAgents 向多个户发送消息
func (this *AgentsComp) SendMsgsToAgents(ctx context.Context, args *pb.Rpc_GatewaySendMsgsToAgentsReq, reply *pb.Rpc_GatewaySendMsgsToAgentsResp) (err error) {
	this.module.Debugf("SendMsgsToAgents: agents:%v msgs:%v", args.UserSessionIds, args.Reply)
	for _, v := range args.UserSessionIds {
		if a, ok := this.agents.Load(v); ok {
			agent := a.(IAgent)
			if err = agent.WriteMsgs(args.Reply...); err != nil {
				this.module.Errorln(err)
			}
		}
	}
	return nil
}

// SendMsgsToAllAgents 向所有户发送消息
func (this *AgentsComp) SendMsgsToAllAgents(ctx context.Context, args *pb.Rpc_GatewaySendMsgsToAllAgentsReq, reply *pb.Rpc_GatewaySendMsgsToAllAgentsResp) (err error) {
	this.module.Debugf("SendMsgsToAllAgents: msgs:%v", args.Reply)
	this.agents.Range(func(key, value any) bool {
		agent := value.(IAgent)
		agent.WriteMsgs(args.Reply...)
		return true
	})
	return
}

// CloseAgent 关闭某个用户
func (this *AgentsComp) CloseAgents(ctx context.Context, args *pb.Rpc_GatewayCloseAgentsReq, reply *pb.Rpc_GatewayCloseAgentsResp) error {
	for _, v := range args.UserSessionIds {
		if a, ok := this.agents.Load(v); ok {
			a.(IAgent).Close()
			this.agents.Delete(v)
		}
	}
	return nil
}
