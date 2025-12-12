package firebase_auth

import (
	"context"
	"fmt"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"github.com/coze-dev/coze-go"
	"google.golang.org/api/option"
)

func newSys(options Options) (sys *Google, err error) {
	sys = &Google{
		options: options,
	}
	// 指定服务账号密钥路径
	opt := option.WithCredentialsFile(options.ApiKeyFile)
	// 初始化 Firebase App
	app, err := firebase.NewApp(context.Background(), nil, opt)
	if err != nil {
		options.Log.Errorln(err)
		return
	}

	// 获取 Auth 客户端
	sys.client, err = app.Auth(context.Background())
	if err != nil {
		options.Log.Errorln(err)
		return
	}
	return
}

type Google struct {
	options Options
	api     coze.CozeAPI
	client  *auth.Client
}

func (this *Google) Auth(ctx context.Context, idToken string) (info *auth.Token, err error) {
	// 验证 Token
	token, err := this.client.VerifyIDToken(ctx, idToken)
	if err != nil {
		return nil, fmt.Errorf("invalid ID Token: %v", err)
	}

	// 检查邮箱是否已验证
	if !token.Claims["email_verified"].(bool) {
		return nil, fmt.Errorf("email not verified")
	}
	return token, nil
}
