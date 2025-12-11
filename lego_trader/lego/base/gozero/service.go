package gozero

import (
	"context"
	"fmt"
	"reflect"
	"sync"

	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/lego/sys/event"
	"lego_trader/lego/sys/log"
	"lego_trader/pb"

	"github.com/zeromicro/go-zero/core/discov"
	"github.com/zeromicro/go-zero/zrpc"
	"google.golang.org/grpc"
	"google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/types/known/anypb"
)

type GoZeroService struct {
	cbase.ServiceBase
	option      *Options
	serviceNode *core.ServiceNode
	grpcServer  *grpc.Server
	zserver     interface{ Stop() }
	mu          sync.RWMutex
	handlers    map[string]reflectFunc
	clients     map[string]*grpc.ClientConn
}

type reflectFunc struct {
	f interface{}
}

func (s *GoZeroService) GetTag() string                   { return s.option.Setting.Tag }
func (s *GoZeroService) GetId() string                    { return s.option.Setting.Id }
func (s *GoZeroService) GetType() string                  { return s.option.Setting.Type }
func (s *GoZeroService) GetVersion() string               { return s.option.Version }
func (s *GoZeroService) GetSettings() core.ServiceSttings { return s.option.Setting }

func (s *GoZeroService) Configure(option ...Option) {
	s.option = newOptions(option...)
	s.serviceNode, _ = core.NewServiceNode(fmt.Sprintf("%s=%s&%s=%s&%s=%s&%s=%s",
		core.ServiceNode_Tag, s.option.Setting.Tag,
		core.ServiceNode_Type, s.option.Setting.Type,
		core.ServiceNode_Id, s.option.Setting.Id,
		core.ServiceNode_Addr, s.option.GoZeroConfig.Addr,
	))
}

func (s *GoZeroService) Init(service core.IService) (err error) {
	if err = s.ServiceBase.Init(service); err != nil {
		return
	}
	s.handlers = make(map[string]reflectFunc)
	s.clients = make(map[string]*grpc.ClientConn)
	addr := s.option.GoZeroConfig.Addr
	if addr == "" {
		addr = fmt.Sprintf("127.0.0.1:%d", s.option.GoZeroConfig.Port)
	}
	conf := zrpc.RpcServerConf{ListenOn: addr}
	if len(s.option.GoZeroConfig.ETCDServers) > 0 {
		conf.Etcd = discov.EtcdConf{Hosts: s.option.GoZeroConfig.ETCDServers, Key: fmt.Sprintf("%s/%s", s.option.Setting.Tag, s.option.Setting.Type)}
	}
	server := zrpc.MustNewServer(conf, func(gs *grpc.Server) {
		s.grpcServer = gs
		gs.RegisterService(&GenericServiceDesc, s)
	})
	s.zserver = server
	go func() {
		server.Start()
	}()
	return
}

func (s *GoZeroService) InitSys() {
	if err := log.OnInit(s.option.Setting.Sys["log"]); err != nil {
		panic(fmt.Sprintf("sys log Init err:%v", err))
	} else {
		log.Infof("sys log Init success !")
	}
	if err := event.OnInit(s.option.Setting.Sys["event"]); err != nil {
		log.Panicf(fmt.Sprintf("sys event Init err:%v", err))
	} else {
		log.Infof("sys event Init success !")
	}
}

func (s *GoZeroService) Destroy() (err error) {
	if s.zserver != nil {
		s.zserver.Stop()
	} else if s.grpcServer != nil {
		s.grpcServer.GracefulStop()
	}
	s.mu.Lock()
	for _, c := range s.clients {
		_ = c.Close()
	}
	s.clients = map[string]*grpc.ClientConn{}
	s.mu.Unlock()
	return s.ServiceBase.Destroy()
}

func (s *GoZeroService) Register(name string, fn interface{}) (err error) {
	s.mu.Lock()
	s.handlers[name] = reflectFunc{f: fn}
	s.mu.Unlock()
	return
}

func (s *GoZeroService) RpcCall(ctx context.Context, servicePath string, serviceMethod string, args proto.Message, reply proto.Message) (err error) {
	conn, err := s.getConn(servicePath)
	if err != nil {
		return
	}
	anyArg, err := anypb.New(args)
	if err != nil {
		return
	}
	req := &pb.MessagePackage{Messages: []*pb.SocketMessage{{MsgName: serviceMethod, ServicePath: servicePath, Data: anyArg}}}
	resp := new(pb.MessagePackage)
	if err = conn.Invoke(ctx, "/lego.GenericService/Invoke", req, resp); err != nil {
		return
	}
	if len(resp.Messages) == 0 || resp.Messages[0].Data == nil {
		return fmt.Errorf("empty response")
	}
	if err = resp.Messages[0].Data.UnmarshalTo(reply); err != nil {
		return
	}
	return
}

func (s *GoZeroService) RpcBroadcast(ctx context.Context, servicePath string, serviceMethod string, args proto.Message, reply proto.Message) (err error) {
	return s.RpcCall(ctx, servicePath, serviceMethod, args, reply)
}

func (s *GoZeroService) getConn(servicePath string) (*grpc.ClientConn, error) {
	s.mu.RLock()
	c := s.clients[servicePath]
	s.mu.RUnlock()
	if c != nil {
		return c, nil
	}
	addr := s.option.GoZeroConfig.Addr
	if addr == "" {
		addr = fmt.Sprintf("127.0.0.1:%d", s.option.GoZeroConfig.Port)
	}
	var cc *grpc.ClientConn
	var err error
	if len(s.option.GoZeroConfig.ETCDServers) > 0 {
		cli := zrpc.MustNewClient(zrpc.RpcClientConf{Etcd: discov.EtcdConf{Hosts: s.option.GoZeroConfig.ETCDServers, Key: fmt.Sprintf("%s/%s", s.option.Setting.Tag, s.option.Setting.Type)}})
		cc = cli.Conn()
	} else {
		cli := zrpc.MustNewClient(zrpc.RpcClientConf{Endpoints: []string{addr}})
		cc = cli.Conn()
	}
	if err != nil {
		return nil, err
	}
	s.mu.Lock()
	s.clients[servicePath] = cc
	s.mu.Unlock()
	return cc, nil
}

func (s *GoZeroService) Invoke(ctx context.Context, in *pb.MessagePackage) (*pb.MessagePackage, error) {
	out := &pb.MessagePackage{Messages: make([]*pb.SocketMessage, 0, len(in.Messages))}
	for _, m := range in.Messages {
		s.mu.RLock()
		rf, ok := s.handlers[m.MsgName]
		s.mu.RUnlock()
		if !ok || rf.f == nil {
			return nil, fmt.Errorf("no handler: %s", m.MsgName)
		}
		fn := rf.f
		vfn := reflect.ValueOf(fn)
		tfn := vfn.Type()
		if tfn.NumIn() != 3 || tfn.NumOut() != 1 {
			return nil, fmt.Errorf("invalid handler signature: %s", m.MsgName)
		}
		argv := reflect.New(tfn.In(1).Elem()).Interface()
		rpv := reflect.New(tfn.In(2).Elem()).Interface()
		ap, ok := argv.(proto.Message)
		if !ok {
			return nil, fmt.Errorf("args not proto: %s", m.MsgName)
		}
		if m.Data != nil {
			if err := m.Data.UnmarshalTo(ap); err != nil {
				return nil, err
			}
		}
		rv := vfn.Call([]reflect.Value{reflect.ValueOf(ctx), reflect.ValueOf(ap), reflect.ValueOf(rpv)})
		if !rv[0].IsNil() {
			return nil, rv[0].Interface().(error)
		}
		rpmsg, ok := rpv.(proto.Message)
		if !ok {
			return nil, fmt.Errorf("reply not proto: %s", m.MsgName)
		}
		anyReply, err := anypb.New(rpmsg)
		if err != nil {
			return nil, err
		}
		out.Messages = append(out.Messages, &pb.SocketMessage{MsgName: m.MsgName, ServicePath: m.ServicePath, Data: anyReply})
	}
	return out, nil
}

var GenericServiceDesc = grpc.ServiceDesc{
	ServiceName: "lego.GenericService",
	HandlerType: (*GenericServiceServer)(nil),
	Methods:     []grpc.MethodDesc{{MethodName: "Invoke", Handler: genericInvokeHandler}},
}

func genericInvokeHandler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(pb.MessagePackage)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(GenericServiceServer).Invoke(ctx, in)
	}
	info := &grpc.UnaryServerInfo{Server: srv, FullMethod: "/lego.GenericService/Invoke"}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(GenericServiceServer).Invoke(ctx, req.(*pb.MessagePackage))
	}
	return interceptor(ctx, in, info, handler)
}

type GenericServiceServer interface {
	Invoke(ctx context.Context, in *pb.MessagePackage) (*pb.MessagePackage, error)
}
