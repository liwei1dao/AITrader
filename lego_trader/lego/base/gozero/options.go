package gozero

import (
	"fmt"
	"os"

	"lego_trader/lego/core"
	"lego_trader/lego/utils/container/id"
	"lego_trader/lego/utils/mapstructure"

	"gopkg.in/yaml.v2"
)

type GoZeroConfig struct {
	Port           int32
	Addr           string
	ETCDServers    []string
	UpdateInterval int32
}

type Option func(*Options)

type Options struct {
	ConfPath     string
	Version      string
	Setting      core.ServiceSttings
	GoZeroConfig GoZeroConfig
}

func SetConfPath(v string) Option {
	return func(o *Options) { o.ConfPath = v }
}

func SetVersion(v string) Option {
	return func(o *Options) { o.Version = v }
}

func newOptions(option ...Option) *Options {
	options := &Options{ConfPath: "conf/cluster.yaml"}
	for _, o := range option {
		o(options)
	}
	yamlFile, err := os.ReadFile(options.ConfPath)
	if err != nil {
		panic(fmt.Sprintf("读取服务配置【%s】文件失败err:%v:", options.ConfPath, err))
	}
	if err = yaml.Unmarshal(yamlFile, &options.Setting); err != nil {
		panic(fmt.Sprintf("读取服务配置【%s】文件失败err:%v:", options.ConfPath, err))
	}
	if len(options.Setting.Type) == 0 || len(options.Setting.Tag) == 0 {
		panic(fmt.Sprintf("[%s] 配置缺少必要配置: %+v", options.ConfPath, options))
	}
	if len(options.Setting.Id) == 0 {
		options.Setting.Id = fmt.Sprintf("%s-%s", options.Setting.Type, id.NewXId())
	}
	if err = mapstructure.Decode(options.Setting.Exte, &options.GoZeroConfig); err != nil {
		panic(fmt.Sprintf("[%s] 配置缺少必要配置 Exte: %+v", options.ConfPath, options))
	}
	return options
}
