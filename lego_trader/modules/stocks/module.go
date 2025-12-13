package stocks

import "lego_trader/lego/core/cbase"

func NewModule() *Stock {
	return &Stock{}
}

type Stock struct {
	cbase.ModuleBase
}
