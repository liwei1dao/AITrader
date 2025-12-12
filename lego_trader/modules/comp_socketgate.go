package modules

import (
	"fmt"
	"lego_trader/comm"
	"log"
	"reflect"
	"strings"
	"unicode"
	"unicode/utf8"

	"lego_trader/lego/base"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
)

/*
模块 网关组件 接收处理用户传递消息
*/
type MCompSocketGate struct {
	cbase.ModuleCompBase
	service base.IRPCXService //rpc服务对象
	module  core.IModule      //当前业务模块
	comp    core.IModuleComp  //网关组件自己
	scomp   comm.ISC_SocketRouteComp
}

func (this *MCompSocketGate) GateRouteComp() comm.ISC_SocketRouteComp {
	return this.scomp
}

// 组件初始化接口
func (this *MCompSocketGate) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.service = service.(base.IRPCXService)
	this.module = module
	this.comp = comp
	return
}

// 组件启动接口，启动时将自己接收用户消息的处理函数注册到services/comp_gateroute.go 对象中
func (this *MCompSocketGate) Start() (err error) {
	if err = this.ModuleCompBase.Start(); err != nil {
		return
	}
	var comp core.IServiceComp
	//注册远程路由
	if comp, err = this.service.GetComp(comm.SC_ServiceSocketRouteComp); err != nil {
		return
	}
	this.scomp = comp.(comm.ISC_SocketRouteComp)
	this.suitableMethods()
	return
}

// 反射注册相关接口道services/comp_gateroute.go 对象中
func (this *MCompSocketGate) suitableMethods() {
	typ := reflect.TypeOf(this.comp)
	for m := 0; m < typ.NumMethod(); m++ {
		method := typ.Method(m)
		mname := method.Name
		if mname == "Start" ||
			mname == "Init" ||
			mname == "Destroy" ||
			mname == "GateRouteComp" ||
			strings.HasSuffix(mname, "Check") {
			continue
		}
		this.reflectionRouteHandle(typ, method)
	}
}

// 反射注册路由处理函数
func (this *MCompSocketGate) reflectionRouteHandle(typ reflect.Type, method reflect.Method) (ret bool) {
	mtype := method.Type
	mname := method.Name
	if method.PkgPath != "" {
		log.Panicf("模块[%s] 方法[%s] 非导出方法，无法注册为路由处理函数", this.module.GetType(), mname)
		return
	}
	if mtype.NumIn() != 3 {
		log.Panicf("模块[%s] 方法[%s] 入参数量[%d] 不符合要求，期望为3个参数", this.module.GetType(), mname, mtype.NumIn())
		return
	}
	sessionType := mtype.In(1)
	if !sessionType.Implements(typeOfSession) {
		log.Panicf("模块[%s] 方法[%s] 第2个参数类型[%s] 未实现Session接口", this.module.GetType(), mname, sessionType.String())
		return
	}
	reqType := mtype.In(2)
	if !reqType.Implements(typeOfMessage) {
		log.Panicf("模块[%s] 方法[%s] 第3个参数类型[%s] 未实现Message接口", this.module.GetType(), mname, reqType.String())
		return
	}

	if mtype.NumOut() != 1 {
		log.Panicf("模块[%s] 方法[%s] 返回值数量[%d] 不符合要求，期望为1个返回值", this.module.GetType(), mname, mtype.NumOut())
		return
	}
	returnDataType := mtype.Out(0)
	if returnDataType != typeOfErrorData {
		log.Panicf("模块[%s] 方法[%s] 返回值类型[%s] 不符合要求，期望为error类型", this.module.GetType(), mname, returnDataType.String())
		return
	}

	//注册路由函数
	this.scomp.RegisterRoute(fmt.Sprintf("%s.%s", this.module.GetType(), strings.ToLower(mname)), reflect.ValueOf(this.comp), reqType, method)

	return true
}

func (this *MCompSocketGate) isExportedOrBuiltinType(t reflect.Type) bool {
	for t.Kind() == reflect.Ptr {
		t = t.Elem()
	}
	return this.isExported(t.Name()) || t.PkgPath() == ""
}

func (this *MCompSocketGate) isExported(name string) bool {
	rune, _ := utf8.DecodeRuneInString(name)
	return unicode.IsUpper(rune)
}
