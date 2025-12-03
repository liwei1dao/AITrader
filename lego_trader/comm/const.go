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
	TableUser             = "user"              //用户表
	TableUserdevice       = "userdevice"        //用户设备列表
	TableRecord           = "record"            //记录表
	TableAgent            = "agent"             //智能体id
	TableMcp              = "mcp"               //Mcp服务
	TableAppConfig        = "config"            //配置项
	TableAdmin            = "adnim"             //后台用户表
	TableEchomeetTemplate = "echomeet_template" //模板表
	TableEchomeetRecord   = "echomeet_record"   //会议记录表

	TableChannelApp          = "channelapp"           //渠道包管理
	TableFactory             = "factory"              //厂商数据表
	TableProduct             = "product"              //产品表
	TableProductVersion      = "product_version"      //产品表版本管理
	TableFactoryDeliveryNote = "factory_deliverynote" //厂家出货日志表
	TableLicense             = "license"              //授权码表
	TableGoods               = "goods"                //支付商品表
	TablePayOrder            = "payorder"             //支付订单表
	TableWakeupVoice         = "wakeupvoice"          //唤醒语音表
	TableUserIntegralLog     = "integrallog"          //用户积分日志表
	TableUserStatistics      = "userstatistics"       //用户统计表

	// TableAuthCode            = "authcode"             //授权码表
	// TableFactoryDevice = "factorydevice" //厂家设备表

	TableUseRecordLog = "uselog" //用户使用统计日志
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
