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
	SC_ServiceSocketRouteComp core.S_Comps = "SC_SocketRouteComp" //服务组件 消息路由组件
	SC_ServiceHttpRouteComp   core.S_Comps = "SC_HttpRouteComp"   //服务组件 消息路由组件
)

// 模块名定义处
const (
	ModuleGateway    core.M_Modules = "gateway"    //gate模块 网关服务模块
	ModuleUser       core.M_Modules = "user"       //用户模块 用户服务模块
	ModuleMarket     core.M_Modules = "market"     //市场模块 市场服务模块
	ModuleCollection core.M_Modules = "collection" //收藏模块 集合模块 提供集合数据 股票, 基金, 指数等

)

const (
	Rpc_GatewayRoute     core.Rpc_Key = "Rpc_GatewayRoute"     //网关路由
	Rpc_GatewayHttpRoute core.Rpc_Key = "Rpc_GatewayHttpRoute" //Http网关路由
)

// 数据表名定义处
const (
	TableUser         = "user"           //用户表
	TableStockDayHist = "stock_day_hist" //股票日历史数据表
	TableUserStock    = "user_stock"     //用户股票持仓表
)

// Redis 键定义
const (
	Redis_MarketSpot = "marketspot" //Redis 市场指数实时数据键
	Redis_MarketNews = "marketnews" //Redis 市场要闻列表键(List)
)

// 对象池定义
const (
	Pool_UserSession = "Pool_UserSession" //对象此 comm.UserSession
)

// RPC服务接口定义处
const ( //Rpc
	Rpc_ModifyAppConifg core.Rpc_Key = "Rpc_ModifyAppConifg" //修改app配置

)

// 公用协议名 用于跨模块使用
const (
	Msg_GatewayHeartbeat   string = "gateway/heartbeat"   //网关心跳协议
	Msg_GatewayErrornotify string = "gateway/errornotify" //网关错误推送
	Msg_UserLogin          string = "user/login"          //用户登录协议
)
