package akshare_test

import (
	"encoding/json"
	"testing"

	"lego_trader/sys/akshare"
)

// GetStockBasicInfo 测试
func TestGetStockBasicInfo(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	info, err := sys.GetStockBasicInfo("601127")
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

// GetStockNewsMainCx 测试
func TestGetStockNewsMainCx(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	data, err := sys.GetStockNewsMainCx()
	if err != nil {
		t.Fatalf("请求失败: %v", err)
		return
	}
	if data == nil {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(data, "", "  ")
	t.Logf("StockNewsMainCx 样例:\n%s", string(b))
}

// GetStockSzseSummary 测试
func TestGetStockSzseSummary(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	data, err := sys.GetStockSzseSummary()
	if err != nil {
		t.Fatalf("请求失败: %v", err)
		return
	}
	if data == nil {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(data, "", "  ")
	t.Logf("StockSzseSummary 样例:\n%s", string(b))
}
