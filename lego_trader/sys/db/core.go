package db

import (
	"lego_trader/lego/sys/mysql"
	"lego_trader/lego/sys/redis"
)

type (
	ISys interface {
		Mysql() mysql.ISys
		Redis() redis.ISys
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
func Redis() redis.ISys {
	return defsys.Redis()
}
