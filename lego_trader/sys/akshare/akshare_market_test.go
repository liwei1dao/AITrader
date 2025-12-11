package akshare_test

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"lego_trader/sys/akshare"
)

func TestGetStockSzseSummary_WithMockServer(t *testing.T) {
	mux := http.NewServeMux()
	mux.HandleFunc("/api/public/stock_szse_summary", func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Content-Type", "application/json")
		_, _ = w.Write([]byte(`[
  {"证券类别": "股票", "数量": 2874, "成交金额": 492745828554.63, "总市值": 25837664936960.49, "流通市值": 22051689693333.94},
  {"证券类别": "主板A股", "数量": 1767, "成交金额": 33333333.33, "总市值": null, "流通市值": null}
]`))
	})
	ts := httptest.NewServer(mux)
	defer ts.Close()

	sys, err := akshare.NewSys(akshare.SetBaseUrl(ts.URL))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	summary, err := sys.GetStockSzseSummary()
	if err != nil {
		t.Fatalf("请求失败: %v", err)
		return
	}
	if summary == nil || len(summary.Items) == 0 {
		t.Fatalf("返回数据为空")
	}
	b, _ := json.MarshalIndent(summary, "", "  ")
	t.Logf("StockSzseSummary 样例:\n%s", string(b))

	if summary.Items[0].TotalVal == nil || summary.Items[0].FloatVal == nil {
		t.Fatalf("应解析为非空数值")
	}
	if summary.Items[1].TotalVal != nil || summary.Items[1].FloatVal != nil {
		t.Fatalf("应解析为 nil")
	}
}
