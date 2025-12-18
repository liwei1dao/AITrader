package collection

import (
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/lego/sys/cron"
	"lego_trader/lego/sys/timewheel"
)

type timerComp struct {
	cbase.ModuleCompBase
	module *Collection
	// 定时轮任务句柄
	marketSpotTask *timewheel.Task
	marketNewsTask *timewheel.Task
}

func (this *timerComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*Collection)
	return
}

func (this *timerComp) Start() (err error) {
	this.ModuleCompBase.Start()
	//开市定时器A股 每天早上9:30
	cron.AddFunc("0 30 9 * * *", this.dailyOpenMarketTimer)
	//午盘休息 每天下午12:00
	cron.AddFunc("0 0 12 * * *", this.dailyNoonBreakTimer)
	//开始定时器A股 每天下午3:00
	cron.AddFunc("0 0 15 * * *", this.dailyAfternoonStartTimer)
	go this.initCache()
	return
}

// 初始化缓存
func (this *timerComp) initCache() (err error) {
	//初始化股票实时数据队列
	this.module.model.clearnCache()
	//初始化股票最新价格
	err = this.module.akshare.getStockZhASpotEM()
	if err != nil {
		this.module.Errorf("init stock zh a spot em err: %s", err.Error())
	}
	return
}

// 每日开始定时器A股 每天早上9:30
func (this *timerComp) dailyOpenMarketTimer() {
	//查询一次实时股票价格
	this.module.akshare.getStockZhASpotEM()
	return
}

// 午盘休息或停盘时停止周期任务 每天下午12:00
// 午盘休息 每天下午12:00
func (this *timerComp) dailyNoonBreakTimer() {

	return
}

// 开始定时器A股 每天下午3:00
func (this *timerComp) dailyAfternoonStartTimer() {
	return
}
