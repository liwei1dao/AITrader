from fastapi import FastAPI, Query
from fastapi.responses import JSONResponse
import akshare as ak
import pandas as pd
import time

app = FastAPI(title="python_akshare", version="0.1.0")


def df_to_records(df: pd.DataFrame):
    if df is None:
        return []
    if not isinstance(df, pd.DataFrame):
        return []
    return df.to_dict(orient="records")


def _normalize_symbol_xq(symbol: str) -> str:
    s = (symbol or "").strip()
    if len(s) == 6:
        if s[0] == "6":
            return "SH" + s
        return "SZ" + s
    if len(s) >= 2 and s[:2].lower() in ("sz", "sh"):
        return s.upper()
    return s


@app.get(
    "/api/public/stock_individual_info_em",
    summary="公司基本信息(东方财富)",
    description=(
        "调用 AkShare `stock_individual_info_em` 获取 A 股公司基础信息并返回键值数组。\n"
        "参数: `symbol` 为 6 位股票代码，如 `000001`。\n"
        "返回: JSON 数组，元素形如 `{item: string, value: any}`；常见项包括 `股票代码`、`股票简称`、"
        "`总股本`、`流通股`、`总市值`、`行业`、`上市时间(YYYYMMDD)` 等。\n"
        "说明: 数据源与字段来自东方财富/AKShare，可能随时间变化；异常时返回 `{error: string}`。"
    ),
)
def stock_individual_info_em(symbol: str = Query(...)):
    """
    获取 A 股公司基本信息（东方财富）
    - 功能: 通过 AkShare `stock_individual_info_em` 读取公司基础资料
    - 参数: symbol 股票代码(6位，不带市场前缀)，例如 `000001`
    - 返回: list[dict], 每项为 {"item": str, "value": Any}
      常见项: 股票代码/股票简称/总股本/流通股/总市值/行业/上市时间(YYYYMMDD)
    - 错误: 上游异常时返回 {"error": string}
    """
    try:
        df = ak.stock_individual_info_em(symbol=symbol)
        records = df_to_records(df)
        return JSONResponse(content=records)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


@app.get("/")
def index():
    return {"service": "python_akshare", "status": "ok"}


@app.get(
    "/api/public/stock_individual_basic_info_xq",
    summary="公司基本信息(雪球)",
    description=(
        "调用 AkShare `stock_individual_basic_info_xq` 获取 A 股公司基础信息。\n"
        "参数: `symbol` 支持 6 位代码或带市场前缀 `SZ`/`SH`，如 `000001`/`SZ000001`。\n"
        "返回: JSON 对象或数组，取决于上游实现；常见字段包含名称、行业、上市日期等。\n"
        "说明: 上游为雪球，字段可能与东方财富不同；异常时返回 `{error: string}`。"
    ),
)
def stock_individual_basic_info_xq(symbol: str = Query(...)):
    """
    获取 A 股公司基本信息（雪球）
    - 功能: 通过 AkShare `stock_individual_basic_info_xq` 读取公司基础资料
    - 参数: symbol 支持 6位代码或带市场前缀 `SZ`/`SH`
    - 返回: dict 或 list[dict]
    - 错误: 上游异常时返回 {"error": string}
    """
    try:
        norm = _normalize_symbol_xq(symbol)
        data = ak.stock_individual_basic_info_xq(symbol=norm)
        # 转换为可序列化 JSON
        if isinstance(data, pd.DataFrame):
            recs = df_to_records(data)
            # 若全部为 null/空值，则尝试用原始 symbol 再拉一次
            if not recs or all((r.get("value") is None or str(r.get("value")) == "") for r in recs):
                try:
                    data2 = ak.stock_individual_basic_info_xq(symbol=symbol)
                    if isinstance(data2, pd.DataFrame):
                        recs2 = df_to_records(data2)
                        if recs2 and not all((r.get("value") is None or str(r.get("value")) == "") for r in recs2):
                            return JSONResponse(content=recs2)
                    return JSONResponse(content=recs)
                except Exception:
                    return JSONResponse(content=recs)
            return JSONResponse(content=recs)
        # 非 DataFrame，直接返回；如需，可判断空对象
        return JSONResponse(content=data)
    except Exception as e:
        return JSONResponse(content={"error": str(e), "normalized_symbol": norm})
