package user

import (
	"context"
	"fmt"
	"lego_trader/lego/core"
	"lego_trader/lego/core/cbase"

	"lego_trader/comm"
	"lego_trader/pb"
	"lego_trader/sys/db"
)

// 代理模型
type modelComp struct {
	cbase.ModuleCompBase
	module *User
}

// 组件初始化接口
func (this *modelComp) Init(service core.IService, module core.IModule, comp core.IModuleComp, opt core.IModuleOptions) (err error) {
	this.ModuleCompBase.Init(service, module, comp, opt)
	this.module = module.(*User)
	// 创建用户表
	if err = db.Mysql().CreateTable(comm.TableUser, &pb.DBUser{}); err != nil {
		this.module.Errorln(err)
	}
	// 创建用户股票持仓表
	if err = db.Mysql().CreateTable(comm.TableUserStock, &pb.DBUserStock{}); err != nil {
		this.module.Errorln(err)
	}
	return
}

/*
*
根据用户ID查询用户
*/
func (this *modelComp) findforid(uid string) (user *pb.DBUser, err error) {
	user = &pb.DBUser{}
	err = db.Mysql().FindOne(comm.TableUser, user, "uid=?", uid)
	return
}

/*
*
根据账号查询用户
*/
func (this *modelComp) findforaccount(aaccount string) (user *pb.DBUser, err error) {
	user = &pb.DBUser{}
	err = db.Mysql().FindOne(comm.TableUser, user, "account=?", aaccount)
	return
}

/*
*
根据手机号查询用户
*/
func (this *modelComp) findforphone(phone string) (user *pb.DBUser, err error) {
	user = &pb.DBUser{}
	err = db.Mysql().FindOne(comm.TableUser, user, "phone=?", phone)
	return
}

/*
*
根据邮箱查询用户
*/
func (this *modelComp) findformail(mail string) (user *pb.DBUser, err error) {
	user = &pb.DBUser{}
	err = db.Mysql().FindOne(comm.TableUser, user, "mail=?", mail)
	return
}

/*
根据微信OpenID查询用户
*/
func (this *modelComp) findforwx(openid string) (user *pb.DBUser, err error) {
	user = &pb.DBUser{}
	err = db.Mysql().FindOne(comm.TableUser, user, "wxopenid=?", openid)
	return
}

/*
根据GoogleOpenID查询用户
*/
func (this *modelComp) findforgoogle(openid string) (user *pb.DBUser, err error) {
	user = &pb.DBUser{}
	err = db.Mysql().FindOne(comm.TableUser, user, "googleopenid=?", openid)
	return
}

/*
根据AppleOpenID查询用户
*/
func (this *modelComp) findforapple(openid string) (user *pb.DBUser, err error) {
	user = &pb.DBUser{}
	err = db.Mysql().FindOne(comm.TableUser, user, "appleopenid=?", openid)
	return
}

/*
根据FacebookOpenID查询用户
*/
func (this *modelComp) findforfacebook(openid string) (user *pb.DBUser, err error) {
	user = &pb.DBUser{}
	err = db.Mysql().FindOne(comm.TableUser, user, "facebookopenid=?", openid)
	return
}

/*
保存用户
*/
func (this *modelComp) saveUser(user *pb.DBUser) (err error) {
	err = db.Mysql().Save(comm.TableUser, user)
	return
}

/*
获取验证码
*/
func (this *modelComp) getCode(addr string) (code string, err error) {
	code, err = db.Redis().Get(context.Background(), fmt.Sprintf("%s:%s", Redis_Verification, addr)).Result()
	return
}

// getUserStock 根据用户ID查询用户股票持仓
// 参数: uid 用户ID
// 返回值: stocks 用户股票持仓列表；err 错误信息；成功时 err 为 nil
// 异常: 数据库查询失败时返回错误；当传入不可寻址的集合会导致反射赋值错误
func (this *modelComp) getUserStock(uid string) (stocks []*pb.DBUserStock, err error) {
	stocks = []*pb.DBUserStock{}
	err = db.Mysql().Find(comm.TableUserStock, &stocks, "uid=?", uid)
	return
}

/*
添加用户股票持仓
*/
func (this *modelComp) addUserStock(stock *pb.DBUserStock) (err error) {
	err = db.Mysql().Insert(comm.TableUserStock, stock)
	return
}
