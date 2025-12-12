package comm

import (
	"context"
	"fmt"
	"lego_trader/lego/utils"
	"lego_trader/pb"
	"net/url"
	"sync"

	"google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/types/known/anypb"
)

// session Session 临时数据key
const (
	ContextKey_Service     = "service"    //服务
	SessionMeta_SessionId  = "sessionid"  //会话Id
	SessionMeta_UserId     = "userid"     //用户id
	SessionMeta_ServiceTag = "servicetag" //集群标签
	SessionMeta_DeviceId   = "deviceid"   //设备id
)

func NewUserSession() IUserSession {
	return &UserSession{
		meta:     make(map[string]string),
		cache:    make(map[string]interface{}),
		msgqueue: make([]*pb.SocketMessage, 0),
	}
}

// 用户会话
type UserSession struct {
	service   IService
	values    url.Values
	metalock  sync.RWMutex
	meta      map[string]string
	cachelock sync.RWMutex
	cache     map[string]interface{}
	msgqueue  []*pb.SocketMessage
}

// 重置
func (this *UserSession) SetSession(ctx context.Context, values string) {
	this.metalock.Lock()
	this.values, _ = url.ParseQuery(values)
	for k, v := range this.values {
		if len(v) > 0 {
			this.meta[k] = v[0]
		}
	}
	this.metalock.Unlock()
	if v := ctx.Value(ContextKey_Service); v != nil {
		this.service = v.(IService)
	}
}

// 重置
func (this *UserSession) Reset() {
	this.meta = make(map[string]string)
	this.cache = make(map[string]interface{})
}

func (this *UserSession) GetMateToString(key string) string {
	value, _ := this.GetMate(key)
	return value
}
func (this *UserSession) GetMateToInt64(key string) int64 {
	value, _ := this.GetMate(key)
	return utils.StringToInt64(value)
}
func (this *UserSession) GetMateToUInt64(key string) uint64 {
	value, _ := this.GetMate(key)
	return utils.StringToUInt64(value)
}
func (this *UserSession) GetMateToInt32(key string) int32 {
	value, _ := this.GetMate(key)
	return int32(utils.StringToInt64(value))
}

func (this *UserSession) GetMateToFloat64(key string) float64 {
	value, _ := this.GetMate(key)
	return utils.StringToFloat64(value)
}
func (this *UserSession) SetMateForFloat64(key string, value float64) {
	this.SetMate(key, fmt.Sprintf("%f", value))
}

func (this *UserSession) SetMateForInt64(key string, value int64) {
	this.SetMate(key, fmt.Sprintf("%d", value))
}
func (this *UserSession) GetMateToBool(key string) bool {
	value, _ := this.GetMate(key)
	return utils.StringToInt64(value) == 1
}

// 获取用户id
func (this *UserSession) GetServiceTag() string {
	value, _ := this.GetMate(SessionMeta_ServiceTag)
	return value
}

// 获取用户id
func (this *UserSession) GetSessionId() string {
	value, _ := this.GetMate(SessionMeta_SessionId)
	return value
}
func (this *UserSession) GetUserId() string {
	value, _ := this.GetMate(SessionMeta_UserId)
	return value
}

// 写入元数据
func (this *UserSession) SetMate(name, value string) {
	this.metalock.Lock()
	this.meta[name] = value
	this.values.Add(name, value)
	this.metalock.Unlock()
}

func (this *UserSession) SetMates(values string) {
	temp_values, _ := url.ParseQuery(values)
	this.metalock.Lock()
	for k, v := range temp_values {
		if len(v) > 0 {
			this.meta[k] = v[0]
			this.values.Add(k, v[0])
		}
	}
	this.metalock.Unlock()
}

// 写入元数据
func (this *UserSession) GetMate(name string) (value string, ok bool) {
	this.metalock.RLock()
	value, ok = this.meta[name]
	this.metalock.RUnlock()
	return
}

// 写入元数据
func (this *UserSession) SetCache(name string, value interface{}) {
	this.cachelock.Lock()
	this.cache[name] = value
	this.cachelock.Unlock()
}

// 写入元数据
func (this *UserSession) GetCache(name string) (value interface{}, ok bool) {
	this.cachelock.RLock()
	value, ok = this.cache[name]
	this.cachelock.RUnlock()
	return
}

// 克隆
func (this *UserSession) Clone(ctx context.Context) (session IUserSession) {
	session = this.service.GetUserSession(ctx, "")
	this.metalock.RLock()
	for k, v := range this.meta {
		session.SetMate(k, v)
	}
	this.metalock.RUnlock()
	this.cachelock.RLock()
	for k, v := range this.cache {
		session.SetCache(k, v)
	}
	this.cachelock.RUnlock()
	return
}

func (this *UserSession) GetMetas() (meta string) {
	this.metalock.RLock()
	defer this.metalock.RUnlock()
	return this.values.Encode()
}

func (this *UserSession) GetChangeMeta() (meta string) {
	this.metalock.RLock()
	defer this.metalock.RUnlock()
	return this.values.Encode()
}

// 向用户发送消息
func (this *UserSession) SendMsg(MsgName string, msg proto.Message) (err error) {
	data, _ := anypb.New(msg)
	this.msgqueue = append(this.msgqueue, &pb.SocketMessage{
		MsgName:     MsgName,
		ServicePath: fmt.Sprintf("%s/%s", this.service.GetType(), this.service.GetId()),
		Data:        data,
	})
	return
}

// 采用先进先出逻辑 清空消息队列
func (this *UserSession) Polls() (msgs []*pb.SocketMessage) {
	this.msgqueue, msgs = this.msgqueue[:0], this.msgqueue
	return
}
