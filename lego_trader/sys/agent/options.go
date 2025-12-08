package agent

import (
	"errors"

	"lego_trader/lego/sys/log"
	"lego_trader/lego/utils/mapstructure"
)

type Option func(*Options)
type Options struct {
	Debug        bool //日志是否开启
	Log          log.ILogger
	BaseUrl      string // OpenAI API base URL
	Mode         string // OpenAI API mode (e.g. "chat")
	Key          string // OpenAI API key
	SystemPrompt string // System prompt for chat completions
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

func SetMode(v string) Option {
	return func(o *Options) {
		o.Mode = v
	}
}

func SetKey(v string) Option {
	return func(o *Options) {
		o.Key = v
	}
}

func newOptions(config map[string]interface{}, opts ...Option) (options *Options, err error) {
	options = &Options{
		BaseUrl: "https://api.openai.com",
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
		BaseUrl: "https://api.openai.com",
	}
	for _, o := range opts {
		o(options)
	}
	if options.Log = log.NewTurnlog(options.Debug, log.Clone("sys.db", 3)); options.Log == nil {
		err = errors.New("log is nil")
	}
	return
}
