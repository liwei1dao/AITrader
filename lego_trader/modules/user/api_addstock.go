package user

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 添加股票接口
@Description 添加用户关注的股票
@Tags User
@Accept  json
@Produce  json
@Param user body pb.UserAddStockReq true "添加股票请求"
@Success 200 {object} comm.HttpResult{data=pb.UserAddStockResp} "成功返回添加股票信息"
@Router /api/home/user_addstock [post]
*/
func (this *apiComp) AddStock(session comm.IUserSession, req *pb.UserAddStockReq) (errdata *pb.ErrorData) {
	var (
		err error
	)
	if err = this.module.model.addUserStock(req.Stock); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("user.addstock", &pb.UserAddStockResp{
		Stock: req.Stock,
	})
	return
}
