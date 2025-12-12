package user

import (
	"context"
	"fmt"
	"lego_trader/comm"
	"lego_trader/lego/sys/mysql"
	"lego_trader/lego/utils/id"
	"lego_trader/pb"
	"lego_trader/sys/auth/apple_auth"
	"lego_trader/sys/auth/facebook_auth"
	"lego_trader/sys/auth/google_auth"
	"lego_trader/sys/auth/wechat_auth"
	"time"

	"firebase.google.com/go/v4/auth"
	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/exp/rand"
)

// @Summary 登入接口
// @Description 根据登录类型实现登录操作
// @Tags User
// @Accept  json
// @Produce  json
// @Param user body pb.UserSginReq true "登录请求"
// @Success 200 {object} comm.HttpResult{data=pb.UserSginResp} "成功返回用户信息"
// @Router /api/home/user_sgin [post]
func (this *apiComp) Sgin(session comm.IUserSession, req *pb.UserSginReq) (errdata *pb.ErrorData) {
	var (
		code         string
		apple_uuid   string
		wxinfo       *wechat_auth.WeChatUserInfoResponse
		googleinfo   *auth.Token
		facebookinfo *facebook_auth.FacebookTokenInfo
		user         *pb.DBUser
		tokenString  string
		err          error
	)
	switch req.Stype {
	case pb.SginTyoe_Mail: //邮箱
		if code, err = this.module.model.getCode(req.Mail); err != nil {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
		if code != req.Vcode {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_ReqParameterError,
				Message: "code is error",
			}
			return
		}
		if user, err = this.module.model.findformail(req.Mail); err != nil && err != mysql.ErrNoDocuments {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
	case pb.SginTyoe_Phone: //手机
		if code, err = this.module.model.getCode(req.Phone); err != nil {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
		if code != req.Vcode {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_ReqParameterError,
				Message: "code is error",
			}
			return
		}
		if user, err = this.module.model.findforphone(req.Phone); err != nil && err != mysql.ErrNoDocuments {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
	case pb.SginTyoe_WXChat: //微信
		if wxinfo, err = wechat_auth.Auth(context.Background(), req.Ttoken); err != nil {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_ExceptionAccountVerification,
				Message: err.Error(),
			}
			return
		}
		if user, err = this.module.model.findforwx(wxinfo.OpenID); err != nil && err != mysql.ErrNoDocuments {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
	case pb.SginTyoe_Google: //微信
		if googleinfo, err = google_auth.Auth(context.Background(), req.Ttoken); err != nil {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_ExceptionAccountVerification,
				Message: err.Error(),
			}
			return
		}
		if user, err = this.module.model.findforgoogle(googleinfo.UID); err != nil && err != mysql.ErrNoDocuments {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
	case pb.SginTyoe_FaceBook: //微信
		if facebookinfo, err = facebook_auth.Auth(context.Background(), req.Ttoken); err != nil {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_ExceptionAccountVerification,
				Message: err.Error(),
			}
			return
		}
		if user, err = this.module.model.findforfacebook(facebookinfo.UserID); err != nil && err != mysql.ErrNoDocuments {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
	case pb.SginTyoe_Apple: //微信
		if apple_uuid, err = apple_auth.Auth(context.Background(), req.Ttoken); err != nil {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_ExceptionAccountVerification,
				Message: err.Error(),
			}
			return
		}
		if user, err = this.module.model.findforapple(apple_uuid); err != nil && err != mysql.ErrNoDocuments {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
	case pb.SginTyoe_Account: //游客登录
		if req.Account == "" {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_ReqParameterError,
				Message: pb.ErrorCode_ReqParameterError.String(),
			}
			return
		}
		if user, err = this.module.model.findforaccount(req.Account); err != nil && err != mysql.ErrNoDocuments {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}

	default:
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_ReqParameterError,
			Message: "stype is no support",
		}
		return
	}

	if err == mysql.ErrNoDocuments {
		user = &pb.DBUser{
			Uid:        id.NewSnowflakeId(int64(this.options.UserGroup)),
			Phone:      req.Phone,
			Mail:       req.Mail,
			Createtime: time.Now().Unix(),
			Language:   req.Language,
			Avatar:     req.Avatar,
			Name:       req.Name,
		}
		switch req.Stype {
		case pb.SginTyoe_WXChat:
			user.Wxopenid = wxinfo.OpenID
			user.Name = wxinfo.Nickname
			user.Avatar = wxinfo.HeadImgURL
		case pb.SginTyoe_Google:
			user.Googleopenid = googleinfo.UID
		case pb.SginTyoe_FaceBook:
			user.Facebookopenid = facebookinfo.UserID
		case pb.SginTyoe_Apple:
			user.Appleopenid = apple_uuid
		case pb.SginTyoe_Account:
			user.Account = req.Account
			user.Password = req.Password
		}
		if user.Name == "" {
			user.Name = fmt.Sprintf("guest_%d", rand.Intn(10000))
		}

		if err = this.module.model.saveUser(user); err != nil {
			errdata = &pb.ErrorData{
				Code:    pb.ErrorCode_DBError,
				Message: err.Error(),
			}
			return
		}
	}
	user.Lastsgintime = time.Now().Unix()
	claims := &jwt.RegisteredClaims{
		Issuer:  "lego_trader",
		Subject: "Sgin",
		// ExpiresAt: jwt.NewNumericDate(time.Now().Add(time.Hour * 24)), // 24 hours expiration
		NotBefore: jwt.NewNumericDate(time.Now()),
		IssuedAt:  jwt.NewNumericDate(time.Now()),
		ID:        user.Uid,
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	if tokenString, err = token.SignedString([]byte(this.options.TokenKey)); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_ReqParameterError,
			Message: pb.ErrorCode_ReqParameterError.String(),
		}
		this.module.Errorln(err)
		return
	}
	if err = this.module.model.saveUser(user); err != nil {
		errdata = &pb.ErrorData{
			Code:    pb.ErrorCode_DBError,
			Message: err.Error(),
		}
		return
	}
	session.SendMsg("", &pb.UserSginResp{
		Token: tokenString,
		User:  user,
	})
	return
}
