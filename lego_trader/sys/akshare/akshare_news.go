package akshare

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
)

type (
	// 个股新闻（东方财富 stock_news_em）记录
	StockNewsEmRecord struct {
		Title       string  `json:"标题" comment:"新闻标题"`
		PublishTime string  `json:"发布时间" comment:"发布时间"`
		Source      string  `json:"来源" comment:"来源"`
		URL         string  `json:"新闻链接" comment:"链接"`
		NewsID      string  `json:"新闻ID" comment:"新闻ID"`
		Summary     *string `json:"摘要" comment:"摘要(可能不存在)"`
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

// GetStockNewsEm 获取个股新闻（东方财富 stock_news_em）
// - 参数: stockCode 可为6位或带前缀；page/size 可选（nil 表示不传）
// - 返回: 新闻列表（标题/时间/来源/链接等字段）
// - 异常: 网络错误/解码错误或上游返回错误对象时返回错误
func (a *AkShare) GetStockNewsEm(stockCode string, page, size *int) (records []StockNewsEmRecord, err error) {
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
// - 异常: 网络错误/解码错误或上游返回错误对象时返回错误
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
