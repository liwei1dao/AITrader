package stocks

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 获取股票基本面快照
@Description 获取用户关注的股票实时数据
@Tags User
@Accept  json
@Produce  json
@Param user body pb.StockGetOperatingSnapshotReq true "获取股票基本面快照请求"
@Success 200 {object} comm.HttpResult{data=pb.StockGetOperatingSnapshotResp} "成功返回股票基本面快照"
@Router /api/home/stocks.getoperatingsnapshot [post]
*/
func (this *apiComp) GetOperatingSnapshot(session comm.IUserSession, req *pb.StockGetOperatingSnapshotReq) (errdata *pb.ErrorData) {
	var (
		err      error
		snapshot []*pb.DBStockOperatingSnapshot
	)
	if snapshot, err = this.module.model.getStockOperatingSnapshot(req.Code); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("stocks.getoperatingsnapshot", &pb.StockGetOperatingSnapshotResp{
		Snapshots: snapshot,
	})
	return
}
