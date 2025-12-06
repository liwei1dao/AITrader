package db

import (
	"lego_trader/lego/sys/mysql"
	"lego_trader/lego/sys/redis"
)

func newSys(options *Options) (sys *DB, err error) {
	sys = &DB{
		options: options,
	}
	return
}

type DB struct {
	options *Options
	mysql   *mysql.ISys
	redis   *redis.ISys
}
