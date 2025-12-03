package id

import (
	"crypto/sha256"
	"encoding/hex"

	"github.com/rs/xid"
	uuid "github.com/satori/go.uuid"
)

// xid
func NewXId() string {
	id := xid.New()
	return id.String()
}

// uuid
func NewUUId() string {
	u1 := uuid.NewV4()
	return u1.String()
}

// 根据字符串生成唯一id
func GenerateSHA256ID(input string) string {
	hash := sha256.New()
	hash.Write([]byte(input))
	return hex.EncodeToString(hash.Sum(nil))
}
