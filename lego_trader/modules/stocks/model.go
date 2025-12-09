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
获取股票信息
symbol: 股票代码 例如: SZ300001/SH600000
*/
func (this *modelComp) getStockIdentity(symbol string) (info *pb.DBStockIdentity, err error) {

	return
}

/*
获取股票基本面快照
symbol: 股票代码 例如: SZ300001/SH600000
*/
func (this *modelComp) getStockFundamentalSnapshot(symbol string) (snapshot *pb.DBFundamentalSnapshot, err error) {

	return
}

/*
获取股票日历史数据
symbol: 股票代码 例如: SZ300001/SH600000
startDate: 开始日期
endDate: 结束日期
*/
func (this *modelComp) getStockDayHist(symbol string, startDate, endDate string) (hist []*pb.DBStockBar, err error) {
	hist = make([]*pb.DBStockBar, 0)

	return
}

/*
获取股票新闻
symbol: 股票代码 例如: SZ300001/SH600000
startDate: 开始日期
endDate: 结束日期
*/
func (this *modelComp) getStockNews(symbol string, startDate, endDate string) (news []*pb.DBStockNews, err error) {
	news = make([]*pb.DBStockNews, 0)
	return
}
