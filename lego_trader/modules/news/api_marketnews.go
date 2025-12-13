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
@Param user body pb.NewsMarketNewsReq true "获取市场要闻请求"
@Success 200 {object} comm.HttpResult{data=pb.NewsMarketNewsResp} "成功返回市场要闻信息"
@Router /api/home/news_marketnews [post]
*/
func (this *apiComp) MarketNews(session comm.IUserSession, req *pb.NewsMarketNewsReq) (errdata *pb.ErrorData) {
	var (
		err   error
		items []*pb.DBMarketNews
	)
	if items, err = this.module.model.getMarketNews(); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("news.marketnews", &pb.NewsMarketNewsResp{
		News: items,
	})
	return
}
