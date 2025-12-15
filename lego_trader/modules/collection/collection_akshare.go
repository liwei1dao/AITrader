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
	"time"
)

/*
股票组件
提供股票数据
使用akshare库获取股票数据
*/
type stockAkshareComp struct {
	cbase.ModuleCompBase
	module *Collection
}

func (this *stockAkshareComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*Collection)
	return
}

// 获取股票基本信息
func (this *stockAkshareComp) getStockBasicInfo(symbol string) (info *pb.DBStockIdentity, err error) {
	var (
		basicInfo *akshare.StockBasicInfo
	)
	info = &pb.DBStockIdentity{}

	market, _, akSymbol := comm.NormalizeSymbol(symbol)

	basicInfo, err = akshare.GetStockBasicInfo(akSymbol)
	if err != nil {
		return
	}

	info.Id = akSymbol
	info.Market = market
	if market == "sz" {
		info.Exchange = "SZSE"
	} else if market == "sh" {
		info.Exchange = "SSE"
	}
	info.Name = basicInfo.OrgShortNameCn
	info.FullName = basicInfo.OrgNameCn
	info.Currency = basicInfo.Currency
	info.Area = basicInfo.ProvincialName
	if basicInfo.ListedDate > 0 {
		info.ListDate = time.UnixMilli(basicInfo.ListedDate).Format("20060102")
	}
	if len(basicInfo.AffiliateIndustry) > 0 {
		var ind struct {
			IndCode string `json:"ind_code"`
			IndName string `json:"ind_name"`
		}
		_ = json.Unmarshal([]byte(basicInfo.AffiliateIndustry), &ind)
		if ind.IndName != "" {
			info.Industry = ind.IndName
		}
		if ind.IndCode != "" {
			info.Sector = ind.IndCode
		}
	}
	return
}

// 获取股票快照信息
func (this *stockAkshareComp) getStockFundamentalSnapshot(symbol string) (snapshot *pb.DBFundamentalSnapshot, err error) {
	market, code, akSymbol := comm.NormalizeSymbol(symbol)
	summary, err := akshare.GetStockFinancialSummary(akSymbol)
	if err != nil {
		return nil, err
	}
	snapshot = &pb.DBFundamentalSnapshot{}
	snapshot.Symbol = code
	snapshot.Market = market
	snapshot.Source = "akshare_xq"
	snapshot.Ts = time.Now().Format(time.RFC3339)
	snapshot.Period = summary.Period
	snapshot.FiscalYear = summary.FiscalYear
	snapshot.FiscalQuarter = summary.FiscalQuarter
	snapshot.Revenue = summary.Revenue
	snapshot.OperatingIncome = summary.OperatingIncome
	snapshot.NetProfit = summary.NetProfit
	snapshot.EPS = summary.EPS
	snapshot.ROE = summary.ROE
	snapshot.ROA = summary.ROA
	snapshot.GrossMargin = summary.GrossMargin
	snapshot.OperatingMargin = summary.OperatingMargin
	snapshot.NetMargin = summary.NetMargin
	snapshot.PE = summary.PE
	snapshot.PB = summary.PB
	snapshot.PS = summary.PS
	snapshot.DividendPerShare = summary.DividendPerShare
	snapshot.DividendYield = summary.DividendYield
	snapshot.FreeCashFlow = summary.FreeCashFlow
	snapshot.DebtToEquity = summary.DebtToEquity
	snapshot.CurrentRatio = summary.CurrentRatio
	snapshot.QuickRatio = summary.QuickRatio
	snapshot.TotalAssets = summary.TotalAssets
	snapshot.TotalLiabilities = summary.TotalLiabilities
	snapshot.Equity = summary.Equity
	snapshot.RevenueYoY = summary.RevenueYoY
	snapshot.NetProfitYoY = summary.NetProfitYoY
	snapshot.EPSYoY = summary.EPSYoY
	return
}

// getStockZhASpotEM 获取沪深京 A 股实时行情并写入Redis
// 参数: 无
// 返回值: err 错误信息；成功时返回 nil
// 异常: 上游 AkShare 访问失败或解码失败时返回错误
func (this *stockAkshareComp) getStockZhASpotEM() (err error) {
	var (
		records []akshare.StockZhASpotEMRecord
		items   map[string]*pb.DBStockRealTimeItem
	)
	records, err = akshare.GetStockZhASpotEM()
	if err != nil {
		return
	}

	items = make(map[string]*pb.DBStockRealTimeItem)
	for _, v := range records {
		items[v.Code] = &pb.DBStockRealTimeItem{
			Code:                 v.Code,
			Name:                 v.Name,
			LastPrice:            v.LastPrice,
			ChangePct:            v.ChangePct,
			ChangeAmt:            v.ChangeAmt,
			Open:                 v.Open,
			High:                 v.High,
			Low:                  v.Low,
			PrevClose:            v.PrevClose,
			Volume:               v.Volume,
			Amount:               v.Amount,
			Amplitude:            v.Amplitude,
			VolumeRatio:          v.VolumeRatio,
			TurnoverRate:         v.TurnoverRate,
			PeDynamic:            v.PeDynamic,
			PbRatio:              v.PbRatio,
			TotalMarketCap:       v.TotalMarketCap,
			CirculatingMarketCap: v.CirculatingMarketCap,
			PriceSpeed:           v.PriceSpeed,
			FiveMinChange:        v.FiveMinChange,
			SixtyDayChangePct:    v.SixtyDayChangePct,
			YtdChangePct:         v.YtdChangePct,
		}
	}
	return
}

// GetStockZhIndexSpot 读取沪深主要指数的实时数据并写入Redis
// 参数: 无
// 返回值: 错误信息；成功时返回nil
// 异常: 上游AkShare访问失败、JSON序列化失败、Redis写入失败时返回错误
func (this *stockAkshareComp) GetStockZhIndexSpot() (err error) {
	var (
		records []akshare.IndexSpotRecord
	)
	records, err = akshare.GetStockZhIndexSpot()
	if err != nil {
		return
	}
	for _, v := range records {
		this.module.model.UpdateMarketSpot(&pb.DBMarketSpotItem{
			Code:      v.Code,
			Name:      v.Name,
			Last:      v.Last,
			ChangePct: v.ChangePct,
			TurnOver:  v.TurnOver,
		})
	}
	return
}

// GetMarketNews 获取市场要闻（财新 stock_news_main_cx）
// 参数: 无
// 返回值: err 错误信息；成功时返回 nil
// 异常: 上游 AkShare 访问失败或解码失败时返回错误
func (this *stockAkshareComp) GetMarketNews() (err error) {
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
