package user

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 获取用户关注的股票接口
@Description 获取用户关注的股票
@Tags User
@Accept  json
@Produce  json
@Param user body pb.UserGetStocksReq true "获取股票请求"
@Success 200 {object} comm.HttpResult{data=pb.UserGetStocksResp} "成功返回用户关注的股票信息"
@Router /api/home/user_getstocks [post]
*/
func (this *apiComp) GetStocks(session comm.IUserSession, req *pb.UserGetStocksReq) (errdata *pb.ErrorData) {
	var (
		stocks []*pb.DBUserStock
		err    error
	)

	if stocks, err = this.module.model.getUserStock(session.GetUserId()); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("user.getstocks", &pb.UserGetStocksResp{
		Stocks: stocks,
	})
	return
}
