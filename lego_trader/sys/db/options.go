package db

import (
	"errors"

	"lego_trader/lego/sys/log"
	"lego_trader/lego/utils/mapstructure"
)

type Option func(*Options)
type Options struct {
	Debug         bool //日志是否开启
	Log           log.ILogger
	MysqlDNS      string   //平台MySql 数据库
	RedisAddr     []string //平台Rdis 的集群地址
	RedisPassword string   //平台Rdis 密码
	RedisTLS      bool     //平台Rdis 是否开启tls
	RedisDB       int      //平台Rdis DB
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

func SetMysqlUrl(v string) Option {
	return func(o *Options) {
		o.MysqlDNS = v
	}
}

func SetRedisAddr(v []string) Option {
	return func(o *Options) {
		o.RedisAddr = v
	}
}

func SetRedisPassword(v string) Option {
	return func(o *Options) {
		o.RedisPassword = v
	}
}

func SetRedisTLS(v bool) Option {
	return func(o *Options) {
		o.RedisTLS = v
	}
}

func SetRedisDB(v int) Option {
	return func(o *Options) {
		o.RedisDB = v
	}
}

func newOptions(config map[string]interface{}, opts ...Option) (options *Options, err error) {
	options = &Options{}
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
	options = &Options{}
	for _, o := range opts {
		o(options)
	}
	if options.Log = log.NewTurnlog(options.Debug, log.Clone("sys.db", 3)); options.Log == nil {
		err = errors.New("log is nil")
	}
	return
}
