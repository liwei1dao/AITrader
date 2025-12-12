package services

import (
	"context"
	"fmt"
	"lego_trader/comm"

	"lego_trader/pb"
	"reflect"
	"time"

	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/lego/sys/log"
	"lego_trader/lego/sys/pools"
	"lego_trader/lego/utils/mapstructure"

	"google.golang.org/protobuf/proto"
)

// 组件参数
type CompOptions struct {
	MaxTime int32
}

func (this *CompOptions) LoadConfig(settings map[string]interface{}) (err error) {
	if settings != nil {
		err = mapstructure.Decode(settings, this)
	}
	return
}

/*
	服务网关组件 用于接收网关服务发送过来的消息
*/

func NewSocketRouteComp() comm.ISC_SocketRouteComp {
	comp := new(SCompSocketRoute)
	return comp
}

// 服务网关组件
type SCompSocketRoute struct {
	cbase.ServiceCompBase
	options    *CompOptions
	service    comm.IService         //rpc服务对象 通过这个对象可以发布服务和调用其他服务的接口
	msghandles map[string]*msghandle //处理函数的管理对象
}

// 设置服务组件名称 方便业务模块中获取此组件对象
func (this *SCompSocketRoute) GetName() core.S_Comps {
	return comm.SC_ServiceSocketRouteComp
}

func (this *SCompSocketRoute) NewOptions() (options core.ICompOptions) {
	return new(CompOptions)
}

// 组件初始化函数
func (this *SCompSocketRoute) Init(service core.IService, comp core.IServiceComp, options core.ICompOptions) (err error) {
	err = this.ServiceCompBase.Init(service, comp, options)
	this.options = options.(*CompOptions)
	this.service = service.(comm.IService)
	this.msghandles = make(map[string]*msghandle)
	return err
}

// 组件启动时注册rpc服务监听
func (this *SCompSocketRoute) Start() (err error) {
	this.service.Register(string(comm.Rpc_GatewayRoute), this.Rpc_GatewaySocketRoute) //注册网关路由接收接口
	err = this.ServiceCompBase.Start()
	return
}

// 业务模块注册用户消息处理路由
func (this *SCompSocketRoute) RegisterRoute(methodName string, comp reflect.Value, req reflect.Type, handele reflect.Method) {
	//log.Debugf("注册用户路由【%s】", methodName)
	_, ok := this.msghandles[methodName]
	if ok {
		log.Errorf("重复 注册网关消息【%s】", methodName)
		return
	}
	this.msghandles[methodName] = &msghandle{
		rcvr:    comp,
		reqtype: req,
		handle:  handele,
	}
	//注册类型池
	pools.InitTypes(req)
}

// RPC----------------------------------------------------------------------------------------------------------------------
// Rpc_GatewayRoute服务接口的接收函数
func (this *SCompSocketRoute) Rpc_GatewaySocketRoute(ctx context.Context, args *pb.Rpc_GatewaySocketRouteReq, reply *pb.Rpc_GatewaySocketRouteResp) (err error) {
	var (
		msghandle *msghandle
		session   comm.IUserSession
		ok        bool
	)
	defer func() {
		if session != nil {
			this.service.PutUserSession(session)
		}
	}()
	reply.ServicePath = fmt.Sprintf("%s/%s", this.service.GetType(), this.service.GetId())
	msghandle, ok = this.msghandles[args.MsgName]
	if ok {
		session = this.service.GetUserSession(ctx, args.Meta)
		//序列化用户消息对象
		req := pools.GetForType(msghandle.reqtype).(proto.Message)
		err = proto.Unmarshal(args.Message.GetValue(), req)
		if err != nil {
			log.Errorf("[Handle Api] msg:%s Unmarshal err:%v", args.MsgName, err)
			return err
		}
		//执行处理流
		stime := time.Now()
		handlereturn := msghandle.handle.Func.Call([]reflect.Value{msghandle.rcvr, reflect.ValueOf(session), reflect.ValueOf(req)})
		errdata := handlereturn[0]
		if !errdata.IsNil() { //处理返货错误码 返回用户错误信息
			//data, _ := anypb.New(errdata.(proto.Message))
			reply.ErrorData = errdata.Interface().(*pb.ErrorData)
			// log.Errorf("[Handle Api] t:%v m:%s req:%v reply:%v", time.Since(stime), method, msg, reply)
			log.Error("[Handle Api]",
				log.Field{Key: "t", Value: time.Since(stime).Milliseconds()},
				log.Field{Key: "m", Value: args.MsgName},
				log.Field{Key: "uid", Value: session.GetUserId()},
				log.Field{Key: "req", Value: req},
				log.Field{Key: "reply", Value: reply.String()},
			)
		} else {
			reply.Reply = session.Polls()
			reply.ChangeMeta = session.GetChangeMeta()
			// log.Debugf("[Handle Api] t:%v m:%s uid:%s req:%v reply:%v", time.Since(stime), method, args.UserId, msg, reply)
			nt := time.Since(stime).Milliseconds()
			if this.options.MaxTime == 0 || nt < int64(this.options.MaxTime) {
				log.Debug("[Handle Api]",
					log.Field{Key: "t", Value: time.Since(stime).Milliseconds()},
					log.Field{Key: "m", Value: args.MsgName},
					log.Field{Key: "uid", Value: session.GetUserId()},
					log.Field{Key: "req", Value: req},
					log.Field{Key: "reply", Value: reply.String()},
				)
			} else {
				log.Error("[Handle Api]",
					log.Field{Key: "t", Value: time.Since(stime).Milliseconds()},
					log.Field{Key: "m", Value: args.MsgName},
					log.Field{Key: "uid", Value: session.GetUserId()},
					log.Field{Key: "req", Value: req},
					log.Field{Key: "reply", Value: reply.String()},
				)
			}
		}
	} else { //未找到消息处理函数
		log.Errorf("[Handle Api] no found handle %s", args.MsgName)
		reply.ErrorData = &pb.ErrorData{
			Code:    pb.ErrorCode_ReqParameterError,
			Message: fmt.Sprintf("[Handle Api] no found handle %s", args.MsgName),
		}
	}
	return nil
}
