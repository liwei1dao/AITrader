package gateway

import (
	"lego_trader/pb"
	"reflect"
)

var (
	httpReqTyoe, httpRespTyoe reflect.Type = reflect.TypeOf(&pb.Rpc_GatewayHttpRouteReq{}), reflect.TypeOf(&pb.Rpc_GatewayHttpRouteResp{})
)
