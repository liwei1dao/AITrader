package akshare

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
)

func newSys(options *Options) (sys *AkShare, err error) {
	sys = &AkShare{
		options: options,
	}
	return
}

type AkShare struct {
	options *Options
}

// GetStockBasicInfo 获取股票基本信息（东方财富 stock_individual_basic_info_xq）
// - 参数: stockCode 支持 6位代码或带前缀 `sz`/`sh`
// - 返回: 股票基本信息结构体（包含股票代码、名称、上市日期、上市地点、所属行业、所属板块、上市状态等字段）
// - 说明: 调用 python_akshare `/api/public/stock_individual_basic_info_xq`
func (a *AkShare) GetStockBasicInfo(stockCode string) (info *StockBasicInfo, err error) {
	// 雪球接口要求symbol必须带sz/sh前缀，若未带则默认补sh
	if len(stockCode) == 6 && (stockCode[:2] != "sz" && stockCode[:2] != "sh") {
		stockCode = "sh" + stockCode
	}
	url := fmt.Sprintf("%s/api/public/stock_individual_basic_info_xq?symbol=%s", a.options.BaseUrl, stockCode)
	fmt.Println(url)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	var items []ItemValue
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	fmt.Println(string(body))
	if err := json.Unmarshal(body, &items); err != nil {
		items = nil
	}
	// 使用通用映射接口将 items 映射到 StockBasicInfo
	info = &StockBasicInfo{}
	if err := MapItemValuesToStruct(items, info); err != nil {
		return nil, err
	}
	return info, nil
}

// GetStockBidAsk 获取实时盘口（东方财富 stock_bid_ask_em）
// - 参数: stockCode 支持 6位代码或带前缀 `sz`/`sh`
// - 返回: 原始字段的列表（例如 买一价/买一量/卖一价/时间 等）
// - 说明: 调用 python_akshare `/api/public/stock_bid_ask_em`
func (a *AkShare) GetStockBidAsk(stockCode string) (records *StockBidAskEM, err error) {
	url := fmt.Sprintf("%s/api/public/stock_bid_ask_em?symbol=%s", a.options.BaseUrl, stockCode)
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
	records = &StockBidAskEM{}
	if err := json.Unmarshal(body, records); err != nil {
		return nil, err
	}
	return records, nil
}

// GetStockZhAHist 获取A股历史行情（东方财富 stock_zh_a_hist）
//   - 参数:
//     stockCode: 6位或带前缀 `sz`/`sh`
//     period: `daily`/`weekly`/`monthly`
//     start/end: 起止日期 `YYYYMMDD`
//     adjust: 复权 `""`/`qfq`/`hfq`
//   - 返回: 历史K线记录列表（日期/开盘/收盘/最高/最低/成交量/成交额/涨跌幅/换手率等字段）
//   - 说明: 调用 python_akshare `/api/public/stock_zh_a_hist`
func (a *AkShare) GetStockZhAHist(stockCode, period, start, end, adjust string) (records []StockZhAHistRecord, err error) {
	url := fmt.Sprintf("%s/api/public/stock_zh_a_hist?symbol=%s&period=%s&start=%s&end=%s&adjust=%s", a.options.BaseUrl, stockCode, period, start, end, adjust)
	fmt.Println(url)
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
	// 直接反序列化为结构化记录切片
	if err := json.Unmarshal(body, &records); err != nil {

		return nil, err
	}
	return records, nil
}

// GetStockNewsEm 获取个股新闻（东方财富 stock_news_em）
// - 参数: stockCode 可为6位或带前缀；page/size 可选（nil 表示不传）
// - 返回: 新闻列表（标题/时间/来源/链接等字段）
// - 说明: 调用 python_akshare `/api/public/stock_news_em`
func (a *AkShare) GetStockNewsEm(stockCode string, page, size *int) (records []StockNewsEmRecord, err error) {
	// 组装可选参数
	q := ""
	if page != nil {
		q += fmt.Sprintf("&page=%d", *page)
	}
	if size != nil {
		q += fmt.Sprintf("&size=%d", *size)
	}
	url := fmt.Sprintf("%s/api/public/stock_news_em?symbol=%s%s", a.options.BaseUrl, stockCode, q)
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
				return nil, fmt.Errorf("stock_news_em error: %v", msg)
			}
		}
		return nil, err
	}
	return records, nil
}

// GetStockNewsMainCx 获取市场要闻（财新 stock_news_main_cx）
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

// GetStockBidAskEM 获取实时盘口并映射为结构体
// 返回 StockBidAskEM，内部按 item/value 结构进行映射
func (a *AkShare) GetStockBidAskEM(stockCode string) (data *StockBidAskEM, err error) {
	url := fmt.Sprintf("%s/api/public/stock_bid_ask_em?symbol=%s", a.options.BaseUrl, stockCode)
	fmt.Println(url)
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
	var items []ItemValue
	if err := json.Unmarshal(body, &items); err != nil {
		return nil, err
	}
	res := &StockBidAskEM{}
	if err := MapItemValuesToStruct(items, res); err != nil {
		return nil, err
	}
	return res, nil
}
