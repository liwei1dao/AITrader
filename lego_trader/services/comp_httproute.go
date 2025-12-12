package services

import (
	"context"
	"fmt"
	"lego_trader/comm"
	"lego_trader/pb"
	"reflect"
	"time"

	json "github.com/json-iterator/go"

	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/lego/sys/log"
	"lego_trader/lego/sys/pools"
)

/*
	服务网关组件 用于接收网关服务发送过来的消息
*/

func NewHttpRouteComp() comm.ISC_HttpRouteComp {
	comp := new(SCompHttpRoute)
	return comp
}

// 服务网关组件
type SCompHttpRoute struct {
	cbase.ServiceCompBase

	service    comm.IService         //rpc服务对象 通过这个对象可以发布服务和调用其他服务的接口
	msghandles map[string]*msghandle //处理函数的管理对象
}

// 设置服务组件名称 方便业务模块中获取此组件对象
func (this *SCompHttpRoute) GetName() core.S_Comps {
	return comm.SC_ServiceHttpRouteComp
}

// 组件初始化函数
func (this *SCompHttpRoute) Init(service core.IService, comp core.IServiceComp, options core.ICompOptions) (err error) {
	err = this.ServiceCompBase.Init(service, comp, options)
	this.service = service.(comm.IService)
	this.msghandles = make(map[string]*msghandle)
	pools.InitTypes(httpResultTyoe)
	return err
}

// 组件启动时注册rpc服务监听
func (this *SCompHttpRoute) Start() (err error) {
	this.service.Register(string(comm.Rpc_GatewayHttpRoute), this.Rpc_GatewayHttpRoute) //注册网关路由接收接口
	err = this.ServiceCompBase.Start()
	return
}

// 业务模块注册用户消息处理路由
func (this *SCompHttpRoute) RegisterRoute(methodName string, comp reflect.Value, msg reflect.Type, handele reflect.Method) {
	log.Debugf("注册用户路由【%s】", methodName)
	_, ok := this.msghandles[methodName]
	if ok {
		log.Errorf("重复 注册网关消息【%s】", methodName)
		return
	}
	this.msghandles[methodName] = &msghandle{
		rcvr:    comp,
		reqtype: msg,
		handle:  handele,
	}
	//注册类型池
	pools.InitTypes(msg)
}

// Rpc_GatewayRoute服务接口的接收函数
func (this *SCompHttpRoute) Rpc_GatewayHttpRoute(ctx context.Context, args *pb.Rpc_GatewayHttpRouteReq, reply *pb.Rpc_GatewayHttpRouteResp) (err error) {
	var (
		msghandle  *msghandle
		session    comm.IUserSession
		msg        interface{}
		httpResult *comm.HttpResult = pools.GetForType(httpResultTyoe).(*comm.HttpResult)
		errordata  *pb.ErrorData
		ok         bool
	)
	defer func() {
		pools.PutForType(httpResultTyoe, httpResult)
		if session != nil {
			this.service.PutUserSession(session)
		}
	}()
	msghandle, ok = this.msghandles[args.MsgName]
	if ok {
		session = this.service.GetUserSession(ctx, args.Meta)

		//序列化用户消息对象
		msg = pools.GetForType(msghandle.reqtype)
		if len(args.Message) > 0 {
			if err = json.Unmarshal(args.Message, msg); err != nil {
				log.Errorf("[Handle Api] UserMessage:%s Unmarshal err:%v", args.MsgName, err)
				return err
			}
		}
		//执行处理流
		stime := time.Now()
		handlereturn := msghandle.handle.Func.Call([]reflect.Value{msghandle.rcvr, reflect.ValueOf(session), reflect.ValueOf(msg)})
		errdata := handlereturn[1]
		if !errdata.IsNil() { //处理返货错误码 返回用户错误信息
			errordata = errdata.Interface().(*pb.ErrorData)
			httpResult.Code = errordata.Code
			httpResult.Message = errordata.Message
			httpResult.Data = nil
			log.Error("[Handle Api]",
				log.Field{Key: "t", Value: time.Since(stime).Milliseconds()},
				log.Field{Key: "m", Value: args.MsgName},
				log.Field{Key: "meta", Value: args.Meta},
				log.Field{Key: "req", Value: msg},
				log.Field{Key: "reply", Value: httpResult},
			)
		} else {
			httpResult.Code = pb.ErrorCode_Success
			httpResult.Message = "Success"
			httpResult.Data = handlereturn[0].Interface()
			log.Debug("[Handle Api]",
				log.Field{Key: "t", Value: time.Since(stime).Milliseconds()},
				log.Field{Key: "m", Value: args.MsgName},
				log.Field{Key: "meta", Value: args.Meta},
				log.Field{Key: "req", Value: msg},
				log.Field{Key: "reply", Value: httpResult},
			)
		}
	} else { //未找到消息处理函数
		log.Errorf("[Handle Api] no found handle %s", args.MsgName)
		httpResult.Code = pb.ErrorCode_NoFindServiceHandleFunc
		httpResult.Message = fmt.Sprintf("[Handle Http] no found handle %s", args.MsgName)
		httpResult.Data = nil
	}
	reply.ContentType = "application/json"
	reply.Body, err = json.Marshal(httpResult)
	return nil
}
