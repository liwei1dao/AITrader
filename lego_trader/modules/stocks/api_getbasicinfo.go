package stocks

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 获取股票基本面信息
@Description 获取用户关注的股票实时数据
@Tags User
@Accept  json
@Produce  json
@Param user body pb.StockGetBasicInfoReq true "获取股票基本面信息请求"
@Success 200 {object} comm.HttpResult{data=pb.StockGetBasicInfoResp} "成功返回股票基本面信息"
@Router /api/home/stocks.getbasicinfo [post]
*/
func (this *apiComp) GetBasicInfo(session comm.IUserSession, req *pb.StockGetBasicInfoReq) (errdata *pb.ErrorData) {
	var (
		err  error
		info *pb.DBStockBasicInfo
	)
	if info, err = this.module.model.getStockBasicInfo(req.Code); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("stocks.getbasicinfo", &pb.StockGetBasicInfoResp{
		Info: info,
	})
	return
}
