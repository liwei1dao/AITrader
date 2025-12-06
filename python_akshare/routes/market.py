from fastapi import APIRouter, Query
from fastapi.responses import JSONResponse
import akshare as ak

from .common import df_to_records


router = APIRouter()

@router.get(
    "/api/public/index_spot_zh",
    summary="A股主要指数实时行情",
    description=(
        "调用 AkShare `stock_zh_index_spot` 获取沪深主要指数的实时行情快照。\n"
        "返回: JSON 数组；常见字段包含指数代码、名称、最新价、涨跌幅、成交量/额等（具体字段随上游可能变化）。"
    ),
)
def index_spot_zh():
    try:
        df = ak.stock_zh_index_spot()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


def _normalize_index_symbol(symbol: str) -> str:
    s = (symbol or "").strip().lower()
    # 支持 sh000001 / sz399001 及 6位代码
    if len(s) >= 8 and s[:2] in ("sh", "sz"):
        return s
    if len(s) == 6:
        # 简化规则：000*** 归属上证；399*** 归属深证
        if s.startswith("000"):
            return "sh" + s
        return "sz" + s
    return s


@router.get(
    "/api/public/index_daily_zh",
    summary="A股指数历史日线",
    description=(
        "调用 AkShare `stock_zh_index_daily` 获取指定指数的历史日线数据。\n"
        "参数: `symbol` 支持 `sh000001`/`sz399001` 或 6 位代码（会自动归一化）。可选 `start`/`end` 为 `YYYY-MM-DD` 过滤。\n"
        "返回: JSON 数组；常见字段包含日期、开收盘、最高/最低、成交量/额等（字段随上游可能变化）。"
    ),
)
def index_daily_zh(
    symbol: str = Query(...),
    start: str | None = Query(None),
    end: str | None = Query(None),
):
    try:
        norm = _normalize_index_symbol(symbol)
        df = ak.stock_zh_index_daily(symbol=norm)
        # 可选按日期过滤（若存在 `日期` 或 `date` 列）
        if start or end:
            col = "日期" if "日期" in df.columns else ("date" if "date" in df.columns else None)
            if col:
                if start:
                    df = df[df[col] >= start]
                if end:
                    df = df[df[col] <= end]
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})
