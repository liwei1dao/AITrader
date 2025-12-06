from fastapi import FastAPI, Query
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
import akshare as ak
import pandas as pd
import time

app = FastAPI(title="python_akshare", version="0.1.0")


def df_to_records(df: pd.DataFrame):
    if df is None:
        return []
    if not isinstance(df, pd.DataFrame):
        return []
    records = df.where(pd.notnull(df), None).to_dict(orient="records")
    return jsonable_encoder(records)


def _ak_retry(func, **kwargs):
    for i in range(2):
        try:
            return func(**kwargs)
        except Exception as e:
            msg = str(e)
            if i == 0 and (
                "Remote end closed connection without response" in msg
                or "Connection aborted" in msg
            ):
                time.sleep(0.2)
                continue
            raise


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
        df = _ak_retry(ak.stock_individual_info_em, symbol=symbol)
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
        data = _ak_retry(ak.stock_individual_basic_info_xq, symbol=symbol)
        # 转换为可序列化 JSON
        if isinstance(data, pd.DataFrame):
            recs = df_to_records(data)
            return JSONResponse(content=recs)
        # 非 DataFrame，直接返回；如需，可判断空对象
        return JSONResponse(content=data)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


@app.get(
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
    try:
        df = _ak_retry(ak.stock_bid_ask_em, symbol=symbol)
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


@app.get(
    "/api/public/stock_news_em",
    summary="个股新闻(东方财富)",
    description=(
        "调用 AkShare `stock_news_em` 获取指定股票的新闻列表。\n"
        "参数: `symbol` 支持 6 位代码或带市场前缀 `SZ`/`SH`；`page` 为页号(可选)，`size` 为每页条数(可选，具体受上游限制)。\n"
        "返回: JSON 数组；常见字段包含标题、发布时间、来源、新闻ID/链接等（具体字段可能随上游变化）。\n"
        "说明: 数据源为东方财富；异常时返回 `{error: string}`。"
    ),
)
def stock_news_em(
    symbol: str = Query(...),
    page: int | None = Query(None),
    size: int | None = Query(None),
):
    """
    获取个股新闻（东方财富）
    - 功能: 通过 AkShare `stock_news_em` 读取指定股票的新闻列表
    - 参数: symbol 支持 6 位代码或带市场前缀 `SZ`/`SH`；page/size 可选
    - 返回: list[dict]，包含标题/时间/来源/链接等
    - 错误: 上游异常时返回 {"error": string}
    """
    try:
        kwargs = {}
        if page is not None:
            kwargs["page"] = page
        if size is not None:
            kwargs["size"] = size
        df = _ak_retry(ak.stock_news_em, symbol=symbol, **kwargs)
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


@app.get(
    "/api/public/stock_news_main_cx",
    summary="市场要闻(财新)",
    description=(
        "调用 AkShare `stock_news_main_cx` 获取财新网的股票市场要闻列表。\n"
        "参数: 无（返回最新的市场要闻列表）。\n"
        "返回: JSON 数组；常见字段包含标题、发布时间、来源、新闻ID/链接、摘要等（具体字段以上游为准可能变化）。\n"
        "说明: 数据源为财新网；异常时返回 `{error: string}`。"
    ),
)
def stock_news_main_cx():
    """
    获取市场要闻（财新）
    - 功能: 通过 AkShare `stock_news_main_cx` 拉取财新网的股票市场要闻
    - 参数: 无
    - 返回: list[dict]，包含标题/时间/来源/链接/摘要等字段（以上游返回为准）
    - 错误: 上游异常时返回 {"error": string}
    """
    try:
        df = _ak_retry(ak.stock_news_main_cx)
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


@app.get(
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
    try:
        df = _ak_retry(
            ak.stock_zh_a_hist,
            symbol=symbol,
            period=period,
            start_date=start,
            end_date=end,
            adjust=adjust,
        )
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})
