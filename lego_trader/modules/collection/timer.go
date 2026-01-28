package collection

import (
	"context"
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/lego/sys/cron"
	"lego_trader/lego/sys/timewheel"
	"lego_trader/pb"
	"lego_trader/sys/akshare"
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
	// A股交易时间定时采集：每隔5分钟请求一次实时股票价格
	// 上午 09:30 - 09:55
	cron.AddFunc("0 30-59/5 9 * * MON-FRI", this.marketTicker)
	// 上午 10:00 - 10:55
	cron.AddFunc("0 */5 10 * * MON-FRI", this.marketTicker)
	// 上午 11:00 - 11:30
	cron.AddFunc("0 0-30/5 11 * * MON-FRI", this.marketTicker)
	// 下午 13:00 - 13:55
	cron.AddFunc("0 */5 13 * * MON-FRI", this.marketTicker)
	// 下午 14:00 - 14:55
	cron.AddFunc("0 */5 14 * * MON-FRI", this.marketTicker)
	// 下午 15:00 (收盘)
	cron.AddFunc("0 0 15 * * MON-FRI", this.marketTicker)

	// 每日凌晨清理任务（清理缓存、归档昨日K线）
	cron.AddFunc("0 0 1 * * *", this.dailyCleanAndStoreTask)

	go this.initCache()
	return
}

// 每日凌晨清理与归档任务
func (this *timerComp) dailyCleanAndStoreTask() {
	this.module.Infof("Start dailyCleanAndStoreTask...")

	// 1. 归档昨日K线数据
	// 判断昨日是否为交易日（周一至周五）
	yesterday := time.Now().AddDate(0, 0, -1)
	if yesterday.Weekday() >= time.Monday && yesterday.Weekday() <= time.Friday {
		this.archiveDailyKline(yesterday)
	}

	// 2. 清理并重建缓存（复用initCache逻辑：清理队列 -> 拉取最新快照填充）
	// 注意：此时拉取的快照是昨日收盘数据，作为今日开盘前的初始状态是合适的
	if err := this.initCache(); err != nil {
		this.module.Errorf("dailyCleanAndStoreTask initCache error: %v", err)
	}

	this.module.Infof("dailyCleanAndStoreTask finished.")
}

// 归档指定日期的K线数据
func (this *timerComp) archiveDailyKline(date time.Time) {
	dateStr := date.Format("20060102")
	this.module.Infof("Archiving daily kline for date: %s", dateStr)

	// 获取全市场实时行情（即昨日收盘数据）
	records, err := akshare.GetStockZhASpotEM()
	if err != nil {
		this.module.Errorf("archiveDailyKline GetStockZhASpotEM error: %v", err)
		return
	}

	if len(records) == 0 {
		this.module.Warnf("archiveDailyKline: no records found")
		return
	}

	// 遍历并存储
	// 注意：这里是一个比较重的操作，如果有数千只股票，建议分批或并行处理
	// 目前简单实现为串行处理，Redis 写入通常很快
	count := 0
	for _, r := range records {
		// 过滤掉无成交量或停牌的股票（可选，视需求而定，这里暂不过滤，保留全量）

		bar := &pb.DBStockBar{
			Symbol:    r.Code,
			Date:      dateStr,
			Open:      r.Open,
			High:      r.High,
			Low:       r.Low,
			Close:     r.LastPrice,
			Volume:    r.Volume,
			Amount:    r.Amount,
			ChangePct: r.ChangePct,
		}

		// 存入 Redis 历史 K 线 ZSet
		// updateStockDayHit 内部是单个 symbol 的操作
		if err := this.module.model.updateStockDayHit(r.Code, "day", []*pb.DBStockBar{bar}); err != nil {
			this.module.Errorf("archiveDailyKline updateStockDayHit error: %s, %v", r.Code, err)
		} else {
			count++
		}
	}

	this.module.Infof("Archived %d stock klines for %s", count, dateStr)
}

// 市场行情定时器：采集实时数据并写入缓存
func (this *timerComp) marketTicker() {
	// 查询一次实时股票价格
	err := this.module.akshare.getStockRealTimeSpot()
	if err != nil {
		this.module.Errorf("marketTicker error: %v", err)
	}
}

// 初始化缓存
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
