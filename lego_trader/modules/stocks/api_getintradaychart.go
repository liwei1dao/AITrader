package stocks

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 获取股票分时数据接口
@Description 获取用户关注的股票分时数据
@Tags User
@Accept  json
@Produce  json
@Param user body pb.StockGetIntradayChartReq true "获取股票分时数据请求"
@Success 200 {object} comm.HttpResult{data=pb.StockGetIntradayChartResp} "成功返回股票分时数据"
@Router /api/home/stocks.getintradaychart [post]
*/
func (this *apiComp) GetIntradayChart(session comm.IUserSession, req *pb.StockGetIntradayChartReq) (errdata *pb.ErrorData) {
	var (
		err   error
		items []*pb.DBStockRealTimeItem
	)
	if items, err = this.module.model.getStockIntradayChart(req.Code); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("stocks.getintradaychart", &pb.StockGetIntradayChartResp{
		Items: items,
	})
	return
}
