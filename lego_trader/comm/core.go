package comm

import (
	"context"
	"lego_trader/lego/base"
	"lego_trader/lego/core"
	"lego_trader/pb"
	"reflect"
	"strings"
)

type IService interface {
	base.IRPCXService
	GetUserSession(mate string) (session IUserSession)
	PutUserSession(session IUserSession)
}

// 服务网关组件接口定义
type ISC_SocketRouteComp interface {
	core.IServiceComp
	Rpc_GatewayRoute(ctx context.Context, args *pb.Rpc_GatewayRouteReq, reply *pb.Rpc_GatewayRouteResp) error
	RegisterRoute(methodName string, comp reflect.Value, msg reflect.Type, handle reflect.Method)
}

type ISC_HttpRouteComp interface {
	core.IServiceComp
	Rpc_GatewayHttpRoute(ctx context.Context, args *pb.Rpc_GatewayHttpRouteReq, reply *pb.Rpc_GatewayHttpRouteResp) error
	RegisterRoute(methodName string, comp reflect.Value, msg reflect.Type, handle reflect.Method)
}

// 用户会话
type IUserSession interface {
	SetSession(service IService, values string)
	GetMateToString(key string) string
	GetMateToInt64(key string) int64
	GetMateToUInt64(key string) uint64
	GetMateToInt32(key string) int32
	GetMateToFloat64(key string) float64
	SetMateForFloat64(key string, value float64)
	SetMateForInt64(key string, value int64)
	GetMateToBool(key string) bool
	GetUserId() string
	Reset()
	SetMate(name string, values string)
	SetMates(values string)
	GetMate(name string) (value string, ok bool)
	SetCache(name string, value interface{})
	GetCache(name string) (value interface{}, ok bool)
	Clone() (session IUserSession) //克隆
	GetMetas() (values string)
	GetChangeMeta() (values string)
	Polls() (msgs []*pb.SocketMessage)
}

type HttpResult struct {
	// 错误代码
	// @Description 响应结果的错误码 0 表示成功
	// @example 0
	Code pb.ErrorCode `json:"code" example:"0" description:"请求回应Code 0表示成功 非0 请求异常"`
	// 消息说明
	// @Description 响应结果的消息 请求返回的描述信息
	// @example "Success"
	Message string `json:"msg" example:"Success" description:"code 对应的描述信息"`
	// 数据部分，可能是多种类型
	// @Description 响应的数据，类型可变
	// @oneOf User Product Order
	// @example {"id": 1, "name": "John Doe"}
	Data interface{} `json:"data" description:"返回的数据对象"`
}

/*
标准化股票代码
- 参数: symbol 股票代码（支持 sz/sh 前缀或6位代码）
- 返回: market 市场（sz/sh）, code 股票代码（6位）, withPrefix 标准化后的带前缀代码（sz000001/sh600000）
*/
func NormalizeSymbol(symbol string) (market string, code string, withPrefix string) {
	s := strings.TrimSpace(symbol)
	s = strings.ToLower(s)
	if len(s) >= 2 && (s[:2] == "sz" || s[:2] == "sh") {
		market = s[:2]
		code = s[2:]
	} else if len(s) == 6 {
		code = s
		if s[0] == '6' {
			market = "sh"
		} else {
			market = "sz"
		}
	}
	if market != "" && code != "" {
		withPrefix = market + code
	} else {
		withPrefix = s
	}
	return
}
