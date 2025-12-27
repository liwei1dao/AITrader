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

// TestGetStockZhAHist
// 接口作用: 获取A股历史行情数据，用于个股K线与回测数据源
// 参数: t 测试上下文
// 返回值: 无
// 异常: 断言失败时抛出测试错误
func TestGetStockZhAHist(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	data, err := sys.GetStockZhAHist("000651", "weekly", "20170301", "20240528", "")
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

// TestGetStockNewsMainCx
// 接口作用: 获取市场要闻，用于大盘看板新闻/快讯模块
// 参数: t 测试上下文
// 返回值: 无
// 异常: 断言失败时抛出测试错误
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

// TestGetStockIndividualFundFlow
// 接口作用: 获取个股资金流向，用于个股页面资金流模块展示
// 参数: t 测试上下文
// 返回值: 无
// 异常: 上游不可用或被限流时跳过；断言失败抛出测试错误
func TestGetStockIndividualFundFlow(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	data, err := sys.GetStockIndividualFundFlow("000001", "sh")
	if err != nil {
		t.Skipf("上游不可用或被限流: %v", err)
		return
	}
	if len(data) == 0 {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(data[:min(5, len(data))], "", "  ")
	t.Logf("StockIndividualFundFlow 样例(前5条):\n%s", string(b))
}
