package gateway

import (
	"lego_trader/modules"

	"lego_trader/lego/utils/mapstructure"
)

type (
	Options struct {
		modules.Options
	}
)

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
