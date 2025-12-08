package comm

import "lego_trader/lego/core"

// 服务定义
const (
	Service_Gateway = "gateway" //网关服务 可多开
	Service_Home    = "home"    //大厅服务 运行一些公用接口
	Service_Api     = "api"     //渠道接口服
)

// 服务组件名称
const (
	SC_ServiceHttpRouteComp core.S_Comps = "SC_HttpRouteComp" //服务组件 消息路由组件
)

// 模块名定义处
const (
	ModuleGate     core.M_Modules = "gateway"  //gate模块 网关服务模块
	ModuleApi      core.M_Modules = "api"      //gate模块 网关服务模块
	ModuleUser     core.M_Modules = "user"     //gate模块 网关服务模块
	ModuleAuth     core.M_Modules = "auth"     //gate模块 网关服务模块
	ModuleChat     core.M_Modules = "chat"     //gate模块 网关服务模块
	ModuleMcp      core.M_Modules = "mcp"      //gate模块 网关服务模块
	ModuleMusic    core.M_Modules = "music"    //gate模块 网关服务模块
	ModuleEchomeet core.M_Modules = "echomeet" //会议记录模块
	ModuleRecord   core.M_Modules = "record"   //gate模块 网关服务模块
	ModulePay      core.M_Modules = "pay"      //gate模块 网关服务模块
)

const (
	Rpc_GatewayHttpRoute core.Rpc_Key = "Rpc_GatewayHttpRoute" //Http网关路由
)

// 数据表名定义处
const (
	TableUser         = "user"           //用户表
	TableStockDayHist = "stock_day_hist" //股票日历史数据表
	TableUserStock    = "user_stock"     //用户股票持仓表
)

// 对象池定义
const (
	Pool_UserSession = "Pool_UserSession" //对象此 comm.UserSession
)

// 对象池定义
const (
	Redis_Verification = "Verification" //验证码
)

// RPC服务接口定义处
const ( //Rpc
	Rpc_ModifyAppConifg core.Rpc_Key = "Rpc_ModifyAppConifg" //修改app配置

)
