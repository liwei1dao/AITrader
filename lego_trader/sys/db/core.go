package db

import (
	"lego_trader/lego/sys/mysql"

	"github.com/redis/go-redis/v9"
)

type (
	ISys interface {
		Mysql() mysql.ISys
		Redis() redis.UniversalClient
	}
)

var defsys *DB

func OnInit(config map[string]interface{}, opt ...Option) (err error) {
	var option *Options
	if option, err = newOptions(config, opt...); err != nil {
		return
	}
	defsys, err = newSys(option)
	return
}
func NewSys(opt ...Option) (sys ISys, err error) {
	var option *Options
	if option, err = newOptionsByOption(opt...); err != nil {
		return
	}
	sys, err = newSys(option)
	return
}

func Mysql() mysql.ISys {
	return defsys.Mysql()
}
func Redis() redis.UniversalClient {
	return defsys.Redis()
}
