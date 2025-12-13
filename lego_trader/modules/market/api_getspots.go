package market

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 获取股票指数接口
@Description 获取用户关注的股票指数
@Tags User
@Accept  json
@Produce  json
@Param user body pb.MarketGetSpotsReq true "获取股票指数请求"
@Success 200 {object} comm.HttpResult{data=pb.MarketGetSpotsResp} "成功返回股票指数信息"
@Router /api/home/market_getspots [post]
*/
func (this *apiComp) GetSpots(session comm.IUserSession, req *pb.MarketGetSpotsReq) (errdata *pb.ErrorData) {
	var (
		err   error
		items []*pb.DBMarketSpotItem
	)
	if items, err = this.module.model.getMarketSpot([]string{
		"000001.SH",
		"000002.SH",
	}); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("market.getspots", &pb.MarketGetSpotsResp{
		Items: items,
	})
	return
}
