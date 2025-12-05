package akshare

import (
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"strconv"
	"time"

	"golang.org/x/text/encoding/simplifiedchinese"
)

func newSys(options *Options) (sys *AkShare, err error) {
	sys = &AkShare{
		options: options,
	}
	return
}

type AkShare struct {
	options *Options
}

func (a *AkShare) GetStockBasicInfo(stockCode string) (info *StockBasicInfo, err error) {
	ns := stockCode
	if len(stockCode) > 0 {
		if stockCode[0] == '6' {
			ns = "sh" + stockCode
		} else if !(len(stockCode) >= 2 && (stockCode[:2] == "sz" || stockCode[:2] == "sh")) {
			ns = "sz" + stockCode
		}
	}
	url := fmt.Sprintf("%s/api/public/stock_individual_basic_info_xq?symbol=%s", a.options.BaseUrl, ns)
	resp, err := http.Get(url)
	if err != nil {
		return nil, err
	}
	defer resp.Body.Close()
	var arr []map[string]interface{}
	if resp.StatusCode == http.StatusOK {
		body, err := io.ReadAll(resp.Body)
		if err != nil {
			return nil, err
		}
		fmt.Println(string(body))
		if err := json.Unmarshal(body, &arr); err != nil {
			arr = nil
		}
	} else {
		return nil, fmt.Errorf("StatusCode: %d", resp.StatusCode)
	}
	kv := map[string]string{}
	if arr != nil {
		for _, it := range arr {
			k := fmt.Sprint(it["item"])
			v := fmt.Sprint(it["value"])
			if k != "" {
				kv[k] = v
			}
		}
	}
	toInt := func(s string) int {
		if s == "" {
			return 0
		}
		f, _ := strconv.ParseFloat(s, 64)
		return int(f)
	}
	toFloat := func(s string) float64 {
		if s == "" {
			return 0
		}
		f, _ := strconv.ParseFloat(s, 64)
		return f
	}
	toMs := func(s string) int64 {
		if s == "" {
			return 0
		}
		var t time.Time
		var e error
		if len(s) == 8 {
			t, e = time.Parse("20060102", s)
		} else {
			t, e = time.Parse("2006-01-02", s)
		}
		if e != nil {
			return 0
		}
		return t.UnixMilli()
	}
	name := kv["股票简称"]
	full := kv["公司全称"]
	if full == "" {
		full = name
	}
	currency := kv["币种"]
	if currency == "" {
		currency = "CNY"
	}
	province := kv["省份"]
	if province == "" {
		province = kv["地区"]
	}
	info = &StockBasicInfo{
		OrgID:                    kv["机构ID"],
		OrgNameCn:                full,
		OrgShortNameCn:           name,
		OrgNameEn:                kv["机构英文名称"],
		OrgShortNameEn:           kv["机构英文简称"],
		MainOperationBusiness:    kv["主营业务"],
		OperatingScope:           kv["经营范围"],
		DistrictEncode:           kv["地区编码"],
		OrgCnIntroduction:        kv["机构中文简介"],
		LegalRepresentative:      kv["法定代表人"],
		GeneralManager:           kv["总经理"],
		Secretary:                kv["董事会秘书"],
		EstablishedDate:          toMs(kv["成立日期"]),
		RegAsset:                 toFloat(kv["注册资本"]),
		StaffNum:                 toInt(kv["员工人数"]),
		Telephone:                kv["公司电话"],
		Postcode:                 kv["邮政编码"],
		Fax:                      kv["公司传真"],
		Email:                    kv["公司电子邮箱"],
		OrgWebsite:               kv["公司网址"],
		RegAddressCn:             kv["注册地址"],
		RegAddressEn:             nil,
		OfficeAddressCn:          kv["办公地址"],
		OfficeAddressEn:          nil,
		CurrencyEncode:           kv["货币编码"],
		Currency:                 currency,
		ListedDate:               toMs(kv["上市时间"]),
		ProvincialName:           province,
		ActualController:         kv["实际控制人"],
		ClassiName:               kv["企业性质"],
		PreNameCn:                kv["曾用名"],
		Chairman:                 kv["董事长"],
		ExecutivesNums:           toInt(kv["高管人数"]),
		ActualIssueVol:           toFloat(kv["实际发行量"]),
		IssuePrice:               toFloat(kv["发行价格"]),
		ActualRcNetAmt:           toFloat(kv["实际募集资金净额"]),
		PeAfterIssuing:           toFloat(kv["发行后市盈率"]),
		OnlineSuccessRateOfIssue: toFloat(kv["网上发行中签率"]),
		AffiliateIndustry:        kv["所属行业"],
	}
	if name == "" {
		p := "sz"
		if len(stockCode) > 0 && stockCode[0] == '6' {
			p = "sh"
		}
		if p == "sh" {
			u := fmt.Sprintf("%s/api/public/stock_info_sh_name_code", a.options.BaseUrl)
			r, e := http.Get(u)
			if e == nil && r.StatusCode == http.StatusOK {
				b, _ := io.ReadAll(r.Body)
				var recs []map[string]interface{}
				_ = json.Unmarshal(b, &recs)
				for _, x := range recs {
					c := fmt.Sprint(x["证券代码"])
					if c == stockCode {
						name = fmt.Sprint(x["证券简称"])
						break
					}
				}
				r.Body.Close()
			}
		} else {
			u := fmt.Sprintf("%s/api/public/stock_info_sz_name_code", a.options.BaseUrl)
			r, e := http.Get(u)
			if e == nil && r.StatusCode == http.StatusOK {
				b, _ := io.ReadAll(r.Body)
				var recs []map[string]interface{}
				_ = json.Unmarshal(b, &recs)
				for _, x := range recs {
					c := fmt.Sprint(x["证券代码"])
					if c == stockCode {
						name = fmt.Sprint(x["证券简称"])
						break
					}
				}
				r.Body.Close()
			}
		}
		info.OrgShortNameCn = name
		if info.OrgNameCn == "" {
			info.OrgNameCn = name
		}
	}
	if info.ListedDate == 0 {
		u := fmt.Sprintf("%s/api/public/stock_zh_a_hist?symbol=%s&period=daily&start_date=&end_date=&adjust=", a.options.BaseUrl, ns)
		r, e := http.Get(u)
		if e == nil && r.StatusCode == http.StatusOK {
			b, _ := io.ReadAll(r.Body)
			var recs []map[string]interface{}
			if json.Unmarshal(b, &recs) == nil && len(recs) > 0 {
				d := fmt.Sprint(recs[0]["日期"])
				info.ListedDate = toMs(d)
			}
			r.Body.Close()
		}
	}
	if info.OrgShortNameCn == "" || info.OrgNameCn == "" || info.ListedDate == 0 || info.AffiliateIndustry == "" {
		u := fmt.Sprintf("%s/api/public/stock_zh_a_base_em", a.options.BaseUrl)
		r, e := http.Get(u)
		if e == nil && r.StatusCode == http.StatusOK {
			b, _ := io.ReadAll(r.Body)
			var recs []map[string]interface{}
			if json.Unmarshal(b, &recs) == nil {
				for _, x := range recs {
					c1 := fmt.Sprint(x["代码"])
					c2 := fmt.Sprint(x["股票代码"])
					if c1 == stockCode || c2 == ns || c2 == ("sz"+stockCode) || c2 == ("sh"+stockCode) {
						if info.OrgShortNameCn == "" {
							v := fmt.Sprint(x["名称"])
							if v != "" {
								info.OrgShortNameCn = v
							}
						}
						if info.OrgNameCn == "" {
							v := fmt.Sprint(x["名称"])
							if v != "" {
								info.OrgNameCn = v
							}
						}
						if info.AffiliateIndustry == "" {
							v := fmt.Sprint(x["所属行业"])
							if v == "" {
								v = fmt.Sprint(x["行业"])
							}
							if v == "" {
								v = fmt.Sprint(x["板块"])
							}
							if v != "" {
								info.AffiliateIndustry = v
							}
						}
						if info.ListedDate == 0 {
							v := fmt.Sprint(x["上市日期"])
							if v != "" {
								info.ListedDate = toMs(v)
							}
						}
						if info.OrgWebsite == "" {
							v := fmt.Sprint(x["公司网址"])
							if v == "" {
								v = fmt.Sprint(x["网站"])
							}
							if v != "" {
								info.OrgWebsite = v
							}
						}
						if info.MainOperationBusiness == "" {
							v := fmt.Sprint(x["主营业务"])
							if v != "" {
								info.MainOperationBusiness = v
							}
						}
						if info.ProvincialName == "" {
							v := fmt.Sprint(x["地域"])
							if v == "" {
								v = fmt.Sprint(x["地区"])
							}
							if v != "" {
								info.ProvincialName = v
							}
						}
						if info.IssuePrice == 0 {
							v := fmt.Sprint(x["发行价格"])
							if v != "" {
								info.IssuePrice = toFloat(v)
							}
						}
						break
					}
				}
			}
			r.Body.Close()
		}
	}
	if info.OrgShortNameCn == "" {
		p := ns
		if !(len(p) >= 2 && (p[:2] == "sz" || p[:2] == "sh")) {
			if len(stockCode) > 0 && stockCode[0] == '6' {
				p = "sh" + stockCode
			} else {
				p = "sz" + stockCode
			}
		}
		u := fmt.Sprintf("http://qt.gtimg.cn/q=s_%s", p)
		r, e := http.Get(u)
		if e == nil && r.StatusCode == http.StatusOK {
			b, _ := io.ReadAll(r.Body)
			db, _ := simplifiedchinese.GBK.NewDecoder().Bytes(b)
			s := string(db)
			i := 0
			for idx := 0; idx < len(s); idx++ {
				if s[idx] == '=' {
					i = idx + 1
					break
				}
			}
			if i > 0 && i < len(s) {
				payload := s[i:]
				for j := 0; j < len(payload); j++ {
					if payload[j] == '"' {
						payload = payload[j+1:]
						break
					}
				}
				for j := len(payload) - 1; j >= 0; j-- {
					if payload[j] == '"' {
						payload = payload[:j]
						break
					}
				}
				parts := make([]string, 0)
				cur := ""
				for _, ch := range payload {
					if ch == '~' {
						parts = append(parts, cur)
						cur = ""
					} else {
						cur += string(ch)
					}
				}
				parts = append(parts, cur)
				if len(parts) >= 2 {
					v := parts[1]
					name := v
					if name != "" {
						info.OrgShortNameCn = name
						if info.OrgNameCn == "" {
							info.OrgNameCn = name
						}
					}
				}
			}
			r.Body.Close()
		}
	}
	return info, nil
}
