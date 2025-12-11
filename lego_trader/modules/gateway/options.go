package gateway

import (
	"lego_trader/lego/utils/mapstructure"
	"lego_trader/modules"
)

/*
网关模块 参数定义
*/

type (
	Options struct {
		modules.Options
		GinDebug   bool //web引擎日志开关
		ListenPort int  //websocket 监听端口
	}
)

// LoadConfig 配置文件序列化为Options
func (this *Options) LoadConfig(settings map[string]interface{}) (err error) {
	if settings != nil {
		if err = this.Options.LoadConfig(settings); err != nil {
			return
		}
		if err = mapstructure.Decode(settings, this); err != nil {
			return
		}
	}
	return
}
