package news

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
		Source string `mapstructure:"source"`
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
