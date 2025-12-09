package akshare

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
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

	// 市场要闻（财新 stock_news_main_cx）记录
	StockNewsMainCxRecord struct {
		Tag          string `json:"tag" comment:"标签/标题"`
		Summary      string `json:"summary" comment:"摘要"`
		IntervalTime string `json:"interval_time" comment:"时间区间/显示时间"`
		PubTime      string `json:"pub_time" comment:"发布时间(精确)"`
		URL          string `json:"url" comment:"链接"`
	}
)

//	获取市场要闻（财新 stock_news_main_cx）
//
// - 参数: 无
// - 返回: 市场要闻列表（标题/时间/来源/摘要等字段）
// - 说明: 调用 python_akshare `/api/public/stock_news_main_cx`
func (a *AkShare) GetStockNewsMainCx() (records []StockNewsMainCxRecord, err error) {
	url := fmt.Sprintf("%s/api/public/stock_news_main_cx", a.options.BaseUrl)
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
				return nil, fmt.Errorf("stock_news_main_cx error: %v", msg)
			}
		}
		return nil, err
	}
	return records, nil
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
