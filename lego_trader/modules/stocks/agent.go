package stocks

import "lego_trader/lego/core/cbase"

// 代理模型组件
type agentComp struct {
	cbase.ModuleCompBase
	module *StockModule
}
