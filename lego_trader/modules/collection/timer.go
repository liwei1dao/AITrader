package collection

import (
	"context"
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/lego/sys/cron"
	"lego_trader/lego/sys/timewheel"
	"lego_trader/sys/db"
	"sync"
	"time"
)

type timerComp struct {
	cbase.ModuleCompBase
	module *Collection
	// 定时轮任务句柄
	marketSpotTask *timewheel.Task
	marketNewsTask *timewheel.Task
	// 实时采集控制
	cancelRealtime context.CancelFunc
	mu             sync.Mutex
}

func (this *timerComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*Collection)
	return
}

func (this *timerComp) Start() (err error) {
	this.ModuleCompBase.Start()

	// 1. 实时采集调度
	// 09:15 开始采集
	cron.AddFunc("0 15 9 * * *", this.startRealtimeLoop)
	// 11:30 暂停采集
	cron.AddFunc("0 30 11 * * *", this.stopRealtimeLoop)
	// 13:00 恢复采集
	cron.AddFunc("0 0 13 * * *", this.startRealtimeLoop)
	// 15:00 停止采集
	cron.AddFunc("0 0 15 * * *", this.stopRealtimeLoop)

	// 2. 盘后日K更新 (每天 15:15)
	cron.AddFunc("0 15 15 * * *", this.dailyUpdateHistory)

	// 3. 新闻采集 (每天 9:00 - 15:00, 每小时一次)
	cron.AddFunc("0 0 9-15 * * *", this.collectNews)

	go this.initCache()
	return
}

// 初始化缓存与历史数据
func (this *timerComp) initCache() (err error) {
	// 1. 历史数据全量采集 (启动时检查)
	val, _ := db.Redis().Get(context.Background(), "collection:history:init_done").Result()
	if val != "1" {
		this.module.Infof("检测到首次启动，开始全量采集历史数据...")
		// 采集从 20000101 开始至今的数据
		err = this.module.akshare.collectAllStocksHistory("20000101", time.Now().Format("20060102"))
		if err != nil {
			this.module.Errorf("全量历史数据采集失败: %v", err)
		} else {
			this.module.Infof("全量历史数据采集完成")
			db.Redis().Set(context.Background(), "collection:history:init_done", "1", 0)
		}
	}

	//清理缓存数据
	this.module.model.cleranCacheList(comm.Redis_RealtimeIndexQueue) //指数
	this.module.model.cleranCacheList(comm.Redis_RealtimeStockQueue) //股票
	this.module.model.cleranCacheList(comm.Redis_RealtimeNewsQueue)  //新闻

	//加载全球股市资讯（同花顺 stock_info_global_ths）
	err = this.module.akshare.getRealTimeNews()
	if err != nil {
		this.module.Errorf("init market news em err: %s", err.Error())
	}

	//加载指数实时数据
	err = this.module.akshare.getMarketRealTimeIndexs()
	if err != nil {
		this.module.Errorf("init market indexs em err: %s", err.Error())
	}
	//加载股票实时数据
	err = this.module.akshare.getStockRealTimeSpot()
	if err != nil {
		this.module.Errorf("init stock zh a spot em err: %s", err.Error())
	}
	return
}

// 开启实时采集循环
func (this *timerComp) startRealtimeLoop() {
	this.mu.Lock()
	defer this.mu.Unlock()

	if this.cancelRealtime != nil {
		return // 已经在运行
	}

	this.module.Infof("Starting realtime collection loop...")
	ctx, cancel := context.WithCancel(context.Background())
	this.cancelRealtime = cancel

	go func() {
		// 每 30 秒采集一次
		ticker := time.NewTicker(time.Second * 30)
		defer ticker.Stop()

		// 立即执行一次
		this.doRealtimeCollection()

		for {
			select {
			case <-ctx.Done():
				this.module.Infof("Realtime collection loop stopped.")
				return
			case <-ticker.C:
				this.doRealtimeCollection()
			}
		}
	}()
}

// 停止实时采集循环
func (this *timerComp) stopRealtimeLoop() {
	this.mu.Lock()
	defer this.mu.Unlock()

	if this.cancelRealtime != nil {
		this.module.Infof("Stopping realtime collection loop...")
		this.cancelRealtime()
		this.cancelRealtime = nil
	}
}

// 执行实时采集
func (this *timerComp) doRealtimeCollection() {
	this.module.Infof("Collecting realtime data snapshot...")
	// 采集股票实时数据
	if err := this.module.akshare.getStockRealTimeSpot(); err != nil {
		this.module.Errorf("Realtime stock collection failed: %v", err)
	}
	// 采集指数实时数据
	if err := this.module.akshare.getMarketRealTimeIndexs(); err != nil {
		this.module.Errorf("Realtime index collection failed: %v", err)
	}
}

// 每日盘后更新日K数据
func (this *timerComp) dailyUpdateHistory() {
	this.module.Infof("Starting daily history update...")
	today := time.Now().Format("20060102")
	// 采集当天的日K
	if err := this.module.akshare.collectAllStocksHistory(today, today); err != nil {
		this.module.Errorf("Daily history update failed: %v", err)
	} else {
		this.module.Infof("Daily history update completed.")
	}
}

// 定时采集新闻
func (this *timerComp) collectNews() {
	this.module.Infof("Collecting news...")
	if err := this.module.akshare.getRealTimeNews(); err != nil {
		this.module.Errorf("News collection failed: %v", err)
	}
}
