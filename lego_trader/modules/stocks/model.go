package stocks

import (
	"context"
	"encoding/json"
	"fmt"
	"lego_trader/comm"
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
	"lego_trader/sys/db"

	"github.com/redis/go-redis/v9"
)

// 数据模型组件
type modelComp struct {
	cbase.ModuleCompBase
	module *Stock
}

// GetMarketSpot 获取股票实时数据
// 参数: codes - 股票代码列表
// 返回值: items - 股票实时数据列表；err - 错误信息；成功时err为nil
// 异常: Redis查询失败时返回错误
func (this *modelComp) getStocksRealTimeData(codes []string) (items []*pb.DBStockRealTimeItem, err error) {
	var (
		ctx      = context.Background()
		keys     []string
		redisPip = db.Redis().Pipeline()
		cmds     = make([]*redis.StringCmd, 0)
	)

	// 批量获取每个队列的最新数据
	for _, code := range codes {
		cmds = append(cmds, redisPip.LIndex(ctx, fmt.Sprintf("%s:%s", comm.Redis_RealtimeStockQueue, code), -1))
	}

	if _, err = redisPip.Exec(ctx); err != nil && err != redis.Nil {
		this.module.Errorf("Redis pipeline execution error: %v", err)
		// 不直接返回，尝试处理成功的结果
	}

	items = make([]*pb.DBStockRealTimeItem, 0, len(keys))
	for _, cmd := range cmds {
		val, err := cmd.Result()
		if err != nil {
			continue
		}

		item := &pb.DBStockRealTimeItem{}
		if err := json.Unmarshal([]byte(val), item); err != nil {
			this.module.Errorf("Unmarshal error: %v value: %s", err, val)
			continue
		}
		items = append(items, item)
	}
	err = nil
	return
}

// GetStockIntradayChart 获取股票实时数据
// 参数: code - 股票代码
// 返回值: chart - 股票实时数据列表；err - 错误信息；成功时err为nil
// 异常: Redis查询失败时返回错误
func (this *modelComp) getStockIntradayChart(code string) (chart []*pb.DBStockRealTimeItem, err error) {
	var (
		ctx   = context.Background()
		items []string
	)
	chart = make([]*pb.DBStockRealTimeItem, 0)
	items, err = db.Redis().LRange(ctx, fmt.Sprintf("%s:%s", comm.Redis_RealtimeStockQueue, code), 0, -1).Result()
	if err != nil {
		this.module.Errorf("Redis pipeline execution error: %v", err)
		return
	}

	for _, item := range items {
		chartItem := &pb.DBStockRealTimeItem{}
		if err := json.Unmarshal([]byte(item), chartItem); err != nil {
			this.module.Errorf("Unmarshal error: %v value: %s", err, item)
			continue
		}
		chart = append(chart, chartItem)
	}
	return
}

/*
获取股票信息
code: 股票代码 例如: SZ300001/SH600000
*/
func (this *modelComp) getStockBasicInfo(code string) (info *pb.DBStockBasicInfo, err error) {
	this.module.Debugf("getStockBasicInfo code: %s", code)
	err = db.Mysql().FindOne(comm.TableStockBasicInfo, &info, "id = ?", code)
	return
}

/*
获取股票基本面快照
code: 股票代码 例如: SZ300001/SH600000
*/
func (this *modelComp) getStockOperatingSnapshot(code string) (snapshot []*pb.DBStockOperatingSnapshot, err error) {
	this.module.Debugf("getStockOperatingSnapshot code: %s", code)
	snapshot = make([]*pb.DBStockOperatingSnapshot, 0)
	err = db.Mysql().Find(comm.TableStockOperatingSnapshot, &snapshot, "symbol = ?", code)
	return
}

/*
获取股票日历史数据
code: 股票代码 例如: SZ300001/SH600000
startDate: 开始日期
endDate: 结束日期
*/
func (this *modelComp) getStockDayHist(code string, startDate, endDate string) (hist []*pb.DBStockBar, err error) {
	hist = make([]*pb.DBStockBar, 0)

	return
}

/*
获取股票新闻
code: 股票代码 例如: SZ300001/SH600000
startDate: 开始日期
endDate: 结束日期
*/
func (this *modelComp) getStockNews(code string, startDate, endDate string) (news []*pb.DBStockNews, err error) {
	news = make([]*pb.DBStockNews, 0)
	return
}
