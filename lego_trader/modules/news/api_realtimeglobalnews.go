package news

import (
	"lego_trader/comm"
	"lego_trader/pb"
)

/*
@Summary 获取市场要闻接口
@Description 获取用户关注的股票指数
@Tags User
@Accept  json
@Produce  json
@Param user body pb.NewsGetRealTimeGlobalNewsReq true "获取市场要闻请求"
@Success 200 {object} comm.HttpResult{data=pb.NewsGetRealTimeGlobalNewsResp} "成功返回市场要闻信息"
@Router /api/home/news.getrealtimeglobalnews [post]
*/
func (this *apiComp) GetRealTimeGlobalNews(session comm.IUserSession, req *pb.NewsGetRealTimeGlobalNewsReq) (errdata *pb.ErrorData) {
	var (
		err   error
		items []*pb.DBRealTimeGlobalNews
	)
	if items, err = this.module.model.getMarketNews(this.options.Source); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("news.get_realtimeglobalnews", &pb.NewsGetRealTimeGlobalNewsResp{
		News: items,
	})
	return
}
