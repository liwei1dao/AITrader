package main

import (
	"flag"
	"fmt"
	"lego_trader/modules/collection"
	"lego_trader/services"
	"lego_trader/sys/akshare"
	"lego_trader/sys/db"

	"lego_trader/lego"
	"lego_trader/lego/base/rpcx"
	"lego_trader/lego/core"
	"lego_trader/lego/sys/cron"
	"lego_trader/lego/sys/log"
)

/*
服务类型:后台服务
*/
var (
	conf = flag.String("conf", "./conf/collection.yaml", "获取需要启动的服务配置文件") //启动服务的Id
)

/*服务启动的入口函数*/
func main() {
	flag.Parse()
	s := NewService(
		rpcx.SetConfPath(*conf),
		rpcx.SetVersion("1.0.0.0"),
	)
	s.OnInstallComp( //装备组件
		services.NewHttpRouteComp(),
		services.NewSocketRouteComp(),
	)
	lego.Run(s, //运行模块
		collection.NewModule(),
	)
}

func NewService(ops ...rpcx.Option) core.IService {
	s := new(Service)
	s.Configure(ops...)
	return s
}

// worker 的服务对象定义
type Service struct {
	services.ServiceBase
}

// 初始化worker需要的一些系统工具
func (this *Service) InitSys() {
	this.ServiceBase.InitSys()
	//存储系统
	if err := db.OnInit(this.GetSettings().Sys["db"]); err != nil {
		panic(fmt.Sprintf("init sys.db err: %s", err.Error()))
	} else {
		log.Infof("init sys.db success!")
	}
	if err := cron.OnInit(this.GetSettings().Sys["cron"]); err != nil {
		panic(fmt.Sprintf("init sys.cron err: %s", err.Error()))
	} else {
		log.Infof("init sys.cron success!")
	}

	if err := akshare.OnInit(this.GetSettings().Sys["akshare"]); err != nil {
		panic(fmt.Sprintf("init sys.akshare err: %s", err.Error()))
	} else {
		log.Infof("init sys.akshare success!")
	}
}
