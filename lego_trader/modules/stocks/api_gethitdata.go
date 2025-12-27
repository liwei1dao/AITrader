package stocks

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 获取股票历史K线数据接口
@Description 获取用户关注的股票历史K线数据
@Tags User
@Accept  json
@Produce  json
@Param user body pb.StockGetHitDataReq true "获取股票历史K线数据请求"
@Success 200 {object} comm.HttpResult{data=pb.StockGetHitDataResp} "成功返回股票历史K线数据"
@Router /api/home/stocks.gethitdata [post]
*/
func (this *apiComp) GetHitData(session comm.IUserSession, req *pb.StockGetHitDataReq) (errdata *pb.ErrorData) {
	var (
		err   error
		items []*pb.DBStockBar
	)
	if items, err = this.module.model.getStockHitData(req.Code, req.Period); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("stocks.gethitdata", &pb.StockGetHitDataResp{
		Items: items,
	})
	return
}
