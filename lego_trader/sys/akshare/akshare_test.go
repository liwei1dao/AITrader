package akshare

import (
	"encoding/json"
	"io"
	"net/http"
	"os"
	"testing"
	"time"
)

func baseURL() string {
	if v := os.Getenv("AKTOOLS_BASE_URL"); v != "" {
		return v
	}
	return "http://127.0.0.1:8080"
}

func newHTTPClient() *http.Client {
	return &http.Client{Timeout: 10 * time.Second}
}

func serviceAvailable(t *testing.T, client *http.Client, url string) bool {
	req, err := http.NewRequest(http.MethodGet, url+"/docs", nil)
	if err != nil {
		t.Logf("构造请求失败: %v", err)
		return false
	}
	resp, err := client.Do(req)
	if err != nil {
		t.Logf("连接 AkTools 失败: %v", err)
		return false
	}
	defer resp.Body.Close()
	return resp.StatusCode == http.StatusOK
}

func TestAktoolsServiceAvailable(t *testing.T) {
	client := newHTTPClient()
	if !serviceAvailable(t, client, baseURL()) {
		t.Skip("AkTools 服务不可用，跳过接入测试。设置环境变量 AKTOOLS_BASE_URL 指向正在运行的 AkTools 服务后重试。")
	}
}

func TestStockASpot(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	// API: stock_zh_a_spot
	// 说明: 新浪 A 股实时行情数据
	// 方法: GET /api/public/stock_zh_a_spot
	// 参数: 无
	req, err := http.NewRequest(http.MethodGet, url+"/api/public/stock_zh_a_spot", nil)
	if err != nil {
		t.Fatalf("创建请求失败: %v", err)
	}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("请求失败: %v", err)
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("状态码异常: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		t.Fatalf("读取响应失败: %v", err)
	}
	var arr []map[string]interface{}
	if err := json.Unmarshal(body, &arr); err != nil {
		t.Fatalf("解析 JSON 失败: %v", err)
	}
	if len(arr) == 0 {
		t.Fatalf("返回数据为空")
	}
}

func TestStockAHist(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	// API: stock_zh_a_hist
	// 说明: A 股历史行情数据（日频）
	// 方法: GET /api/public/stock_zh_a_hist
	// 参数: symbol=股票代码; period=周期(daily/weekly/monthly); start_date=YYYYMMDD; end_date=YYYYMMDD; adjust=复权(qfq/hfq/空字符串)
	full := url + "/api/public/stock_zh_a_hist?symbol=000001&period=daily&start_date=20211109&end_date=20211209&adjust="
	req, err := http.NewRequest(http.MethodGet, full, nil)
	if err != nil {
		t.Fatalf("创建请求失败: %v", err)
	}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("请求失败: %v", err)
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("状态码异常: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		t.Fatalf("读取响应失败: %v", err)
	}
	var arr []map[string]interface{}
	if err := json.Unmarshal(body, &arr); err != nil {
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 != nil {
			t.Fatalf("解析 JSON 失败: %v", err)
		}
		if len(obj) == 0 {
			t.Fatalf("返回数据为空")
		}
		return
	}
	if len(arr) == 0 {
		t.Fatalf("返回数据为空")
	}
}

func TestStockBasicInfo(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	// API: stock_individual_info_em
	// 说明: 东方财富-个股-股票信息（公司基本情况）
	// 方法: GET /api/public/stock_individual_info_em
	// 参数: symbol=股票代码（如 000001）
	full := url + "/api/public/stock_individual_info_em?symbol=000001"
	req, err := http.NewRequest(http.MethodGet, full, nil)
	if err != nil {
		t.Fatalf("创建请求失败: %v", err)
	}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("请求失败: %v", err)
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("状态码异常: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		t.Fatalf("读取响应失败: %v", err)
	}
	var arr []map[string]interface{}
	if err := json.Unmarshal(body, &arr); err != nil {
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 != nil {
			t.Fatalf("解析 JSON 失败: %v", err)
		}
		if len(obj) == 0 {
			t.Fatalf("返回数据为空")
		}
		return
	}
	if len(arr) == 0 {
		t.Fatalf("返回数据为空")
	}
}

func TestStockFinancialIndicators(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	// API: stock_financial_analysis_indicator
	// 说明: 新浪财经-财务分析-财务指标（关键指标）
	// 方法: GET /api/public/stock_financial_analysis_indicator
	// 参数: stock=股票代码（如 600004）
	full := url + "/api/public/stock_financial_analysis_indicator?stock=600004"
	req, err := http.NewRequest(http.MethodGet, full, nil)
	if err != nil {
		t.Fatalf("创建请求失败: %v", err)
	}
	resp, err := client.Do(req)
	if err != nil {
		t.Fatalf("请求失败: %v", err)
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("状态码异常: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		t.Fatalf("读取响应失败: %v", err)
	}
	var arr []map[string]interface{}
	if err := json.Unmarshal(body, &arr); err != nil {
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 != nil {
			t.Fatalf("解析 JSON 失败: %v", err)
		}
		if len(obj) == 0 {
			t.Fatalf("返回数据为空")
		}
		return
	}
	if len(arr) == 0 {
		t.Fatalf("返回数据为空")
	}
}
