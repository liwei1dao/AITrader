package akshare

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
)

type (
	// 股票基本信息
	StockBasicInfo struct {
		OrgID                    string  `json:"org_id" comment:"机构ID"`                          // T000071215
		OrgNameCn                string  `json:"org_name_cn" comment:"机构中文名称"`                   // 赛力斯集团股份有限公司
		OrgShortNameCn           string  `json:"org_short_name_cn" comment:"机构中文简称"`             // 赛力斯
		OrgNameEn                string  `json:"org_name_en" comment:"机构英文名称"`                   // Seres Group Co.,Ltd.
		OrgShortNameEn           string  `json:"org_short_name_en" comment:"机构英文简称"`             // SERES
		MainOperationBusiness    string  `json:"main_operation_business" comment:"主营业务"`         // 新能源汽车及核心三电(电池、电驱、电控)、传统汽车及核心部件总成的研发、制造、销售及服务。
		OperatingScope           string  `json:"operating_scope" comment:"经营范围"`                 // 一般项目：制造、销售：汽车零部件、机动车辆零部件、普通机械、电器机械、电器、电子产品（不...
		DistrictEncode           string  `json:"district_encode" comment:"地区编码"`                 // 500106
		OrgCnIntroduction        string  `json:"org_cn_introduction" comment:"机构中文简介"`           // 赛力斯始创于1986年，是以新能源汽车为核心业务的技术科技型汽车企业。现有员工1.6万人，A...
		LegalRepresentative      string  `json:"legal_representative" comment:"法定代表人"`           // 张正萍
		GeneralManager           string  `json:"general_manager" comment:"总经理"`                  // 张正萍
		Secretary                string  `json:"secretary" comment:"董事会秘书"`                      // 申薇
		EstablishedDate          int64   `json:"established_date" comment:"成立日期（毫秒时间戳）"`         // 1178812800000
		RegAsset                 float64 `json:"reg_asset" comment:"注册资本"`                       // 1509782193.0
		StaffNum                 int     `json:"staff_num" comment:"员工人数"`                       // 16102
		Telephone                string  `json:"telephone" comment:"联系电话"`                       // 86-23-65179666
		Postcode                 string  `json:"postcode" comment:"邮政编码"`                        // 401335
		Fax                      string  `json:"fax" comment:"传真"`                               // 86-23-65179777
		Email                    string  `json:"email" comment:"电子邮箱"`                           // 601127@seres.cn
		OrgWebsite               string  `json:"org_website" comment:"机构官网"`                     // www.seres.com.cn
		RegAddressCn             string  `json:"reg_address_cn" comment:"注册地址（中文）"`              // 重庆市沙坪坝区五云湖路7号
		RegAddressEn             *string `json:"reg_address_en" comment:"注册地址（英文）"`              // None
		OfficeAddressCn          string  `json:"office_address_cn" comment:"办公地址（中文）"`           // 重庆市沙坪坝区五云湖路7号
		OfficeAddressEn          *string `json:"office_address_en" comment:"办公地址（英文）"`           // None
		CurrencyEncode           string  `json:"currency_encode" comment:"货币编码"`                 // 019001
		Currency                 string  `json:"currency" comment:"货币"`                          // CNY
		ListedDate               int64   `json:"listed_date" comment:"上市日期（毫秒时间戳）"`              // 1465920000000
		ProvincialName           string  `json:"provincial_name" comment:"省份名称"`                 // 重庆市
		ActualController         string  `json:"actual_controller" comment:"实际控制人"`              // 张兴海 (13.79%)
		ClassiName               string  `json:"classi_name" comment:"企业性质"`                     // 民营企业
		PreNameCn                string  `json:"pre_name_cn" comment:"曾用中文名称"`                   // 重庆小康工业集团股份有限公司
		Chairman                 string  `json:"chairman" comment:"董事长"`                         // 张正萍
		ExecutivesNums           int     `json:"executives_nums" comment:"高管人数"`                 // 20
		ActualIssueVol           float64 `json:"actual_issue_vol" comment:"实际发行量"`               // 142500000.0
		IssuePrice               float64 `json:"issue_price" comment:"发行价格"`                     // 5.81
		ActualRcNetAmt           float64 `json:"actual_rc_net_amt" comment:"实际募集资金净额"`           // 738451000.0
		PeAfterIssuing           float64 `json:"pe_after_issuing" comment:"发行后市盈率"`              // 18.19
		OnlineSuccessRateOfIssue float64 `json:"online_success_rate_of_issue" comment:"网上发行中签率"` // 0.110176
		AffiliateIndustry        string  `json:"affiliate_industry" comment:"所属行业"`              // {"ind_code":"BK0025","ind_name":"汽车整车"}
	}

	// 实时盘口（东方财富 stock_bid_ask_em）
	// 说明：字段的 json 标签与返回的 item 名称一致，直接用于 MapItemValuesToStruct 映射
	StockBidAskEM struct {
		Sell5    float64 `json:"sell_5" comment:"卖五价"`
		Sell5Vol float64 `json:"sell_5_vol" comment:"卖五量"`
		Sell4    float64 `json:"sell_4" comment:"卖四价"`
		Sell4Vol float64 `json:"sell_4_vol" comment:"卖四量"`
		Sell3    float64 `json:"sell_3" comment:"卖三价"`
		Sell3Vol float64 `json:"sell_3_vol" comment:"卖三量"`
		Sell2    float64 `json:"sell_2" comment:"卖二价"`
		Sell2Vol float64 `json:"sell_2_vol" comment:"卖二量"`
		Sell1    float64 `json:"sell_1" comment:"卖一价"`
		Sell1Vol float64 `json:"sell_1_vol" comment:"卖一量"`

		Buy1    float64 `json:"buy_1" comment:"买一价"`
		Buy1Vol float64 `json:"buy_1_vol" comment:"买一量"`
		Buy2    float64 `json:"buy_2" comment:"买二价"`
		Buy2Vol float64 `json:"buy_2_vol" comment:"买二量"`
		Buy3    float64 `json:"buy_3" comment:"买三价"`
		Buy3Vol float64 `json:"buy_3_vol" comment:"买三量"`
		Buy4    float64 `json:"buy_4" comment:"买四价"`
		Buy4Vol float64 `json:"buy_4_vol" comment:"买四量"`
		Buy5    float64 `json:"buy_5" comment:"买五价"`
		Buy5Vol float64 `json:"buy_5_vol" comment:"买五量"`

		Latest      float64 `json:"最新" comment:"最新价"`
		Average     float64 `json:"均价" comment:"均价"`
		RisePercent float64 `json:"涨幅" comment:"涨幅(%)"`
		RiseAmount  float64 `json:"涨跌" comment:"涨跌"`
		TotalHands  float64 `json:"总手" comment:"总手"`
		Amount      float64 `json:"金额" comment:"成交金额"`
		Turnover    float64 `json:"换手" comment:"换手率(%)"`
		VolumeRatio float64 `json:"量比" comment:"量比"`
		High        float64 `json:"最高" comment:"最高价"`
		Low         float64 `json:"最低" comment:"最低价"`
		Open        float64 `json:"今开" comment:"今日开盘价"`
		PrevClose   float64 `json:"昨收" comment:"昨日收盘价"`
		LimitUp     float64 `json:"涨停" comment:"涨停价"`
		LimitDown   float64 `json:"跌停" comment:"跌停价"`
		OutVol      float64 `json:"外盘" comment:"外盘(主动买)"`
		InVol       float64 `json:"内盘" comment:"内盘(主动卖)"`
	}

	// A股历史行情（东方财富 stock_zh_a_hist）记录
	// 说明：字段标签与上游返回一致（中文键），便于直接反序列化
	StockZhAHistRecord struct {
		Symbol       string  `json:"股票代码" comment:"股票代码"`
		Date         string  `json:"日期" comment:"交易日期"`
		Open         float64 `json:"开盘" comment:"开盘价"`
		Close        float64 `json:"收盘" comment:"收盘价"`
		High         float64 `json:"最高" comment:"最高价"`
		Low          float64 `json:"最低" comment:"最低价"`
		Volume       float64 `json:"成交量" comment:"成交量(手)"`
		Turnover     float64 `json:"成交额" comment:"成交额(元)"`
		Amplitude    float64 `json:"振幅" comment:"振幅(%)"`
		ChangePct    float64 `json:"涨跌幅" comment:"涨跌幅(%)"`
		ChangeAmt    float64 `json:"涨跌额" comment:"涨跌额"`
		TurnoverRate float64 `json:"换手率" comment:"换手率(%)"`
	}

	// 个股新闻（东方财富 stock_news_em）记录
	StockNewsEmRecord struct {
		Title       string  `json:"标题" comment:"新闻标题"`
		PublishTime string  `json:"发布时间" comment:"发布时间"`
		Source      string  `json:"来源" comment:"来源"`
		URL         string  `json:"新闻链接" comment:"链接"`
		NewsID      string  `json:"新闻ID" comment:"新闻ID"`
		Summary     *string `json:"摘要" comment:"摘要(可能不存在)"`
	}
)

// GetStockBasicInfo 获取股票基本信息（东方财富 stock_individual_basic_info_xq）
// - 参数: stockCode 支持 6位代码或带前缀 `sz`/`sh`
// - 返回: 股票基本信息结构体（包含股票代码、名称、上市日期、上市地点、所属行业、所属板块、上市状态等字段）
// - 说明: 调用 python_akshare `/api/public/stock_individual_basic_info_xq`
func (a *AkShare) GetStockBasicInfo(stockCode string) (info *StockBasicInfo, err error) {
	// 雪球接口要求symbol必须带sz/sh前缀，若未带则默认补sh
	if len(stockCode) == 6 && (stockCode[:2] != "sz" && stockCode[:2] != "sh") {
		stockCode = "sh" + stockCode
	}
	url := fmt.Sprintf("%s/api/public/stock_individual_basic_info_xq?symbol=%s", a.options.BaseUrl, stockCode)
	fmt.Println(url)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	var items []ItemValue
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	fmt.Println(string(body))
	if err := json.Unmarshal(body, &items); err != nil {
		items = nil
	}
	// 使用通用映射接口将 items 映射到 StockBasicInfo
	info = &StockBasicInfo{}
	if err := MapItemValuesToStruct(items, info); err != nil {
		return nil, err
	}
	return info, nil
}

// GetStockBidAsk 获取实时盘口（东方财富 stock_bid_ask_em）
// - 参数: stockCode 支持 6位代码或带前缀 `sz`/`sh`
// - 返回: 原始字段的列表（例如 买一价/买一量/卖一价/时间 等）
// - 说明: 调用 python_akshare `/api/public/stock_bid_ask_em`
func (a *AkShare) GetStockBidAsk(stockCode string) (records *StockBidAskEM, err error) {
	url := fmt.Sprintf("%s/api/public/stock_bid_ask_em?symbol=%s", a.options.BaseUrl, stockCode)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	records = &StockBidAskEM{}
	if err := json.Unmarshal(body, records); err != nil {
		return nil, err
	}
	return records, nil
}

// GetStockZhAHist 获取A股历史行情（东方财富 stock_zh_a_hist）
//   - 参数:
//     stockCode: 6位或带前缀 `sz`/`sh`
//     period: `daily`/`weekly`/`monthly`
//     start/end: 起止日期 `YYYYMMDD`
//     adjust: 复权 `""`/`qfq`/`hfq`
//   - 返回: 历史K线记录列表（日期/开盘/收盘/最高/最低/成交量/成交额/涨跌幅/换手率等字段）
//   - 说明: 调用 python_akshare `/api/public/stock_zh_a_hist`
func (a *AkShare) GetStockZhAHist(stockCode, period, start, end, adjust string) (records []StockZhAHistRecord, err error) {
	url := fmt.Sprintf("%s/api/public/stock_zh_a_hist?symbol=%s&period=%s&start=%s&end=%s&adjust=%s", a.options.BaseUrl, stockCode, period, start, end, adjust)
	fmt.Println(url)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	fmt.Println(string(body))
	// 直接反序列化为结构化记录切片
	if err := json.Unmarshal(body, &records); err != nil {

		return nil, err
	}
	return records, nil
}

// GetStockNewsEm 获取个股新闻（东方财富 stock_news_em）
// - 参数: stockCode 可为6位或带前缀；page/size 可选（nil 表示不传）
// - 返回: 新闻列表（标题/时间/来源/链接等字段）
// - 说明: 调用 python_akshare `/api/public/stock_news_em`
func (a *AkShare) GetStockNewsEm(stockCode string, page, size *int) (records []StockNewsEmRecord, err error) {
	// 组装可选参数
	q := ""
	if page != nil {
		q += fmt.Sprintf("&page=%d", *page)
	}
	if size != nil {
		q += fmt.Sprintf("&size=%d", *size)
	}
	url := fmt.Sprintf("%s/api/public/stock_news_em?symbol=%s%s", a.options.BaseUrl, stockCode, q)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	if err := json.Unmarshal(body, &records); err != nil {
		var obj map[string]interface{}
		if err2 := json.Unmarshal(body, &obj); err2 == nil {
			if msg, ok := obj["error"]; ok {
				return nil, fmt.Errorf("stock_news_em error: %v", msg)
			}
		}
		return nil, err
	}
	return records, nil
}

// GetStockBidAskEM 获取实时盘口并映射为结构体
// 返回 StockBidAskEM，内部按 item/value 结构进行映射
func (a *AkShare) GetStockBidAskEM(stockCode string) (data *StockBidAskEM, err error) {
	url := fmt.Sprintf("%s/api/public/stock_bid_ask_em?symbol=%s", a.options.BaseUrl, stockCode)
	fmt.Println(url)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return nil, err
	}
	fmt.Println(string(body))
	var items []ItemValue
	if err := json.Unmarshal(body, &items); err != nil {
		return nil, err
	}
	res := &StockBidAskEM{}
	if err := MapItemValuesToStruct(items, res); err != nil {
		return nil, err
	}
	return res, nil
}

// GetStockFinancialSummary 获取基本面摘要（雪球/东方财富）
// - 参数: stockCode 支持 6位代码或带前缀 `sz`/`sh`
// - 返回: item/value 列表，键可能包含英文或中文名（例如 revenue/净利润/eps/roe 等）
// - 说明: 调用 python_akshare `/api/public/stock_financial_summary_xq`
func (a *AkShare) GetStockFinancialSummary(stockCode string) (items []ItemValue, err error) {
    // 雪球接口要求symbol必须带sz/sh前缀，若未带则默认补sh
    if len(stockCode) == 6 && (stockCode[:2] != "sz" && stockCode[:2] != "sh") {
        stockCode = "sh" + stockCode
    }
    url := fmt.Sprintf("%s/api/public/stock_financial_summary_xq?symbol=%s", a.options.BaseUrl, stockCode)
    resp, err := http.Get(url)
    if err != nil {
        return nil, err
    }
    defer resp.Body.Close()
    if resp.StatusCode != http.StatusOK {
        return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
    }
    body, err := io.ReadAll(resp.Body)
    if err != nil {
        return nil, err
    }
    if err := json.Unmarshal(body, &items); err != nil {
        // 兼容错误对象
        var obj map[string]interface{}
        if err2 := json.Unmarshal(body, &obj); err2 == nil {
            if msg, ok := obj["error"]; ok {
                return nil, fmt.Errorf("stock_financial_summary_xq error: %v", msg)
            }
        }
        return nil, err
    }
    return items, nil
}
