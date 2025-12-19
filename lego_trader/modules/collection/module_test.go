package collection_test

import (
	"context"
	"encoding/json"
	"fmt"
	"lego_trader/comm"
	"lego_trader/pb"
	"lego_trader/sys/akshare"
	"lego_trader/sys/db"
	"testing"
)

func TestStockAkshareComp(t *testing.T) {
	err := db.OnInit(nil,
		db.SetMysqlUrl("root:li13451234@tcp(localhost:3306)/trader?charset=utf8mb4&parseTime=True&loc=Local"),
		db.SetRedisAddr([]string{"localhost:6379"}),
		db.SetRedisPassword("li13451234"),
		db.SetRedisDB(1),
	)
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}
	err = akshare.OnInit(nil, akshare.SetBaseUrl("http://127.0.0.1:8080"))
	if err != nil {
		t.Fatalf("初始化失败: %v", err)
		return
	}

	records, err := akshare.GetStockInfoGlobalThs()
	if err != nil {
		return
	}
	ctx := context.Background()
	redisPip := db.Redis().Pipeline()
	for _, r := range records {
		item := &pb.DBRealTimeGlobalNews{
			Title:       r.Title,
			Content:     r.Content,
			Url:         r.URL,
			PublishTime: r.PublishTime,
		}
		var b []byte
		if b, err = json.Marshal(item); err != nil {
			return
		}
		redisPip.LPush(ctx, fmt.Sprintf("%s:%s", comm.Redis_RealtimeNewsQueue, "stock_info_global_ths"), string(b))
	}
	_, err = redisPip.Exec(ctx)

}
