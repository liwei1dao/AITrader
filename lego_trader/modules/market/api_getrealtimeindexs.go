package market

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 获取实时指数数据
@Description 获取用户关注的股票指数实时数据
@Tags User
@Accept  json
@Produce  json
@Param user body pb.MarketGetRealTimeIndexsReq true "获取股票指数请求"
@Success 200 {object} comm.HttpResult{data=pb.MarketGetRealTimeIndexsResp} "成功返回股票指数信息"
@Router /api/home/market_getrealtimeindexs [post]
*/
func (this *apiComp) GetRealTimeIndexs(session comm.IUserSession, req *pb.MarketGetRealTimeIndexsReq) (errdata *pb.ErrorData) {
	var (
		err   error
		items []*pb.DBMarketIndexRealTimeItem
	)
	if items, err = this.module.model.getMarketRealTimeIndexs(); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("market.getspots", &pb.MarketGetRealTimeIndexsResp{
		Items: items,
	})
	return
}
