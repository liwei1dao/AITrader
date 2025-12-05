package akshare

import (
	"errors"

	"lego_trader/lego/sys/log"
	"lego_trader/lego/utils/mapstructure"
)

type Option func(*Options)
type Options struct {
	Debug   bool //日志是否开启
	Log     log.ILogger
	BaseUrl string //akshare 基础url
}

func SetDebug(v bool) Option {
	return func(o *Options) {
		o.Debug = v
	}
}

func SetLog(v log.ILogger) Option {
	return func(o *Options) {
		o.Log = v
	}
}

func SetBaseUrl(v string) Option {
	return func(o *Options) {
		o.BaseUrl = v
	}
}

func newOptions(config map[string]interface{}, opts ...Option) (options *Options, err error) {
	options = &Options{
		BaseUrl: "http://127.0.0.1:8080",
	}
	if config != nil {
		if err = mapstructure.Decode(config, options); err != nil {
			return
		}
	}
	for _, o := range opts {
		o(options)
	}
	if options.Log = log.NewTurnlog(options.Debug, log.Clone("sys.db", 3)); options.Log == nil {
		err = errors.New("log is nil")
	}
	return
}

func newOptionsByOption(opts ...Option) (options *Options, err error) {
	options = &Options{
		BaseUrl: "http://127.0.0.1:8080",
	}
	for _, o := range opts {
		o(options)
	}
	if options.Log = log.NewTurnlog(options.Debug, log.Clone("sys.db", 3)); options.Log == nil {
		err = errors.New("log is nil")
	}
	return
}
