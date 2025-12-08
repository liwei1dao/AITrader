package modules

import (
	"lego_trader/comm"
	"lego_trader/pb"
	"reflect"

	"google.golang.org/protobuf/proto"
)

var (
	typeOfSession   = reflect.TypeOf((*comm.IUserSession)(nil)).Elem()
	typeOfMessage   = reflect.TypeOf((*proto.Message)(nil)).Elem()
	typeOfErrorCode = reflect.TypeOf((*pb.ErrorCode)(nil)).Elem()
	typeOfErrorData = reflect.TypeOf((*pb.ErrorData)(nil))
	typeOfError     = reflect.TypeOf((*error)(nil)).Elem()
)
