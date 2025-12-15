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
	return
}

// 每日开始定时器A股 每天早上9:30
func (this *timerComp) dailyOpenMarketTimer() {

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
