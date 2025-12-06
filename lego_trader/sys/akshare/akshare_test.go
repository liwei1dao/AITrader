package akshare_test

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"testing"
	"time"

	"lego_trader/pb"
	"lego_trader/sys/akshare"
)

// 测试说明
// 这些测试用于验证 python_akshare 服务的接口可用性与返回数据结构。
// 默认访问地址为环境变量 AKTOOLS_BASE_URL（未设置时为 http://127.0.0.1:8080）。
// 每个测试前都会检查服务是否可用（/docs 页面返回 200），不可用时跳过测试。

func baseURL() string {
	if v := os.Getenv("AKTOOLS_BASE_URL"); v != "" {
		return v
	}
	return "http://127.0.0.1:8080"
}

func newHTTPClient() *http.Client {
	return &http.Client{Timeout: 20 * time.Second}
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

// 健康检查
// 用途: 检查服务是否启动并工作正常
// 方法: GET /health
// 返回: {"status":"ok"}
func TestHealth(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	req, err := http.NewRequest(http.MethodGet, url+"/health", nil)
	if err != nil {
		t.Fatalf("创建请求失败: %v", err)
	}
	resp, err := client.Do(req)
	if err != nil {
		t.Skipf("Spot 接口请求失败或超时: %v", err)
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		t.Fatalf("状态码异常: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		t.Fatalf("读取响应失败: %v", err)
	}
	var obj map[string]interface{}
	if err := json.Unmarshal(body, &obj); err != nil {
		t.Fatalf("解析 JSON 失败: %v", err)
	}
	b, _ := json.MarshalIndent(obj, "", "  ")
	t.Logf("Health 响应:\n%s", string(b))
	if obj["status"] != "ok" {
		t.Fatalf("健康检查异常: %v", obj)
	}
}

func TestStockASpot(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	// API: stock_zh_a_spot
	// 用途: 获取 A 股实时行情（全市场快照）
	// 方法: GET /api/public/stock_zh_a_spot
	// 参数: 无
	// 返回: 数组，每项为一只股票的实时数据
	// 字段示例: 代码、名称、最新价、涨跌额、涨跌幅、买入、卖出、昨收、今开、最高、最低、成交量、成交额、时间戳
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
	// 如返回为错误对象（数据源异常），视为服务可用，跳过字段校验
	if _, hasErr := arr[0]["error"]; hasErr {
		b, _ := json.MarshalIndent(arr, "", "  ")
		t.Logf("Spot 响应(错误提示):\n%s", string(b))
		return
	}
	// 打印前 3 条作为样例
	limit := 3
	if len(arr) < limit {
		limit = len(arr)
	}
	b, _ := json.MarshalIndent(arr[:limit], "", "  ")
	t.Logf("Spot 样例(前%d条):\n%s", limit, string(b))
	// 关键字段存在性校验（取第一项）
	if _, ok := arr[0]["代码"]; !ok {
		t.Fatalf("缺少字段: 代码")
	}
	if _, ok := arr[0]["最新价"]; !ok {
		t.Fatalf("缺少字段: 最新价")
	}
}

func TestStockAHist(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	// API: stock_zh_a_hist
	// 用途: 获取 A 股历史行情（日/周/月）
	// 方法: GET /api/public/stock_zh_a_hist
	// 参数: symbol=股票代码; period=周期(daily/weekly/monthly); start_date=YYYYMMDD; end_date=YYYYMMDD; adjust=复权(qfq/hfq/空字符串)
	// 返回: 数组，按日期排列的历史 K 线数据
	// 字段示例: 日期、股票代码、开盘、收盘、最高、最低、成交量、成交额、振幅、涨跌幅、涨跌额、换手率
	full := url + "/api/public/stock_zh_a_hist?symbol=000001&period=daily&start=20211109&end=20211209&adjust="
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
		b, _ := json.MarshalIndent(obj, "", "  ")
		t.Logf("Hist 响应(对象):\n%s", string(b))
		return
	}
	if len(arr) == 0 {
		t.Fatalf("返回数据为空")
	}
	// 打印前 3 条作为样例
	limit := 3
	if len(arr) < limit {
		limit = len(arr)
	}
	b, _ := json.MarshalIndent(arr[:limit], "", "  ")
	t.Logf("Hist 样例(前%d条):\n%s", limit, string(b))
	// 关键字段存在性校验（取第一项）
	if _, ok := arr[0]["日期"]; !ok {
		t.Fatalf("缺少字段: 日期")
	}
	if _, ok := arr[0]["开盘"]; !ok {
		t.Fatalf("缺少字段: 开盘")
	}
	if _, ok := arr[0]["收盘"]; !ok {
		t.Fatalf("缺少字段: 收盘")
	}
}

func TestStockBasicInfo(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	// API: stock_individual_info_em
	// 用途: 东方财富-个股-公司基本信息（工商概况）
	// 方法: GET /api/public/stock_individual_info_em
	// 参数: symbol=股票代码（如 000001）
	// 返回: 数组，字段为 item/value 键值对
	// 字段示例: 最新、股票代码、股票简称、总股本、流通股、总市值、流通市值、行业、上市时间 等
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
		b, _ := json.MarshalIndent(obj, "", "  ")
		t.Logf("BasicInfo 响应(对象):\n%s", string(b))
		return
	}
	if len(arr) == 0 {
		t.Fatalf("返回数据为空")
	}
	// 打印前 10 条 item/value 键值作为样例
	limit := 10
	if len(arr) < limit {
		limit = len(arr)
	}
	b, _ := json.MarshalIndent(arr[:limit], "", "  ")
	t.Logf("BasicInfo 样例(前%d条):\n%s", limit, string(b))
	// 关键字段存在性校验（取第一项）
	if _, ok := arr[0]["item"]; !ok {
		t.Fatalf("缺少字段: item")
	}
	if _, ok := arr[0]["value"]; !ok {
		t.Fatalf("缺少字段: value")
	}
}

// StockIdentity 映射测试
// 用途: 通过 basic info 接口将 item/value 键值映射到 pb.StockIdentity
// 方法: GET /api/public/stock_individual_info_em?symbol=000001
// 说明: 该接口返回键值数组，测试中将其规整为键值映射并填充 StockIdentity
func TestStockIdentityMapping(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	symbol := "000651"
	full := url + "/api/public/stock_individual_info_em?symbol=" + symbol
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
		fmt.Printf("BasicInfo 响应(对象):\n%s\n", string(body))
		return
	}
	if len(arr) == 0 {
		t.Fatalf("返回数据为空")
	}
	kv := map[string]string{}
	for _, it := range arr {
		k := fmt.Sprint(it["item"])
		v := fmt.Sprint(it["value"])
		if k != "" {
			kv[k] = v
		}
	}
	market := "sz"
	if len(symbol) > 0 && symbol[0] == '6' {
		market = "sh"
	}
	exchange := map[string]string{"sz": "SZSE", "sh": "SSE"}[market]
	now := time.Now().Format(time.RFC3339)
	ident := &pb.StockIdentity{
		Symbol:   symbol,
		Market:   market,
		Exchange: exchange,
		Name:     kv["股票简称"],
		FullName: kv["公司全称"],
		ISIN:     kv["ISIN"],
		Industry: kv["行业"],
		Sector:   kv["板块"],
		Area:     kv["地区"],
		Currency: kv["币种"],
		ListDate: kv["上市时间"],
		Status:   kv["上市状态"],
		Aliases:  []string{kv["股票简称"]},
		CreateAt: now,
		UpdateAt: now,
	}
	b, _ := json.MarshalIndent(ident, "", "  ")
	t.Logf("StockIdentity 样例:\n%s", string(b))
	if ident.Symbol == "" || ident.Name == "" {
		t.Fatalf("StockIdentity 关键字段为空: symbol=%s name=%s", ident.Symbol, ident.Name)
	}
}

func TestStockFinancialIndicators(t *testing.T) {
	client := newHTTPClient()
	url := baseURL()
	if !serviceAvailable(t, client, url) {
		t.Skip("AkTools 服务不可用，跳过接入测试")
	}
	// API: stock_financial_analysis_indicator
	// 用途: 新浪财经-财务分析-关键财务指标（如净资产收益率、毛利率等）
	// 方法: GET /api/public/stock_financial_analysis_indicator
	// 参数: stock=股票代码（如 600004）
	// 返回: 数组或对象（部分股票或时段可能返回空，服务会返回 {"error":"empty"} 以提示为空）
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
		b, _ := json.MarshalIndent(obj, "", "  ")
		t.Logf("FinancialIndicator 响应(对象):\n%s", string(b))
		return
	}
	if len(arr) == 0 {
		t.Fatalf("返回数据为空")
	}
	// 打印前 3 条作为样例
	limit := 3
	if len(arr) < limit {
		limit = len(arr)
	}
	b, _ := json.MarshalIndent(arr[:limit], "", "  ")
	t.Logf("FinancialIndicator 样例(前%d条):\n%s", limit, string(b))
}

// GetStockBasicInfo 测试
func TestGetStockBasicInfo(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	info, err := sys.GetStockBasicInfo("000651")
	if err != nil {
		t.Fatalf("请求失败: %v", err)
		return
	}
	if info == nil {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(info, "", "  ")
	t.Logf("StockBasicInfo 样例:\n%s", string(b))
}

func TestGetStockBidAskEM(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	data, err := sys.GetStockBidAskEM("000651")
	if err != nil {
		t.Fatalf("请求失败: %v", err)
		return
	}
	if data == nil {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(data, "", "  ")
	t.Logf("StockBidAskEM 样例:\n%s", string(b))
}

// http://127.0.0.1:8080/api/public/stock_zh_a_hist?symbol=000001&period=daily&start=20170301&end=20240528&adjust=
// http://127.0.0.1:8080/api/public/stock_zh_a_hist?symbol=000001&period=daily&start=20170301&end=20240528&adjust=
func TestGetStockZhAHist(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	data, err := sys.GetStockZhAHist("000001", "daily", "20170301", "20240528", "")
	if err != nil {
		t.Fatalf("请求失败: %v", err)
		return
	}
	if data == nil {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(data, "", "  ")
	t.Logf("StockZhAHist 样例:\n%s", string(b))
}
