package akshare

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"sort"
	"strings"
	"time"
)

type (
	// StockSzseSummary 深交所市场概况
	StockSzseSummary struct {
		Items []StockSzseSummaryItem `json:"items"` // 各证券类别明细
	}

	// StockSzseSummaryItem 单类证券统计
	StockSzseSummaryItem struct {
		SecType  string   `json:"证券类别"` // 如“股票”“主板A股”等
		Count    int64    `json:"数量"`   // 该类证券数量
		TradeAmt float64  `json:"成交金额"` // 成交金额（元）
		TotalVal *float64 `json:"总市值"`  // 总市值（元），可能为 null
		FloatVal *float64 `json:"流通市值"` // 流通市值（元），可能为 null
	}

	// 市场要闻类型移至 akshare_news.go

	// 大盘资金流记录（东方财富 stock_market_fund_flow）
	StockMarketFundFlowRecord struct {
		Index       int64   `json:"序号" comment:"序号"`
		Code        string  `json:"代码" comment:"代码"`
		Name        string  `json:"名称" comment:"名称"`
		Last        float64 `json:"最新价" comment:"最新价"`
		ChangePct   float64 `json:"涨跌幅" comment:"涨跌幅(%)"`
		ChangeAmt   float64 `json:"涨跌额" comment:"涨跌额"`
		Volume      float64 `json:"成交量" comment:"成交量"`
		Amount      float64 `json:"成交额" comment:"成交额(元)"`
		Amplitude   float64 `json:"振幅" comment:"振幅(%)"`
		High        float64 `json:"最高" comment:"最高价"`
		Low         float64 `json:"最低" comment:"最低价"`
		Open        float64 `json:"今开" comment:"今日开盘价"`
		PrevClose   float64 `json:"昨收" comment:"昨日收盘价"`
		VolumeRatio float64 `json:"量比" comment:"量比"`
	}

	// 大盘资金流（包装为 Items 列表，便于与 StockSzseSummary 一致）
	StockMarketFundFlow struct {
		Items []StockMarketFundFlowRecord `json:"items" comment:"资金流记录列表"`
	}
)

// 指数实时快照（东方财富 stock_zh_index_spot）
type IndexSpotRecord struct {
	Code      string  `json:"代码"`
	Name      string  `json:"名称"`
	Last      float64 `json:"最新价"`
	ChangePct float64 `json:"涨跌幅"`
	TurnOver  float64 `json:"成交额"`
}

// A股实时行情（东方财富 stock_zh_a_spot_em）
type AStockSpotRecord struct {
	Symbol    string  `json:"代码"`
	Name      string  `json:"名称"`
	Price     float64 `json:"最新价"`
	ChangePct float64 `json:"涨跌幅"`
	Volume    float64 `json:"成交量"`
	Amount    float64 `json:"成交额"`
}

// 面板 DTO
type MarketIndexDTO struct {
	Code      string  `json:"code"`
	Name      string  `json:"name"`
	Last      float64 `json:"last"`
	ChangePct float64 `json:"change_pct"`
	TurnOver  float64 `json:"turn_over"`
}
type MarketBreadthDTO struct {
	Rise      int64 `json:"rise"`
	Fall      int64 `json:"fall"`
	Unchanged int64 `json:"unchanged"`
	LimitUp   int64 `json:"limit_up"`
	LimitDown int64 `json:"limit_down"`
}
type TopMoverDTO struct {
	Symbol    string  `json:"symbol"`
	Name      string  `json:"name"`
	ChangePct float64 `json:"change_pct"`
	Price     float64 `json:"price"`
	Volume    int64   `json:"volume"`
}
type MarketPanelDTO struct {
	Indices    []MarketIndexDTO `json:"indices"`
	Breadth    MarketBreadthDTO `json:"breadth"`
	TopGainers []TopMoverDTO    `json:"top_gainers"`
	TopLosers  []TopMoverDTO    `json:"top_losers"`
	Timestamp  int64            `json:"timestamp"`
}

// 获取深圳证券交易所 summary（东方财富 stock_szse_summary）
// - 参数: 无
// - 返回: 深圳证券交易所 summary 结构体（包含总市值/总成交量/总成交额等字段）
// - 说明: 调用 python_akshare `/api/public/stock_szse_summary`
func (a *AkShare) GetStockSzseSummary() (summary *StockSzseSummary, err error) {
	url := fmt.Sprintf("%s/api/public/stock_szse_summary", a.options.BaseUrl)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	fmt.Println(string(body))
	// 返回为数组：[{"证券类别":..., "数量":..., "成交金额":..., "总市值":..., "流通市值":...}, ...]
	var arr []StockSzseSummaryItem
	if err := json.Unmarshal(body, &arr); err != nil {
		// 若不是数组，尝试解析错误对象并返回更明确错误
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 == nil {
			if msg, ok := obj["error"]; ok {
				return nil, fmt.Errorf("stock_szse_summary error: %v", msg)
			}
		}
		return nil, err
	}
	summary = &StockSzseSummary{Items: arr}
	return summary, nil
}

// GetStockZhIndexSpot 获取沪深主要指数实时快照（东方财富 stock_zh_index_spot）
// 参数: 无
// 返回值: 指数快照列表（包括代码、名称、最新价、涨跌幅、成交额）
// 异常: 网络错误/解码错误时返回错误
func (a *AkShare) GetStockZhIndexSpot() (records []IndexSpotRecord, err error) {
	url := fmt.Sprintf("%s/api/public/stock_zh_index_spot", a.options.BaseUrl)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	if err := json.Unmarshal(body, &records); err != nil {
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 == nil {
			if msg, ok := obj["error"]; ok {
				return nil, fmt.Errorf("stock_zh_index_spot error: %v", msg)
			}
		}
		return nil, err
	}
	return records, nil
}

// GetStockZhASpotEM 获取沪深京 A 股实时行情（东方财富 stock_zh_a_spot_em）
// 参数: 无
// 返回值: A 股实时行情列表（包括代码、名称、最新价、涨跌幅、成交量、成交额）
// 异常: 网络错误/解码错误时返回错误
func (a *AkShare) GetStockZhASpotEM() (records []AStockSpotRecord, err error) {
	url := fmt.Sprintf("%s/api/public/stock_zh_a_spot_em", a.options.BaseUrl)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	if err := json.Unmarshal(body, &records); err != nil {
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 == nil {
			if msg, ok := obj["error"]; ok {
				return nil, fmt.Errorf("stock_zh_a_spot_em error: %v", msg)
			}
		}
		return nil, err
	}
	return records, nil
}

// GetStockCyASpotEM 获取创业板实时行情（东方财富 stock_cy_a_spot_em）
// 参数: 无
// 返回值: 创业板实时行情列表（包括代码、名称、最新价、涨跌幅、成交量、成交额）
// 异常: 网络错误/解码错误时返回错误
func (a *AkShare) GetStockCyASpotEM() (records []AStockSpotRecord, err error) {
	url := fmt.Sprintf("%s/api/public/stock_cy_a_spot_em", a.options.BaseUrl)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	if err := json.Unmarshal(body, &records); err != nil {
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 == nil {
			if msg, ok := obj["error"]; ok {
				return nil, fmt.Errorf("stock_cy_a_spot_em error: %v", msg)
			}
		}
		return nil, err
	}
	return records, nil
}

// GetStockKcASpotEM 获取科创板实时行情（东方财富 stock_kc_a_spot_em）
// 参数: 无
// 返回值: 科创板实时行情列表（包括代码、名称、最新价、涨跌幅、成交量、成交额）
// 异常: 网络错误/解码错误时返回错误
func (a *AkShare) GetStockKcASpotEM() (records []AStockSpotRecord, err error) {
	url := fmt.Sprintf("%s/api/public/stock_kc_a_spot_em", a.options.BaseUrl)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	if err := json.Unmarshal(body, &records); err != nil {
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 == nil {
			if msg, ok := obj["error"]; ok {
				return nil, fmt.Errorf("stock_kc_a_spot_em error: %v", msg)
			}
		}
		return nil, err
	}
	return records, nil
}

// BuildMarketPanelDTO 构建最小化大盘面板 DTO
// 参数: topN 榜单数量（如 10）
// 返回值: 面板 DTO，包括 indices、breadth、top_gainers、top_losers、timestamp
// 异常: 上游接口失败或数据解码异常时返回错误
func (a *AkShare) BuildMarketPanelDTO(topN int) (*MarketPanelDTO, error) {
	idxs, err := a.GetStockZhIndexSpot()
	if err != nil {
		return nil, err
	}
	astocks, err := a.GetStockZhASpotEM()
	if err != nil {
		return nil, err
	}
	// 1) 指数筛选与映射
	targets := map[string]bool{
		"上证指数": true, "深证成指": true, "创业板指": true, "科创50": true,
	}
	var indices []MarketIndexDTO
	for _, r := range idxs {
		if targets[r.Name] {
			indices = append(indices, MarketIndexDTO{
				Code: r.Code, Name: r.Name, Last: r.Last, ChangePct: r.ChangePct, TurnOver: r.TurnOver,
			})
		}
	}
	// 2) 宽度统计与涨跌停（最小实现: 非 ST 10%，ST 5%）
	var rise, fall, unchanged, limitUp, limitDown int64
	for _, s := range astocks {
		cp := s.ChangePct
		n := strings.ToUpper(s.Name)
		isST := strings.Contains(n, "ST")
		upTh := 9.9
		downTh := -9.9
		if isST {
			upTh = 4.9
			downTh = -4.9
		}
		if cp > 0 {
			rise++
		} else if cp < 0 {
			fall++
		} else {
			unchanged++
		}
		if cp >= upTh {
			limitUp++
		}
		if cp <= downTh {
			limitDown++
		}
	}
	breadth := MarketBreadthDTO{
		Rise: rise, Fall: fall, Unchanged: unchanged, LimitUp: limitUp, LimitDown: limitDown,
	}
	// 3) 榜单
	sortedUp := make([]AStockSpotRecord, len(astocks))
	copy(sortedUp, astocks)
	sort.Slice(sortedUp, func(i, j int) bool { return sortedUp[i].ChangePct > sortedUp[j].ChangePct })
	sortedDn := make([]AStockSpotRecord, len(astocks))
	copy(sortedDn, astocks)
	sort.Slice(sortedDn, func(i, j int) bool { return sortedDn[i].ChangePct < sortedDn[j].ChangePct })
	if topN < 1 {
		topN = 10
	}
	upN := topN
	if upN > len(sortedUp) {
		upN = len(sortedUp)
	}
	dnN := topN
	if dnN > len(sortedDn) {
		dnN = len(sortedDn)
	}
	toMovers := func(src []AStockSpotRecord) []TopMoverDTO {
		res := make([]TopMoverDTO, 0, len(src))
		for _, r := range src {
			res = append(res, TopMoverDTO{
				Symbol: r.Symbol, Name: r.Name, ChangePct: r.ChangePct, Price: r.Price, Volume: int64(r.Volume),
			})
		}
		return res
	}
	panel := &MarketPanelDTO{
		Indices:    indices,
		Breadth:    breadth,
		TopGainers: toMovers(sortedUp[:upN]),
		TopLosers:  toMovers(sortedDn[:dnN]),
		Timestamp:  time.Now().UnixMilli(),
	}
	return panel, nil
}

// 新闻接口迁移至 akshare_news.go

// GetStockMarketFundFlow 获取大盘资金流向（东方财富 stock_market_fund_flow）
// 参数: 无
// 返回值: 基于上游原始字段的记录列表（字段以接口返回为准）
// 异常: 网络错误/解码错误或上游返回错误对象时返回错误
func (a *AkShare) GetStockMarketFundFlow() (flow *StockMarketFundFlow, err error) {
	url := fmt.Sprintf("%s/api/public/stock_market_fund_flow", a.options.BaseUrl)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	flow = &StockMarketFundFlow{
		Items: make([]StockMarketFundFlowRecord, 0),
	}
	fmt.Println(string(body))
	if err := json.Unmarshal(body, &flow.Items); err != nil {
		return nil, err
	}
	return flow, nil
}
