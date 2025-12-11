package user

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

func (this *apiComp) Sgin(session comm.IUserSession, req *pb.UserSginReq) (resp *pb.UserSginResp, errdata *pb.ErrorData) {
	resp = &pb.UserSginResp{}
	return
}
