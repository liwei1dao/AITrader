package collection

import (
	"encoding/json"
	"lego_trader/comm"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"
	"lego_trader/pb"
	"lego_trader/sys/akshare"
	"time"
)

/*
股票组件
提供股票数据
使用akshare库获取股票数据
*/
type stockAkshareComp struct {
	cbase.ModuleCompBase
	module *Collection
}

func (this *stockAkshareComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, options core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, options)
	this.module = module.(*Collection)
	return
}

/*----------------------------------------------------新闻-----------------------------------------------------------*/
/// 获取全球股市资讯（同花顺 stock_info_global_ths）
/// 作用: 大盘看板的全球股市资讯源，用于新闻/快讯模块
/// 参数: 无；返回: 全球股市资讯列表（结构化）
func (this *stockAkshareComp) getRealTimeNews() (err error) {
	var (
		records []akshare.StockInfoGlobalThsRecord
		items   []*pb.DBRealTimeGlobalNews
	)

	records, err = akshare.GetStockInfoGlobalThs()
	if err != nil {
		return
	}
	if len(records) == 0 {
		return
	}
	for _, r := range records {
		item := &pb.DBRealTimeGlobalNews{
			Title:       r.Title,
			Content:     r.Content,
			Url:         r.URL,
			PublishTime: r.PublishTime,
		}
		items = append(items, item)
	}
	if len(items) > 0 {
		if err = this.module.model.updateRealTimeNews("ths", items); err != nil {
			return
		}
	}
	return
}

/*----------------------------------------------------指数-----------------------------------------------------------*/
/*
获取市场实时指数（akshare）
参数: 无
返回值: err 错误信息；成功时返回 nil
异常: 上游 AkShare 访问失败或解码失败时返回错误
*/
func (this *stockAkshareComp) getMarketRealTimeIndexs() (err error) {
	var (
		records []akshare.StockZhASpotEMRecord
		items   []*pb.DBMarketIndexRealTimeItem
	)
	records, err = akshare.GetStockZhIndexSpot()
	if err != nil {
		return
	}
	items = make([]*pb.DBMarketIndexRealTimeItem, 0, len(records))
	for _, r := range records {
		item := &pb.DBMarketIndexRealTimeItem{
			Index:                r.Index,
			Code:                 r.Code,
			Name:                 r.Name,
			LastPrice:            r.LastPrice,
			ChangePct:            r.ChangePct,
			ChangeAmt:            r.ChangeAmt,
			Volume:               r.Volume,
			Amount:               r.Amount,
			Amplitude:            r.Amplitude,
			High:                 r.High,
			Low:                  r.Low,
			Open:                 r.Open,
			PrevClose:            r.PrevClose,
			VolumeRatio:          r.VolumeRatio,
			TurnoverRate:         r.TurnoverRate,
			PeDynamic:            r.PeDynamic,
			PbRatio:              r.PbRatio,
			TotalMarketCap:       r.TotalMarketCap,
			CirculatingMarketCap: r.CirculatingMarketCap,
			PriceSpeed:           r.PriceSpeed,
			FiveMinChange:        r.FiveMinChange,
			SixtyDayChangePct:    r.SixtyDayChangePct,
			YtdChangePct:         r.YtdChangePct,
		}
		items = append(items, item)
	}
	if len(items) > 0 {
		if err = this.module.model.updateRealTimeIndexs(items); err != nil {
			return
		}
	}
	return
}

/*-----------------------------------------------------股票----------------------------------------------------------*/

/*
获取股票基本信息
参数: symbol 股票符号（例如："sh.000001"）
返回值: info 股票基本信息；err 错误信息；成功时返回 nil
异常: 上游 AkShare 访问失败或解码失败时返回错误
*/
func (this *stockAkshareComp) getStockBasicInfo(symbol string) (info *pb.DBStockIdentity, err error) {
	var (
		basicInfo *akshare.StockBasicInfo
	)
	info = &pb.DBStockIdentity{}

	market, _, akSymbol := comm.NormalizeSymbol(symbol)

	basicInfo, err = akshare.GetStockBasicInfo(akSymbol)
	if err != nil {
		return
	}

	info.Id = akSymbol
	info.Market = market
	if market == "sz" {
		info.Exchange = "SZSE"
	} else if market == "sh" {
		info.Exchange = "SSE"
	}
	info.Name = basicInfo.OrgShortNameCn
	info.FullName = basicInfo.OrgNameCn
	info.Currency = basicInfo.Currency
	info.Area = basicInfo.ProvincialName
	if basicInfo.ListedDate > 0 {
		info.ListDate = time.UnixMilli(basicInfo.ListedDate).Format("20060102")
	}
	if len(basicInfo.AffiliateIndustry) > 0 {
		var ind struct {
			IndCode string `json:"ind_code"`
			IndName string `json:"ind_name"`
		}
		_ = json.Unmarshal([]byte(basicInfo.AffiliateIndustry), &ind)
		if ind.IndName != "" {
			info.Industry = ind.IndName
		}
		if ind.IndCode != "" {
			info.Sector = ind.IndCode
		}
	}
	return
}

/*
获取股票实时行情数据（akshare）
参数: 无
返回值: err 错误信息；成功时返回 nil
异常: 上游 AkShare 访问失败或解码失败时返回错误
*/
func (this *stockAkshareComp) getStockRealTimeSpot() (err error) {
	var (
		records []akshare.StockZhASpotEMRecord
		items   []*pb.DBStockRealTimeItem
	)
	records, err = akshare.GetStockZhASpotEM()
	if err != nil {
		return
	}

	items = make([]*pb.DBStockRealTimeItem, 0, len(records))
	for _, v := range records {
		items = append(items, &pb.DBStockRealTimeItem{
			Code:                 v.Code,
			Name:                 v.Name,
			LastPrice:            v.LastPrice,
			ChangePct:            v.ChangePct,
			ChangeAmt:            v.ChangeAmt,
			Open:                 v.Open,
			High:                 v.High,
			Low:                  v.Low,
			PrevClose:            v.PrevClose,
			Volume:               v.Volume,
			Amount:               v.Amount,
			Amplitude:            v.Amplitude,
			VolumeRatio:          v.VolumeRatio,
			TurnoverRate:         v.TurnoverRate,
			PeDynamic:            v.PeDynamic,
			PbRatio:              v.PbRatio,
			TotalMarketCap:       v.TotalMarketCap,
			CirculatingMarketCap: v.CirculatingMarketCap,
			PriceSpeed:           v.PriceSpeed,
			FiveMinChange:        v.FiveMinChange,
			SixtyDayChangePct:    v.SixtyDayChangePct,
			YtdChangePct:         v.YtdChangePct,
		})
	}
	if len(items) > 0 {
		err = this.module.model.updateRealTimeStock(items)
	}
	return
}
