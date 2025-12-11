package base

import (
    "context"
    "lego_trader/lego/core"

    "github.com/smallnest/rpcx/client"
    pproto "google.golang.org/protobuf/proto"
)

type Result struct {
	Index  string
	Result interface{}
	Err    error
}

type ISingleService interface {
	core.IService
}

type IClusterServiceBase interface {
	core.IService
	GetTag() string //获取集群标签
}

type IRPCXService interface {
    IClusterServiceBase
    Register(name string, fn interface{}) (err error)
    RpcCall(ctx context.Context, servicePath string, serviceMethod string, args interface{}, reply interface{}) (err error)
    RpcGo(ctx context.Context, servicePath string, serviceMethod string, args interface{}, reply interface{}, done chan *client.Call) (call *client.Call, err error)
    RpcBroadcast(ctx context.Context, servicePath string, serviceMethod string, args interface{}, reply interface{}) (err error)
}

type IGoZeroService interface {
    IClusterServiceBase
    Register(name string, fn interface{}) (err error)
    RpcCall(ctx context.Context, servicePath string, serviceMethod string, args pproto.Message, reply pproto.Message) (err error)
    RpcBroadcast(ctx context.Context, servicePath string, serviceMethod string, args pproto.Message, reply pproto.Message) (err error)
}
