package news

import (
	"context"
	"encoding/json"
	"fmt"
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
	"lego_trader/sys/db"
)

// 数据模型组件
type modelComp struct {
	cbase.ModuleCompBase
	module *News
}

func (this *modelComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	err = this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*News)
	return
}

// getMarketNews 读取市场要闻缓存列表并返回
// 参数: 无
// 返回值: records 市场新闻列表；err 错误信息；成功时 err 为 nil
// 异常: Redis 访问失败时返回错误；JSON 解析失败的条目将被忽略
func (this *modelComp) getMarketNews(source string) (records []*pb.DBRealTimeGlobalNews, err error) {
	var (
		ctx   = context.Background()
		items []string
	)
	items, err = db.Redis().LRange(ctx, fmt.Sprintf("%s:%s", comm.Redis_RealtimeNewsQueue, source), 0, -1).Result()
	if err != nil {
		return
	}
	records = make([]*pb.DBRealTimeGlobalNews, 0, len(items))
	for _, s := range items {
		var it pb.DBRealTimeGlobalNews
		if e := json.Unmarshal([]byte(s), &it); e != nil {
			continue
		}
		records = append(records, &it)
	}
	return
}
