package collection

import (
	"context"
	"encoding/json"
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
	"lego_trader/sys/akshare"
	"lego_trader/sys/db"
)

/*
新闻组件
提供股票新闻数据
使用akshare库获取股票新闻数据
*/
type newsAkshareComp struct {
	cbase.ModuleCompBase
	module *Collection
}

// Init 组件初始化接口
// 参数: service 服务实例；module 模块实例；comp 组件实例；options 组件选项
// 返回值: err 错误信息；成功时返回 nil
// 异常: 初始化失败时返回错误
func (this *newsAkshareComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*Collection)
	return
}

// GetMarketNews 获取市场要闻（财新 stock_news_main_cx）
// 参数: 无
// 返回值: err 错误信息；成功时返回 nil
// 异常: 上游 AkShare 访问失败或解码失败时返回错误
func (this *newsAkshareComp) GetMarketNews() (err error) {
	var (
		records []akshare.StockNewsMainCxRecord
	)
	records, err = akshare.GetStockNewsMainCx()
	if err != nil {
		return
	}
	ctx := context.Background()
	redisPip := db.Redis().Pipeline()
	for _, r := range records {
		item := &pb.DBMarketNews{
			Tag:          r.Tag,
			Summary:      r.Summary,
			IntervalTime: r.IntervalTime,
			PubTime:      r.PubTime,
			Url:          r.URL,
		}
		var b []byte
		if b, err = json.Marshal(item); err != nil {
			return
		}
		redisPip.LPush(ctx, comm.Redis_MarketNews, string(b))
	}
	_, err = redisPip.Exec(ctx)
	return
}
