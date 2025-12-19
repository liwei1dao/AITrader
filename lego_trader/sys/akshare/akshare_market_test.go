package akshare_test

import (
	"encoding/json"
	"testing"

	"lego_trader/sys/akshare"
)

// TestGetStockSzseSummary
// 接口作用: 获取深圳证券交易所 summary（东方财富 stock_szse_summary）
// 参数: 无；返回: 深圳证券交易所 summary（结构化）
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

// TestGetStockMarketFundFlow
// 接口作用: 获取大盘资金流向，用于大盘看板资金流模块展示
// 参数: t 测试上下文
// 返回值: 无
// 异常: 上游不可用或被限流时跳过；断言失败抛出测试错误
func TestGetStockMarketFundFlow(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	data, err := sys.GetStockMarketFundFlow()
	if err != nil {
		t.Skipf("上游不可用或被限流: %v", err)
		return
	}
	if data == nil || len(data.Items) == 0 {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(data.Items[:min(5, len(data.Items))], "", "  ")
	t.Logf("StockMarketFundFlow 样例(前5条):\n%s", string(b))
}

// TestGetStockZhIndexSpot
// 接口作用: 获取沪深主要指数实时行情，用于大盘看板指数卡片数据源
// 参数: t 测试上下文
// 返回值: 无
// 异常: 断言失败时抛出测试错误
func TestGetStockZhIndexSpot(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	data, err := sys.GetStockZhIndexSpot()
	if err != nil {
		t.Skipf("上游不可用或被限流: %v", err)
		return
	}
	if len(data) == 0 {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(data[:min(4, len(data))], "", "  ")
	t.Logf("StockZhIndexSpot 样例(前4条):\n%s", string(b))
}

// TestGetStockZhASpotEM
// 接口作用: 获取沪深京 A 股实时行情，用于市场宽度统计与涨跌榜
// 参数: t 测试上下文
// 返回值: 无
// 异常: 断言失败时抛出测试错误
func TestGetStockZhASpotEM(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	records, err := sys.GetStockZhASpotEM()
	if err != nil {
		t.Skipf("上游不可用或被限流: %v", err)
		return
	}
	if len(records) == 0 {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(records[:min(5, len(records))], "", "  ")
	t.Logf("StockZhASpotEM 样例(前5条):\n%s", string(b))
}

// TestGetStockCyASpotEM
// 接口作用: 获取创业板实时行情，用于分板块视图与创业板榜单
// 参数: t 测试上下文
// 返回值: 无
// 异常: 断言失败时抛出测试错误
func TestGetStockCyASpotEM(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	records, err := sys.GetStockCyASpotEM()
	if err != nil {
		t.Skipf("上游不可用或被限流: %v", err)
		return
	}
	if len(records) == 0 {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(records[:min(5, len(records))], "", "  ")
	t.Logf("StockCyASpotEM 样例(前5条):\n%s", string(b))
}

// TestGetStockKcASpotEM
// 接口作用: 获取科创板实时行情，用于分板块视图与科创板榜单
// 参数: t 测试上下文
// 返回值: 无
// 异常: 断言失败时抛出测试错误
func TestGetStockKcASpotEM(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	records, err := sys.GetStockKcASpotEM()
	if err != nil {
		t.Skipf("上游不可用或被限流: %v", err)
		return
	}
	if len(records) == 0 {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(records[:min(5, len(records))], "", "  ")
	t.Logf("StockKcASpotEM 样例(前5条):\n%s", string(b))
}

// TestGetStockInfoGlobalThs
// 接口作用: 获取全球股市资讯（同花顺 stock_info_global_ths）
// 参数: t 测试上下文
// 返回值: 无
// 异常: 断言失败时抛出测试错误
func TestGetStockInfoGlobalThs(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	records, err := sys.GetStockInfoGlobalThs()
	if err != nil {
		t.Skipf("上游不可用或被限流: %v", err)
		return
	}
	if len(records) == 0 {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(records[:min(5, len(records))], "", "  ")
	t.Logf("StockInfoGlobalThs 样例(前5条):\n%s", string(b))
}
