package gateway

import (
	"lego_trader/lego/base"
	"lego_trader/modules"
	"lego_trader/pb"
	"net/url"
	"reflect"
)

const (
	Msg_GatewayHeartbeat   string = "gateway.heartbeat"   //网关心跳协议
	Msg_GatewayErrornotify string = "gateway.errornotify" //网关错误推送
	Msg_UserLogin          string = "user.sgin"           //用户登录协议
)

var (
	socketReqTyoe, socketRespTyoe reflect.Type = reflect.TypeOf(&pb.Rpc_GatewaySocketRouteReq{}), reflect.TypeOf(&pb.Rpc_GatewaySocketRouteResp{})
	httpReqTyoe, httpRespTyoe     reflect.Type = reflect.TypeOf(&pb.Rpc_GatewayHttpRouteReq{}), reflect.TypeOf(&pb.Rpc_GatewayHttpRouteResp{})
)

type (
	IAgent interface {
		SessionId() string
		UserId() string
		IP() string
		GetSessionData() url.Values
		WriteMsgs(msgs ...*pb.SocketMessage) (err error)
		WriteBytes(data []byte) (err error)
		HandleMessage(msg *pb.SocketMessage) (err error)
		Close() //主动关闭接口
	}
	IGateway interface {
		modules.IModule
		Service() base.IRPCXService
		Connect(a IAgent)
		DisConnect(a IAgent)
	}
)
