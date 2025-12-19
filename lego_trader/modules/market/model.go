package market

import (
	"context"
	"encoding/json"
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
// 参数: 无
// 返回值: items - 股票指数信息列表；err - 错误信息；成功时err为nil
// 异常: Redis查询失败时返回错误
func (this *modelComp) getMarketRealTimeIndexs() (items []*pb.DBMarketIndexRealTimeItem, err error) {
	var (
		ctx      = context.Background()
		keys     []string
		redisPip = db.Redis().Pipeline()
		cmds     = make([]*redis.StringCmd, 0)
	)

	// 获取所有指数实时队列的键
	if keys, err = db.Redis().Keys(ctx, fmt.Sprintf("%s:*", comm.Redis_RealtimeIndexQueue)).Result(); err != nil {
		return
	}

	// 批量获取每个队列的最新数据
	for _, key := range keys {
		cmds = append(cmds, redisPip.LIndex(ctx, key, -1))
	}

	if _, err = redisPip.Exec(ctx); err != nil && err != redis.Nil {
		this.module.Errorf("Redis pipeline execution error: %v", err)
		// 不直接返回，尝试处理成功的结果
	}

	items = make([]*pb.DBMarketIndexRealTimeItem, 0, len(keys))
	for _, cmd := range cmds {
		val, err := cmd.Result()
		if err != nil {
			continue
		}

		item := &pb.DBMarketIndexRealTimeItem{}
		if err := json.Unmarshal([]byte(val), item); err != nil {
			this.module.Errorf("Unmarshal error: %v value: %s", err, val)
			continue
		}
		items = append(items, item)
	}
	err = nil
	return
}
