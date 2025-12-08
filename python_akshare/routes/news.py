from fastapi import APIRouter, Query
from fastapi.responses import JSONResponse
import akshare as ak

from .common import df_to_records


router = APIRouter()


@router.get(
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
    s = (symbol or "").strip().upper()
    # 规范化为 6 位代码
    if len(s) >= 8 and s[:2] in ("SZ", "SH"):
        s6 = s[2:8]
    elif len(s) == 6:
        s6 = s
    else:
        s6 = s
    try:
        kwargs = {}
        if page is not None:
            kwargs["page"] = page
        if size is not None:
            kwargs["size"] = size
        df = ak.stock_news_em(symbol=s6, **kwargs)
        recs = df_to_records(df)
        # 若返回为空且输入带前缀，尝试用原始输入
        if not recs and len(s) >= 8 and s[:2] in ("SZ", "SH"):
            try:
                df2 = ak.stock_news_em(symbol=s, **kwargs)
                recs2 = df_to_records(df2)
                return JSONResponse(content=recs2)
            except Exception:
                pass
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e), "normalized_symbol": s6, "page": page, "size": size})


@router.get(
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
        df = ak.stock_news_main_cx()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})

