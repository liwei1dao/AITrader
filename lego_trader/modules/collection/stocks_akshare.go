package collection

import (
	"encoding/json"
	"fmt"
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
	"lego_trader/sys/akshare"
	"strconv"
	"strings"
	"time"
)

/*
股票组件
提供股票数据
使用akshare库获取股票数据
*/
type stockAkshareComp struct {
	cbase.ModuleCompBase
	module *CollectionModule
}

func (this *stockAkshareComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*CollectionModule)
	return
}

// 处理一下 数据转换逻辑
func (this *stockAkshareComp) getStockBasicInfo(symbol string) (info *pb.DBStockIdentity, err error) {
	var (
		basicInfo *akshare.StockBasicInfo
	)
	info = &pb.DBStockIdentity{}

	market, code, akSymbol := comm.NormalizeSymbol(symbol)

	basicInfo, err = akshare.GetStockBasicInfo(akSymbol)
	if err != nil {
		return
	}

	info.Symbol = code
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

func (this *stockAkshareComp) getStockFundamentalSnapshot(symbol string) (snapshot *pb.DBFundamentalSnapshot, err error) {
	market, code, akSymbol := comm.NormalizeSymbol(symbol)
	items, err := akshare.GetStockFinancialSummary(akSymbol)
	if err != nil {
		return nil, err
	}
	snapshot = &pb.DBFundamentalSnapshot{}
	snapshot.Symbol = code
	snapshot.Market = market
	snapshot.Source = "akshare_xq"
	snapshot.Ts = time.Now().Format(time.RFC3339)
	toF := func(v interface{}) float64 {
		switch x := v.(type) {
		case float64:
			return x
		case float32:
			return float64(x)
		case int:
			return float64(x)
		case int64:
			return float64(x)
		case string:
			if x == "" {
				return 0
			}
			if f, e := strconv.ParseFloat(x, 64); e == nil {
				return f
			}
			return 0
		default:
			s := fmt.Sprint(v)
			if f, e := strconv.ParseFloat(s, 64); e == nil {
				return f
			}
			return 0
		}
	}
	toStrVal := func(v interface{}) string {
		if s, ok := v.(string); ok {
			return s
		}
		return fmt.Sprint(v)
	}
	setNum := func(k string, v float64) {
		switch k {
		case "revenue", "营业收入":
			snapshot.Revenue = v
		case "operating_income", "营业利润":
			snapshot.OperatingIncome = v
		case "net_profit", "净利润":
			snapshot.NetProfit = v
		case "eps", "每股收益":
			snapshot.EPS = v
		case "roe", "净资产收益率":
			snapshot.ROE = v
		case "roa", "总资产收益率":
			snapshot.ROA = v
		case "gross_margin", "毛利率":
			snapshot.GrossMargin = v
		case "operating_margin", "营业利润率":
			snapshot.OperatingMargin = v
		case "net_margin", "净利率":
			snapshot.NetMargin = v
		case "pe", "市盈率":
			snapshot.PE = v
		case "pb", "市净率":
			snapshot.PB = v
		case "ps", "市销率":
			snapshot.PS = v
		case "dividend_per_share", "每股分红":
			snapshot.DividendPerShare = v
		case "dividend_yield", "股息率":
			snapshot.DividendYield = v
		case "free_cash_flow", "自由现金流":
			snapshot.FreeCashFlow = v
		case "debt_to_equity", "资产负债比":
			snapshot.DebtToEquity = v
		case "current_ratio", "流动比率":
			snapshot.CurrentRatio = v
		case "quick_ratio", "速动比率":
			snapshot.QuickRatio = v
		case "total_assets", "总资产":
			snapshot.TotalAssets = v
		case "total_liabilities", "总负债":
			snapshot.TotalLiabilities = v
		case "equity", "股东权益":
			snapshot.Equity = v
		case "revenue_yoy", "收入同比":
			snapshot.RevenueYoY = v
		case "net_profit_yoy", "净利润同比":
			snapshot.NetProfitYoY = v
		case "eps_yoy", "EPS同比":
			snapshot.EPSYoY = v
		default:
			if snapshot.Metrics == nil {
				snapshot.Metrics = map[string]float64{}
			}
			snapshot.Metrics[k] = v
		}
	}
	for _, it := range items {
		k := strings.TrimSpace(strings.ToLower(it.Item))
		if k == "period" || k == "财报周期" {
			snapshot.Period = toStrVal(it.Value)
			continue
		}
		if k == "fiscal_year" || k == "财年" {
			snapshot.FiscalYear = toStrVal(it.Value)
			continue
		}
		if k == "fiscal_quarter" || k == "财季" {
			snapshot.FiscalQuarter = toStrVal(it.Value)
			continue
		}
		setNum(k, toF(it.Value))
	}
	return
}
