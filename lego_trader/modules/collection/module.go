package collection

import (
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/modules"
	"lego_trader/pb"
)

func NewModule() *Collection {
	return &Collection{}
}

/*
收藏模块
集合模块
提供集合数据 股票, 基金, 指数等
*/
type Collection struct {
	modules.ModuleBase
	model   *modelComp
	akshare *stockAkshareComp
	timer   *timerComp
}

func (this *Collection) GetType() core.M_Modules {
	return comm.ModuleCollection
}

func (this *Collection) NewOptions() (options core.IModuleOptions) {
	return new(Options)
}

func (this *Collection) Init(service core.IService, module core.IModule, options core.IModuleOptions) (err error) {
	this.ModuleBase.Init(service, module, options)
	return
}

func (this *Collection) OnInstallComp() {
	this.ModuleBase.OnInstallComp()
	this.model = this.RegisterComp(new(modelComp)).(*modelComp)
	this.akshare = this.RegisterComp(new(stockAkshareComp)).(*stockAkshareComp)
	this.timer = this.RegisterComp(new(timerComp)).(*timerComp)
}

func (this *Collection) RPC_InitStock(code string) (err error) {
	this.ModuleBase.Start()
	return
}

/*
获取个股新闻（带去重）
参数: symbol - 股票代码
返回值: items - 新闻列表; err - 错误信息
说明: 查询指定股票的新闻，并过滤掉已存在的新闻
*/
func (this *Collection) RPC_GetStockNews(symbol string) (items []*pb.DBStockNews, err error) {
	// 1. 获取原始新闻
	rawItems, err := this.akshare.getStockNews(symbol)
	if err != nil {
		this.Errorf("RPC_GetStockNews: get raw news failed: %v", err)
		return
	}

	if len(rawItems) == 0 {
		return
	}

	// 2. 过滤去重
	items, err = this.model.filterNewStockNews(rawItems)
	if err != nil {
		this.Errorf("RPC_GetStockNews: filter news failed: %v", err)
		return
	}

	return
}
