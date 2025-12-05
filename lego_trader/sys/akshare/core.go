package akshare

type (
	ISys interface {
		/// 获取股票基本信息
		GetStockBasicInfo(stockCode string) (info *StockBasicInfo, err error)
	}

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
)

var (
	defsys ISys
)

func OnInit(config map[string]interface{}, opt ...Option) (err error) {
	var option *Options
	if option, err = newOptions(config, opt...); err != nil {
		return
	}
	defsys, err = newSys(option)
	return
}
func NewSys(opt ...Option) (sys ISys, err error) {
	var option *Options
	if option, err = newOptionsByOption(opt...); err != nil {
		return
	}
	sys, err = newSys(option)
	return
}

func GetStockBasicInfo(stockCode string) (info *StockBasicInfo, err error) {
	return defsys.GetStockBasicInfo(stockCode)
}
