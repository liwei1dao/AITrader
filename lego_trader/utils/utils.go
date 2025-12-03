package utils

import (
	"encoding/json"
	"lego_trader/lego/utils"
)

func ToString(v interface{}) string {
	var (
		err      error
		jsonData []byte
	)
	if v == nil {
		return ""
	}

	if jsonData, err = json.Marshal(v); err != nil {
		return ""
	}
	return utils.BytesToString(jsonData)
}
