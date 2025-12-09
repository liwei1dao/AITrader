package akshare

type (

	// 市场接口
	IMarket interface {
		/// 获取深圳证券交易所 summary（东方财富 stock_szse_summary）
		/// 参数: 无；返回: 深圳证券交易所 summary 结构体（包含总市值/总成交量/总成交额等字段）
		GetStockSzseSummary() (summary *StockSzseSummary, err error)
		/// 获取市场要闻（财新 stock_news_main_cx）
		/// 参数: 无；返回: 市场要闻列表（结构化）
		GetStockNewsMainCx() (records []StockNewsMainCxRecord, err error)
	}
	// 板块接口
	IPlate interface {
	}
	//个股信息接口
	IStock interface {
		/// 获取股票基本信息
		GetStockBasicInfo(stockCode string) (info *StockBasicInfo, err error)
		/// 获取A股历史行情（东方财富 stock_zh_a_hist）
		/// 参数: stockCode, period(daily/weekly/monthly), start/end(YYYYMMDD), adjust('',qfq,hfq)
		/// 返回: 历史K线列表（结构化）
		GetStockZhAHist(stockCode, period, start, end, adjust string) (records []StockZhAHistRecord, err error)
		/// 获取实时盘口（东方财富 stock_bid_ask_em）
		/// 参数: stockCode 6位代码或含前缀 sz/sh；返回: 买卖盘列表（原始字段）
		GetStockBidAskEM(stockCode string) (data *StockBidAskEM, err error)
		/// 获取个股新闻（东方财富 stock_news_em）
		/// 参数: stockCode 6位或含前缀；page/size 可选；返回: 新闻列表（结构化）
		GetStockNewsEm(stockCode string, page, size *int) (records []StockNewsEmRecord, err error)
		/// 获取基本面摘要（雪球/东方财富）
		GetStockFinancialSummary(stockCode string) (items []ItemValue, err error)
	}
	ISys interface {
		IMarket
		IPlate
		IStock
	}
	ItemValue struct {
		Item  string      `json:"item" comment:"项目"`
		Value interface{} `json:"value" comment:"值"`
	}
)

var (
	defsys ISys
)

func OnInit(config map[string]interface{}, opt ...Option) (err error) {
	var option *Options
	if option, err = newOptions(config, opt...); err != nil {
		return
	}
	defsys, err = newSys(option)
	return
}
func NewSys(opt ...Option) (sys ISys, err error) {
	var option *Options
	if option, err = newOptionsByOption(opt...); err != nil {
		return
	}
	sys, err = newSys(option)
	return
}

func GetStockBasicInfo(stockCode string) (info *StockBasicInfo, err error) {
	return defsys.GetStockBasicInfo(stockCode)
}

// GetStockBidAskEM 获取实时盘口（结构化对象）
func GetStockBidAskEM(stockCode string) (data *StockBidAskEM, err error) {
	return defsys.GetStockBidAskEM(stockCode)
}

// GetStockZhAHist 获取A股历史行情（东方财富）
// - 参数: period 支持 `daily`/`weekly`/`monthly`; start/end 为 `YYYYMMDD`; adjust 为 `""`/`qfq`/`hfq`
// - 返回: 原始字段的历史K线记录（日期/开盘/收盘/最高/最低/成交量/成交额/涨跌幅/换手率等）
func GetStockZhAHist(stockCode, period, start, end, adjust string) (records []StockZhAHistRecord, err error) {
	return defsys.GetStockZhAHist(stockCode, period, start, end, adjust)
}

// GetStockNewsEm 获取个股新闻（东方财富）
// - 参数: stockCode 可为6位或带前缀；page/size 可选
// - 返回: 原始字段的新闻记录列表（标题/时间/来源/链接等）
func GetStockNewsEm(stockCode string, page, size *int) (records []StockNewsEmRecord, err error) {
	return defsys.GetStockNewsEm(stockCode, page, size)
}

// GetStockNewsMainCx 获取市场要闻（财新）
// - 参数: 无
// - 返回: 原始字段的市场要闻记录列表（标题/时间/来源/摘要等）
func GetStockNewsMainCx() (records []StockNewsMainCxRecord, err error) {
	return defsys.GetStockNewsMainCx()
}

// GetStockFinancialSummary 获取基本面摘要（item/value 列表）
func GetStockFinancialSummary(stockCode string) (items []ItemValue, err error) {
	return defsys.GetStockFinancialSummary(stockCode)
}
