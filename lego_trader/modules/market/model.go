package market

import (
	"context"
	"fmt"
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
	"lego_trader/sys/db"

	"github.com/redis/go-redis/v9"
)

// 代理模型
type modelComp struct {
	cbase.ModuleCompBase
	module *Market
}

// 组件初始化接口
func (this *modelComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, opt core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, opt)
	this.module = module.(*Market)

	return
}

// GetMarketSpot 获取市场股票指数
// 参数: codes - 股票指数代码列表
// 返回值: items - 股票指数信息列表；err - 错误信息；成功时err为nil
// 异常: Redis查询失败时返回错误
func (this *modelComp) getMarketSpot(codes []string) (items []*pb.DBMarketSpotItem, err error) {
	var (
		ctx      = context.Background()
		redisPip = db.Redis().Pipeline()
		cmdItems = make(map[string]*redis.MapStringStringCmd)
	)
	for _, v := range codes {
		cmdItems[v] = redisPip.HGetAll(ctx, fmt.Sprintf("%s:%s", comm.Redis_MarketSpot, v))
	}
	_, err = redisPip.Exec(ctx)
	if err != nil {
		return
	}
	for _, v := range cmdItems {
		item := &pb.DBMarketSpotItem{}
		if err = v.Scan(item); err != nil {
			return
		}
		items = append(items, item)
	}
	return
}
