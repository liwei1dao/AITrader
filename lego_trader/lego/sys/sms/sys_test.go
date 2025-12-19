package sms_test

import (
"fmt"
"lego_trader/lego/sys/sms"
"testing"
)

// 国内
/*
SecretId:xxxxxxxx
SecretKey:xxxxxxxx
*/
func Test_sys_china(t *testing.T) {
	if sys, err := sms.NewSys(
sms.SetAppId("1401045886"),
sms.SetSecretId("xxxxxxxxx"),
sms.KeySecretKey("xxxxxxx"),
sms.SetSignName("xxxxx"),
sms.SetTemplate1("xxxxx"),
); err == nil {
		err = sys.SendCaptcha("+8615336758045", "2341")
		fmt.Println(err)
	}
}

// 海外
func Test_sys_overseas(t *testing.T) {
	if sys, err := sms.NewSys(
sms.SetAppId("1400971698"),
sms.SetSecretId("xxxxx"),
sms.KeySecretKey("xxxxx"),
sms.SetSignName("xxxx"),
sms.SetTemplate2("xxxxxx"),
); err == nil {
		err = sys.SendCaptcha("+85270278175", "2341")
		fmt.Println(err)
	}
}
