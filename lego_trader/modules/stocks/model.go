package stocks

import (
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
)

// 数据模型组件
type modelComp struct {
	cbase.ModuleCompBase
	module *StockModule
}

/*
获取股票日历史数据
symbol: 股票代码 例如: SZ300001/SH600000
startDate: 开始日期
endDate: 结束日期
*/
func (this *modelComp) GetStockDayHist(symbol string, startDate, endDate string) (hist []*pb.StockBar, err error) {
	hist = make([]*pb.StockBar, 0)

	return
}
