package akshare

type (

	// 市场接口
	IMarket interface {
		/// 获取深圳证券交易所 summary（东方财富 stock_szse_summary）
		/// 作用: 大盘概况的证券类别总览数据源，用于盘后统计展示
		/// 参数: 无；返回: 深圳证券交易所 summary 结构体（包含总市值/总成交量/总成交额等字段）
		GetStockSzseSummary() (summary *StockSzseSummary, err error)
		/// 获取大盘资金流向（东方财富 stock_market_fund_flow）
		/// 作用: 大盘看板的资金流模块数据源（主力/超大单/大单/中单/小单）
		/// 参数: 无；返回: 大盘资金流结构体（包含 Items 列表）
		GetStockMarketFundFlow() (flow *StockMarketFundFlow, err error)
		/// 获取沪深主要指数实时快照（东方财富 stock_zh_index_spot）
		/// 作用: 大盘看板指数卡片数据源（上证/深证/创业板/科创50等）
		/// 参数: 无；返回: 指数快照列表（代码/名称/最新价/涨跌幅/成交额）
		GetStockZhIndexSpot() (records []IndexSpotRecord, err error)
		/// 获取沪深京 A 股实时行情（东方财富 stock_zh_a_spot_em）
		/// 作用: 市场宽度统计与涨跌榜数据源（全市场实时行情）
		/// 参数: 无；返回: A 股实时行情列表（代码/名称/最新价/涨跌幅/成交量/成交额）
		GetStockZhASpotEM() (records []StockZhASpotEMRecord, err error)
		/// 获取创业板实时行情（东方财富 stock_cy_a_spot_em）
		/// 作用: 创业板分板块视图与榜单数据源
		/// 参数: 无；返回: 创业板实时行情列表（代码/名称/最新价/涨跌幅/成交量/成交额）
		GetStockCyASpotEM() (records []AStockSpotRecord, err error)
		/// 获取科创板实时行情（东方财富 stock_kc_a_spot_em）
		/// 作用: 科创板分板块视图与榜单数据源
		/// 参数: 无；返回: 科创板实时行情列表（代码/名称/最新价/涨跌幅/成交量/成交额）
		GetStockKcASpotEM() (records []AStockSpotRecord, err error)
		/// 构建最小化大盘面板 DTO
		/// 作用: 汇总指数、市场宽度与涨跌榜形成看板最小数据传输对象
		/// 参数: topN 榜单数量；返回: 面板 DTO（indices/breadth/top列表/timestamp）
		BuildMarketPanelDTO(topN int) (*MarketPanelDTO, error)
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
		/// 获取个股资金流向（东方财富 stock_individual_fund_flow）
		/// 作用: 个股页面的资金流模块数据源（近100个交易日）
		/// 参数: stockCode 6位代码；market 市场代码 'sh'/'sz'/'bj'
		/// 返回: 基于上游原始字段的记录列表（结构化字典）
		GetStockIndividualFundFlow(stockCode string, market string) (records []map[string]interface{}, err error)
		/// 获取基本面摘要（雪球/东方财富）
		GetStockFinancialSummary(stockCode string) (summary *StockFinancialSummary, err error)
	}

	ISys interface {
		IMarket
		IPlate
		IStock
		INews
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

// 市场---------------------------

// GetStockZhIndexSpot 获取沪深主要指数实时快照（东方财富 stock_zh_index_spot）
// - 参数: 无
// - 返回: 指数快照列表（代码/名称/最新价/涨跌幅/成交额）
// / 获取沪深主要指数实时快照（东方财富 stock_zh_index_spot）
// / 作用: 大盘看板指数卡片数据源（上证/深证/创业板/科创50等）
// / 参数: 无；返回: 指数快照列表（代码/名称/最新价/涨跌幅/成交额）
func GetStockZhIndexSpot() (records []IndexSpotRecord, err error) {
	return defsys.GetStockZhIndexSpot()
}

// GetStockMarketFundFlow 获取大盘资金流向（东方财富）
// - 参数: 无
// - 返回: 大盘资金流结构体（Items 为资金流记录列表）
// - 异常: 网络错误/上游返回错误对象时返回错误
func GetStockMarketFundFlow() (flow *StockMarketFundFlow, err error) {
	return defsys.GetStockMarketFundFlow()
}

// 股票---------------------------

// / 获取沪深京 A 股实时行情（东方财富 stock_zh_a_spot_em）
// / 作用: 市场宽度统计与涨跌榜数据源（全市场实时行情）
// / 参数: 无；返回: A 股实时行情列表（代码/名称/最新价/涨跌幅/成交量/成交额）
func GetStockZhASpotEM() (records []StockZhASpotEMRecord, err error) {
	return defsys.GetStockZhASpotEM()
}

// GetStockBasicInfo 获取股票基本信息（东方财富）
// - 参数: stockCode 6位代码或含前缀 sz/sh/bj
// - 返回: 原始字段的股票基本信息（名称/上市日期/上市地点/所属行业/所属板块等）
// - 异常: 网络错误/上游返回错误对象时返回错误
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
// - 参数: stockCode 6位代码或含前缀 sz/sh/bj
// - 返回: 原始字段的基本面摘要（资产负债表/利润表/现金流量表等）
// - 异常: 网络错误/上游返回错误对象时返回错误
func GetStockFinancialSummary(stockCode string) (summary *StockFinancialSummary, err error) {
	return defsys.GetStockFinancialSummary(stockCode)
}
