package google_auth

import (
	"context"
	"fmt"
	"log"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"github.com/coze-dev/coze-go"
	"google.golang.org/api/option"
)

func newSys(options Options) (sys *Google, err error) {
	sys = &Google{
		options: options,
	}

	return
}

type Google struct {
	options Options
	api     coze.CozeAPI
}

func (this *Google) Auth(ctx context.Context, idToken string) (info *auth.Token, err error) {
	// 指定服务账号密钥路径
	opt := option.WithCredentialsFile(this.options.ApiKeyFile)
	// 初始化 Firebase App
	app, err := firebase.NewApp(ctx, nil, opt)
	if err != nil {
		return nil, fmt.Errorf("failed to initialize Firebase app: %v", err)
	}

	// 获取 Auth 客户端
	client, err := app.Auth(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to get Auth client: %v", err)
	}

	// 验证 Token
	token, err := client.VerifyIDToken(ctx, idToken)
	if err != nil {
		return nil, fmt.Errorf("invalid ID Token: %v", err)
	}

	// 检查邮箱是否已验证
	if !token.Claims["email_verified"].(bool) {
		return nil, fmt.Errorf("email not verified")
	}

	log.Printf("Verified UID: %s, Email: %s", token.UID, token.Claims["email"])
	return token, nil
}
