package collection_test

import (
	"encoding/csv"
	"fmt"
	"os"
	"testing"
	"time"

	"lego_trader/sys/akshare"
)

func TestStockStockDayHist(t *testing.T) {
	sys, err := akshare.NewSys(akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		fmt.Printf("创建 akshare 系统失败: %v", err)
		return
	}
	// 1. 设置时间范围：近2年
	endDate := time.Now()
	startDate := endDate.AddDate(-2, 0, 0)
	startStr := startDate.Format("20060102")
	endStr := endDate.Format("20060102")

	// 2. 获取股票列表（为了测试演示，这里只取少量股票，实际使用可获取全量）
	// 这里演示采集 "600000" (浦发银行) 和 "000001" (平安银行)
	// 如果需要全量，可以先调用 akshare.GetStockZhASpotEM() 获取列表
	stockCodes := []string{"600000", "000001"}

	// 3. 创建数据保存目录
	dataDir := "../../data/stock_history_go"
	if err := os.MkdirAll(dataDir, 0755); err != nil {
		t.Fatalf("创建目录失败: %v", err)
	}

	for _, code := range stockCodes {
		t.Logf("正在采集股票 %s 的历史数据 (%s - %s)...", code, startStr, endStr)

		// 调用 akshare 获取历史日线数据 (前复权)
		records, err := sys.GetStockZhAHist(code, "daily", startStr, endStr, "qfq")
		if err != nil {
			t.Errorf("获取股票 %s 数据失败: %v", code, err)
			continue
		}

		if len(records) == 0 {
			t.Logf("股票 %s 无数据", code)
			continue
		}

		// 4. 保存为 CSV 文件
		fileName := fmt.Sprintf("%s/%s.csv", dataDir, code)
		file, err := os.Create(fileName)
		if err != nil {
			t.Errorf("创建文件 %s 失败: %v", fileName, err)
			continue
		}
		defer file.Close()

		// 写入 UTF-8 BOM，防止 Excel 打开乱码
		file.WriteString("\xEF\xBB\xBF")

		writer := csv.NewWriter(file)
		defer writer.Flush()

		// 写入表头
		header := []string{"日期", "开盘", "收盘", "最高", "最低", "成交量", "成交额", "振幅", "涨跌幅", "涨跌额", "换手率"}
		if err := writer.Write(header); err != nil {
			t.Errorf("写入表头失败: %v", err)
			continue
		}

		// 写入数据行
		for _, r := range records {
			record := []string{
				r.Date,
				fmt.Sprintf("%f", r.Open),
				fmt.Sprintf("%f", r.Close),
				fmt.Sprintf("%f", r.High),
				fmt.Sprintf("%f", r.Low),
				fmt.Sprintf("%f", r.Volume),
				fmt.Sprintf("%f", r.Turnover),
				fmt.Sprintf("%f", r.Amplitude),
				fmt.Sprintf("%f", r.ChangePct),
				fmt.Sprintf("%f", r.ChangeAmt),
				fmt.Sprintf("%f", r.TurnoverRate),
			}
			if err := writer.Write(record); err != nil {
				t.Errorf("写入数据失败: %v", err)
				break
			}
		}

		t.Logf("股票 %s 数据采集完成，已保存至 %s，共 %d 条记录", code, fileName, len(records))

		// 简单的限流，防止请求过快
		time.Sleep(500 * time.Millisecond)
	}
}
