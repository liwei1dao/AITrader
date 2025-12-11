package gateway

import (
	"net/http"

	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/lego/sys/gin"
	"lego_trader/lego/sys/gin/engine"
	"lego_trader/lego/sys/log"

	"github.com/gorilla/websocket"
)

type ginComp struct {
	cbase.ModuleCompBase
	options *Options
	server  core.IService // 服务接口
	module  *Gateway      // 网关
	gin     gin.ISys      // gin服务接口
}

// Init websocket服务初始化
func (this *ginComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	err = this.ModuleCompBase.Init(service, module, comp, options)
	this.options = options.(*Options)
	this.module = module.(*Gateway)
	this.gin, err = gin.NewSys(
		gin.SetListenPort(this.options.ListenPort),
		gin.SetDebug(this.options.GinDebug),
	)
	//游戏业务逻辑处理
	this.gin.GET("/ws", this.ws)
	return
}

// ws 升级websocket连接处理本次请求
func (this *ginComp) ws(c *engine.Context) {
	upGrader := websocket.Upgrader{
		CheckOrigin: func(r *http.Request) bool {
			return true
		},
		ReadBufferSize:  1024,
		WriteBufferSize: 1024,
	}
	if wsConn, err := upGrader.Upgrade(c.Writer, c.Request, nil); err != nil {
		log.Errorf("accept faile client:%s err:%v", c.RemoteIP(), err)
		return
	} else {
		agent := newAgent(this.module, wsConn)
		this.module.Connect(agent)
	}
}
