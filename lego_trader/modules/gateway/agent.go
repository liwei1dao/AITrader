package gateway

import (
	"context"
	"fmt"
	"lego_trader/comm"
	"lego_trader/pb"
	"net/url"
	"sync"
	"sync/atomic"
	"time"

	"lego_trader/lego/sys/log"
	"lego_trader/lego/sys/pools"

	"lego_trader/lego/utils/container/id"

	"github.com/gorilla/websocket"

	"google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/types/known/anypb"
)

/*
用户代理对象
封装用户socket 对象 处理用户的消息读取 写入 关闭等操作
*/

func newAgent(gateway IGateway, conn *websocket.Conn) *Agent {
	agent := &Agent{
		gateway:     gateway,
		wsConn:      conn,
		spath:       "home",
		sessionId:   id.NewXId(),
		writeChan:   make(chan []byte, 2),
		closeSignal: make(chan bool),
		state:       1,
	}
	agent.wg.Add(2)
	go agent.readLoop()
	go agent.writeLoop()
	return agent
}

// 用户代理
type Agent struct {
	gateway      IGateway
	wsConn       *websocket.Conn
	sessionId    string
	userId       string
	meta         map[string]interface{}
	spath        string
	writeChan    chan []byte
	closeSignal  chan bool
	state        int32 //状态 0 关闭 1 运行 2 关闭中
	wg           sync.WaitGroup
	queueIndex   int32     //排队编号
	lastpushtime time.Time //上次推送时间
}

func (this *Agent) readLoop() {
	defer this.wg.Done()
	var (
		data       []byte
		msgpackage *pb.MessagePackage = &pb.MessagePackage{}
		err        error
	)
locp:
	for {
		if _, data, err = this.wsConn.ReadMessage(); err != nil || len(data) == 0 {
			this.gateway.Errorf("agent:%s userId:%s ReadMessage err:%v", this.sessionId, this.userId, err)
			go this.Close()
			break locp
		}

		if err = proto.Unmarshal(data, msgpackage); err != nil {
			this.gateway.Errorf("agent:%s userId:%s Unmarshal err:%v", this.sessionId, this.userId, err)
			go this.Close()
			break locp
		} else {
			this.wsConn.SetReadDeadline(time.Now().Add(time.Second * 60))
			for _, msg := range msgpackage.Messages {
				if msg.MsgName == Msg_GatewayHeartbeat {
					data, _ := anypb.New(&pb.GatewayHeartbeatResp{
						Timestamp: time.Now().Unix(),
					})
					this.WriteMsgs(&pb.SocketMessage{
						MsgName:     Msg_GatewayHeartbeat,
						ServicePath: msg.ServicePath,
						Data:        data,
					})
					continue
				}
				if err = this.messageDistribution(msg); err != nil {
					this.gateway.Errorf("messageDistribution err:%v", err)
					data, _ := anypb.New(&pb.GatewayErrorNotifyPush{
						MsgName:     msg.MsgName,
						ServicePath: msg.ServicePath,
						Req:         msg.Data,
						Error:       &pb.ErrorData{Code: pb.ErrorCode_GatewayException, Message: err.Error()},
					})
					this.WriteMsgs(&pb.SocketMessage{
						MsgName:     Msg_GatewayErrornotify,
						ServicePath: msg.ServicePath,
						Data:        data,
					})
					go this.Close()
					break locp
				}
			}
		}
	}
	this.gateway.Debugf("agent:%s userId:%s readLoop end!", this.sessionId, this.userId)
}

func (this *Agent) writeLoop() {
	defer this.wg.Done()
	var (
		// data []byte
		err error
	)
locp:
	for {
		select {
		case <-this.closeSignal:
			break locp
		case msgs, ok := <-this.writeChan:
			if ok {
				//data, err = proto.Marshal(msg)
				if err = this.wsConn.WriteMessage(websocket.BinaryMessage, msgs); err != nil {
					this.gateway.Errorf("agent:%s userId:%s WriteMessage err:%v", this.sessionId, this.userId, err)
					go this.Close()
				}
			} else {
				go this.Close()
			}
		}
	}
	this.gateway.Debugf("agent:%s userId:%s writeLoop end!", this.sessionId, this.userId)
}

func (this *Agent) SessionId() string {
	return this.sessionId
}

func (this *Agent) IP() string {
	return this.wsConn.RemoteAddr().String()
}
func (this *Agent) UserId() string {
	return this.userId
}

func (this *Agent) ServicePath() string {
	return this.spath
}

func (this *Agent) GetSessionData() url.Values {
	uv := url.Values{}
	for k, v := range this.meta {
		if s, ok := v.(string); ok {
			uv.Set(k, s)
		}
	}
	return uv
}

func (this *Agent) UnBuild() {
	this.userId = ""
}

func (this *Agent) WriteMsgs(msgs ...*pb.SocketMessage) (err error) {
	if atomic.LoadInt32(&this.state) != 1 {
		return
	}
	var (
		msgpackage *pb.MessagePackage = &pb.MessagePackage{}
		data       []byte
	)
	msgpackage.Messages = msgs
	if data, err = proto.Marshal(msgpackage); err != nil {
		return
	}
	this.writeChan <- data
	return
}

func (this *Agent) WriteBytes(data []byte) (err error) {
	if atomic.LoadInt32(&this.state) != 1 {
		err = fmt.Errorf("userId%s Staet:%d", this.userId, this.state)
		return
	}
	this.writeChan <- data
	return
}

// 外部代用关闭
func (this *Agent) Close() {
	if !atomic.CompareAndSwapInt32(&this.state, 1, 2) {
		return
	}
	this.wsConn.Close()
	this.closeSignal <- true
	this.wg.Wait()
	atomic.StoreInt32(&this.state, 0)
	this.gateway.DisConnect(this)
}

// 处理用户消息 提供给外部使用 比如 登录等待逻辑
func (this *Agent) HandleMessage(msg *pb.SocketMessage) (err error) {
	if err = this.messageDistribution(msg); err != nil {
		this.gateway.Error("messageDistribution", log.Field{Key: "err", Value: err.Error()})
		data, _ := anypb.New(&pb.GatewayErrorNotifyPush{
			MsgName:     msg.MsgName,
			ServicePath: msg.ServicePath,
			Req:         msg.Data,
			Error:       &pb.ErrorData{Code: pb.ErrorCode_GatewayException, Message: err.Error()},
		})
		err = this.WriteMsgs(&pb.SocketMessage{
			MsgName: Msg_GatewayErrornotify,
			Data:    data,
		})
	}
	return
}

// 分发用户消息
func (this *Agent) messageDistribution(msg *pb.SocketMessage) (err error) {
	var (
		spath string                         = this.spath
		req   *pb.Rpc_GatewaySocketRouteReq  = pools.GetForType(socketReqTyoe).(*pb.Rpc_GatewaySocketRouteReq)
		reply *pb.Rpc_GatewaySocketRouteResp = pools.GetForType(socketRespTyoe).(*pb.Rpc_GatewaySocketRouteResp)
	)
	defer func() {
		pools.PutForType(socketReqTyoe, req)
		pools.PutForType(socketRespTyoe, reply)
	}()

	req.MsgName = msg.MsgName
	req.Message = msg.Data
	stime := time.Now()
	if spath == "" {
		spath = msg.ServicePath
	}
	if req.MsgName == "" {
		err = fmt.Errorf("no MsgName!")
		this.gateway.Error("[UserResponse]",
			log.Field{Key: "userId", Value: this.userId},
			log.Field{Key: "servicePath", Value: msg.ServicePath},
			log.Field{Key: "req", Value: fmt.Sprintf("%s:%v", req.MsgName, req.Message.String())},
			log.Field{Key: "err", Value: err.Error()},
		)
		return
	}

	if err = this.gateway.Service().RpcCall(context.Background(), spath, string(comm.Rpc_GatewayRoute), req, reply); err != nil {
		this.gateway.Error("[UserResponse]",
			log.Field{Key: "userId", Value: this.userId},
			log.Field{Key: "servicePath", Value: msg.ServicePath},
			log.Field{Key: "req", Value: fmt.Sprintf("%s:%v", req.MsgName, req.Message.String())},
			log.Field{Key: "err", Value: err.Error()},
		)
		return
	}

	this.gateway.Debug("[UserResponse]",
		log.Field{Key: "t", Value: time.Since(stime).Milliseconds()},
		log.Field{Key: "userId", Value: this.userId},
		log.Field{Key: "req", Value: fmt.Sprintf("%s:%v", req.MsgName, req.Message.String())},
		log.Field{Key: "reply", Value: reply.String()},
	)

	if reply.ErrorData != nil {
		data, _ := anypb.New(&pb.GatewayErrorNotifyPush{
			MsgName: msg.MsgName,
			Req:     msg.Data,
			Error:   reply.ErrorData})
		err = this.WriteMsgs(&pb.SocketMessage{
			MsgName: Msg_GatewayErrornotify,
			Data:    data,
		})
		return
	} else {
		if msg.MsgName == Msg_UserLogin {
			for _, v := range reply.Reply {
				if v.MsgName == msg.MsgName && v.MsgName == Msg_UserLogin {
					var (
						resp     proto.Message
						signresp *pb.UserSginResp
					)
					if resp, err = v.Data.UnmarshalNew(); err != nil {
						return
					}
					signresp = resp.(*pb.UserSginResp)
					this.userId = signresp.User.Uid
					this.spath = reply.ServicePath
				}
			}
		}
		if err = this.WriteMsgs(reply.Reply...); err != nil {
			return
		}
	}
	return nil
}
