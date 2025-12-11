package gozero

import (
	"context"
	"fmt"
	"net"
	"testing"

	"lego_trader/lego/core"
	"lego_trader/pb"

	"github.com/zeromicro/go-zero/zrpc"
	"google.golang.org/grpc"
)

func TestGoZeroService_Invoke(t *testing.T) {
	s := &GoZeroService{}
	s.option = &Options{
		Version:      "test",
		Setting:      core.ServiceSttings{Id: "svc-test", Type: "svc", Tag: "test"},
		GoZeroConfig: GoZeroConfig{Port: 0, Addr: ""},
	}
	s.handlers = make(map[string]reflectFunc)
	s.clients = make(map[string]*grpc.ClientConn)
	lis, err := net.Listen("tcp", ":0")
	if err != nil {
		t.Fatalf("listen err: %v", err)
	}
	port := lis.Addr().(*net.TCPAddr).Port
	_ = lis.Close()
	s.option.GoZeroConfig.Addr = fmt.Sprintf("127.0.0.1:%d", port)
	srv := zrpc.MustNewServer(zrpc.RpcServerConf{ListenOn: s.option.GoZeroConfig.Addr}, func(gs *grpc.Server) {
		gs.RegisterService(&GenericServiceDesc, s)
	})
	go func() { srv.Start() }()

	if err := s.Register("gateway/heartbeat", func(ctx context.Context, req *pb.GatewayHeartbeatReq, resp *pb.GatewayHeartbeatResp) error {
		resp.Timestamp = 123
		return nil
	}); err != nil {
		t.Fatalf("register err: %v", err)
	}

	var reply pb.GatewayHeartbeatResp
	if err := s.RpcCall(context.Background(), "gozero-test", "gateway/heartbeat", &pb.GatewayHeartbeatReq{}, &reply); err != nil {
		t.Fatalf("rpc err: %v", err)
	}
	if reply.Timestamp != 123 {
		t.Fatalf("unexpected reply: %d", reply.Timestamp)
	}
	srv.Stop()
}
