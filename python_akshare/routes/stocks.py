from fastapi import APIRouter, Query
from fastapi.responses import JSONResponse
import akshare as ak
import pandas as pd

from .common import df_to_records, _normalize_symbol_xq


router = APIRouter()


@router.get(
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


@router.get(
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


@router.get(
    "/api/public/stock_bid_ask_em",
    summary="实时盘口(东方财富)",
    description=(
        "调用 AkShare `stock_bid_ask_em` 获取 A 股股票的实时买卖盘口。\n"
        "参数: `symbol` 为 6 位股票代码，如 `000001`；支持带市场前缀输入 `SZ000001`/`SH600000`，会自动处理为 6 位代码。\n"
        "返回: JSON 数组，每项为一个档位或记录；常见字段包含 `买一价`、`买一量`、`买二价`、`买二量`、`卖一价`、`卖一量`，以及时间戳/最新价等（具体字段可能随上游变化）。\n"
        "说明: 数据源为东方财富；异常时返回 `{error: string}`。"
    ),
)
def stock_bid_ask_em(symbol: str = Query(...)):
    """
    获取 A 股实时买卖盘口（东方财富）
    - 功能: 通过 AkShare `stock_bid_ask_em` 读取指定股票的实时买卖盘明细
    - 参数: symbol 支持 6 位代码或带市场前缀 `SZ`/`SH`
    - 返回: list[dict]，每项为一个档位或记录，常见字段包含买卖价量、时间/最新价等
    - 错误: 上游异常时返回 {"error": string}
    """
    s = (symbol or "").strip().upper()
    # 规范化为 6 位代码
    if len(s) >= 8 and s[:2] in ("SZ", "SH"):
        s6 = s[2:8]
    elif len(s) == 6:
        s6 = s
    else:
        s6 = s
    try:
        df = ak.stock_bid_ask_em(symbol=s6)
        recs = df_to_records(df)
        # 若返回为空且输入带前缀，尝试用原始输入，以防上游接口参数规则变化
        if not recs and len(s) >= 8 and s[:2] in ("SZ", "SH"):
            try:
                df2 = ak.stock_bid_ask_em(symbol=s)
                recs2 = df_to_records(df2)
                return JSONResponse(content=recs2)
            except Exception:
                pass
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e), "normalized_symbol": s6})


@router.get(
    "/api/public/stock_zh_a_hist",
    summary="A股历史行情(东方财富)",
    description=(
        "调用 AkShare `stock_zh_a_hist` 获取 A 股股票的历史行情数据。\n"
        "参数: `symbol` 支持 6 位代码或带市场前缀 `SZ`/`SH`；`period` 支持 `daily`/`weekly`/`monthly`；`start`/`end` 为起止日期 `YYYYMMDD`；`adjust` 复权选项 `''`/`qfq`/`hfq`。\n"
        "返回: JSON 数组，常见字段包括 `日期`、`开盘`、`收盘`、`最高`、`最低`、`成交量`、`成交额`、`振幅`、`涨跌幅`、`涨跌额`、`换手率` 等（具体字段可能随上游版本变化）。\n"
        "说明: 数据源为东方财富；异常时返回 `{error: string}`。"
    ),
)
def stock_zh_a_hist(
    symbol: str = Query(...),
    period: str = Query("daily"),
    start: str | None = Query(None),
    end: str | None = Query(None),
    adjust: str = Query("")
):
    """
    获取 A 股历史行情（东方财富）
    - 功能: 通过 AkShare `stock_zh_a_hist` 拉取指定股票在时间区间内的历史K线
    - 参数:
      - symbol: 6位代码或带前缀 `SZ`/`SH`
      - period: `daily`/`weekly`/`monthly`
      - start/end: 起止日期 `YYYYMMDD`
      - adjust: 复权 `''`(不复权)/`qfq`(前复权)/`hfq`(后复权)
    - 返回: list[dict]，包含日期/价量/涨跌幅/换手率等字段
    - 错误: 上游异常时返回 {"error": string}
    """
    # 归一化代码为 AkShare 期望格式（小写 sz/sh 前缀）
    norm = _normalize_symbol_xq(symbol)
    norm_l = norm.lower()
    per = (period or "daily").lower()
    adj = (adjust or "").lower()
    try:
        df = ak.stock_zh_a_hist(
            symbol=norm_l,
            period=per,
            start_date=start,
            end_date=end,
            adjust=adj,
        )
        recs = df_to_records(df)
        if recs:
            return JSONResponse(content=recs)
        # Fallback 1: try with original input symbol (no normalization)
        try:
            df2 = ak.stock_zh_a_hist(
                symbol=symbol,
                period=per,
                start_date=start,
                end_date=end,
                adjust=adj,
            )
            recs2 = df_to_records(df2)
            if recs2:
                return JSONResponse(content=recs2)
        except Exception:
            pass
        # Fallback 2: if 6-digit symbol, try market-prefixed uppercase (SH/SZ)
        s = (symbol or "").strip()
        if len(s) == 6:
            prefix = "SH" if s[0] == "6" else "SZ"
            try:
                df3 = ak.stock_zh_a_hist(
                    symbol=f"{prefix}{s}",
                    period=per,
                    start_date=start,
                    end_date=end,
                    adjust=adj,
                )
                recs3 = df_to_records(df3)
                if recs3:
                    return JSONResponse(content=recs3)
            except Exception:
                pass
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e), "normalized_symbol": norm_l, "period": per, "adjust": adj})

