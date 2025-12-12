package db

import (
	"context"
	"crypto/tls"
	"lego_trader/lego/sys/log"
	"lego_trader/lego/sys/mysql"

	"github.com/redis/go-redis/v9"
)

func newSys(options *Options) (sys *DB, err error) {
	sys = &DB{
		options: options,
	}
	if err = sys.init(); err != nil {
		return
	}
	return
}

type DB struct {
	options *Options
	mysql   mysql.ISys
	redis   redis.UniversalClient
}

func (this *DB) init() (err error) {
	rconf := &redis.UniversalOptions{
		Addrs:    this.options.RedisAddr,
		Password: this.options.RedisPassword, // 如果有密码
		DB:       this.options.RedisDB,
	}
	if this.options.RedisTLS {
		rconf.TLSConfig = &tls.Config{}
	}
	// 使用集群模式
	this.redis = redis.NewUniversalClient(rconf)

	_, err = this.redis.Ping(context.Background()).Result()
	if err != nil {
		this.options.Log.Error(err.Error(), log.Field{Key: "options", Value: this.options})
		return
	}
	if this.mysql, err = mysql.NewSys(
		mysql.SetMySQLDsn(this.options.MysqlDNS),
	); err != nil {
		this.options.Log.Error(err.Error(), log.Field{Key: "options", Value: this.options})
		return
	}
	return
}

func (this *DB) Mysql() mysql.ISys {
	return this.mysql
}

func (this *DB) Redis() redis.UniversalClient {
	return this.redis
}
