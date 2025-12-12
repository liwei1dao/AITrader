package services

import (
	"lego_trader/comm"
	"reflect"
)

var (
	httpResultTyoe reflect.Type = reflect.TypeOf(&comm.HttpResult{})
)

// 用户协议处理函数注册的反射对象
type msghandle struct {
	rcvr    reflect.Value
	reqtype reflect.Type   //消息请求类型
	handle  reflect.Method //处理函数
}
