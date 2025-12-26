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

	// 全球股市资讯（同花顺 stock_info_global_ths）记录
	StockInfoGlobalThsRecord struct {
		Title       string `json:"标题" comment:"标题"`
		Content     string `json:"内容" comment:"内容"`
		PublishTime string `json:"发布时间" comment:"发布时间"`
		URL         string `json:"链接" comment:"链接"`
	}
)

// GetStockNewsEm 获取个股新闻（东方财富 stock_news_em）
// - 参数: stockCode 可为6位或带前缀；page/size 可选（nil 表示不传）
// - 返回: 新闻列表（标题/时间/来源/链接等字段）
// - 异常: 网络错误/解码错误或上游返回错误对象时返回错误
func (a *AkShare) GetStockNewsEm(stockCode string) (records []StockNewsEmRecord, err error) {

	url := fmt.Sprintf("%s/api/public/stock_news_em?symbol=%s", a.options.BaseUrl, stockCode)
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

// GetStockNewsMainCx 获取市场要闻（财新）
// 参数: 无
// 返回: records 市场要闻列表, err 错误信息
// 异常: 网络请求失败, JSON解析失败, API返回错误
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
	fmt.Println("StockNewsMainCx Body:", string(body))
	if err := json.Unmarshal(body, &records); err != nil {
		// 尝试解析错误对象
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 == nil {
			if msg, ok := obj["error"]; ok {
				return nil, fmt.Errorf("stock_news_main_cx error: %v", msg)
			}
		}
		// 如果都不是，返回原始错误和部分body内容以便调试
		if len(body) > 200 {
			return nil, fmt.Errorf("unmarshal error: %v, body(partial): %s", err, string(body[:200]))
		}
		return nil, fmt.Errorf("unmarshal error: %v, body: %s", err, string(body))
	}
	return records, nil
}

// 获取全球股市资讯（同花顺 stock_info_global_ths）
// 参数: 无
// 返回: records 全球股市资讯列表, err 错误信息
// 异常: 网络请求失败, JSON解析失败, API返回错误
func (a *AkShare) GetStockInfoGlobalThs() (records []StockInfoGlobalThsRecord, err error) {
	url := fmt.Sprintf("%s/api/public/stock_info_global_ths", a.options.BaseUrl)
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
		// 尝试解析错误对象
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 == nil {
			if msg, ok := obj["error"]; ok {
				return nil, fmt.Errorf("stock_info_global_ths error: %v", msg)
			}
		}
		// 如果都不是，返回原始错误和部分body内容以便调试
		if len(body) > 200 {
			return nil, fmt.Errorf("unmarshal error: %v, body(partial): %s", err, string(body[:200]))
		}
		return nil, fmt.Errorf("unmarshal error: %v, body: %s", err, string(body))
	}
	return records, nil
}
