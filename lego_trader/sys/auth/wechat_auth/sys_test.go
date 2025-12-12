package wechat_auth_test

import (
	"context"
	"fmt"
	wechat_auth "lego_trader/sys/auth/wechat_auth"
	"testing"
)

// 90_Q3qPEF2lFFhWhcvuKRtaCU_y1yTzlG9cXjvlSgLiJi7lg6q0XMEjL10vj7luXXDZ5e4iL_2vAWdZmeeMmLt0gGzL03HrUpnT1eAzT9jZ4e8
func Test_Sys_Chat(t *testing.T) {
	if sys, err := wechat_auth.NewSys(
		wechat_auth.SetAppID("wx5bbb7be9324f3e2d"),
		wechat_auth.SetAppSecret("4cfde33bc22b6cc6b1f8b225dd97d255"),
	); err != nil {
		fmt.Printf("Sys Init err:%v", err)
	} else {
		info, err := sys.Auth(context.Background(), "90_sBAx4VDOUuKeAhrkdJu81NErfZi1qzHElYLBhN2iGxlEP4QY3nfI8ZwW4yU2dNbUFJjwys9zpmnR3VEv8RJrig3LlCnI6J6YBcZvQZrerNU")
		fmt.Printf("Sys info:%+v err:%v", info, err)
	}
}
