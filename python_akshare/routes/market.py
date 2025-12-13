from fastapi import APIRouter, Query
from fastapi.responses import JSONResponse, Response
import json
import akshare as ak

from .common import df_to_records, to_json_safe


router = APIRouter()

@router.get(
    "/api/public/stock_zh_index_spot",
    summary="东方财富网-沪深主要指数-实时行情",
    description=(
        "调用 AkShare `stock_zh_index_spot_em` 获取东方财富-沪深主要指数的实时行情数据。\n"
        "参数: 使用 `symbol=\"沪深重要指数\"` 聚焦核心指数。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_zh_index_spot():
    """
    获取沪深主要指数的实时行情
    
    参数:
    - 固定 symbol=\"沪深重要指数\"
    
    返回值:
    - JSON 数组：字段以上游返回为准
    
    异常:
    - 抓取或处理异常时返回 {"error": str(e)}
    """
    try:
        df = ak.stock_zh_index_spot_em(symbol="沪深重要指数")
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


# 证券类别统计
# 接口: stock_szse_summary
# 目标地址: http://www.szse.cn/market/overview/index.html
# 描述: 深圳证券交易所-市场总貌-证券类别统计
# 限量: 单次返回指定 date 的市场总貌数据-证券类别统计(当前交易日的数据需要交易所收盘后统计)
@router.get(
    "/api/public/stock_szse_summary",
    summary="深圳证券交易所-市场总貌-证券类别统计",
    description=(
        "调用 AkShare `stock_szse_summary` 获取深圳证券交易所市场总貌的证券类别统计数据。\n"
        "参数: date: str 格式为 'YYYYMMDD'，默认为空表示最新交易日。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_szse_summary(
    date: str = Query(
        "",
        description="查询日期，格式为 'YYYYMMDD'；留空则取最新交易日数据。",
        example="20230630",
    )
):
    try:
        if (date or "").strip() == "":
            data = ak.stock_szse_summary()
        else:
            data = ak.stock_szse_summary(date=date)
        safe = to_json_safe(data)
        return Response(content=json.dumps(safe, ensure_ascii=False), media_type="application/json")
    except Exception as e:
        # 统一返回错误信息，避免暴露内部堆栈
        return JSONResponse(content={"error": str(e)})

# 实时行情数据
# 实时行情数据-东财
# 沪深京 A 股
# 接口: stock_zh_a_spot_em
# 目标地址: https://quote.eastmoney.com/center/gridlist.html#hs_a_board
# 描述: 东方财富网-沪深京 A 股-实时行情数据
# 限量: 单次返回所有沪深京 A 股上市公司的实时行情数据
@router.get(
    "/api/public/stock_zh_a_spot_em",
    summary="东方财富网-沪深京 A 股-实时行情",
    description=(
        "调用 AkShare `stock_zh_a_spot_em` 获取东方财富网沪深京 A 股的实时行情数据。\n"
        "参数: 无。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_zh_a_spot_em():
    try:
        df = ak.stock_zh_a_spot_em()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


# 创业板
# 接口: stock_cy_a_spot_em
# 目标地址: https://quote.eastmoney.com/center/gridlist.html#gem_board
# 描述: 东方财富网-创业板-实时行情
# 限量: 单次返回所有创业板的实时行情数据
@router.get(
    "/api/public/stock_cy_a_spot_em",
    summary="东方财富网-创业板-实时行情",
    description=(
        "调用 AkShare `stock_cy_a_spot_em` 获取东方财富网创业板的实时行情数据。\n"
        "参数: 无。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_cy_a_spot_em():
    try:
        df = ak.stock_cy_a_spot_em()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


# 科创板
# 接口: stock_kc_a_spot_em
# 目标地址: http://quote.eastmoney.com/center/gridlist.html#kcb_board
# 描述: 东方财富网-科创板-实时行情
# 限量: 单次返回所有科创板的实时行情数据
@router.get(
    "/api/public/stock_kc_a_spot_em",
    summary="东方财富网-科创板-实时行情",
    description=(
        "调用 AkShare `stock_kc_a_spot_em` 获取东方财富网科创板的实时行情数据。\n"
        "参数: 无。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_kc_a_spot_em():
    try:
        df = ak.stock_kc_a_spot_em()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})




# 全球财经快讯-新浪财经
# 接口: stock_info_global_sina
# 目标地址: https://finance.sina.com.cn/7x24
# 描述: 新浪财经-全球财经快讯
# 限量: 单次返回最近 20 条新闻数据
@router.get(
    "/api/public/stock_info_global_sina",
    summary="全球市场实时行情(Sina)",
    description=(
        "调用 AkShare `stock_info_global_sina` 获取全球股票/指数的实时行情快照。\n"
        "参数: 无。\n"
        "返回: JSON 数组；字段以上游返回为准（可能包含名称、代码、最新价、涨跌幅等）。"
    ),
)
def stock_info_global_sina():
    try:
        df = ak.stock_info_global_sina()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})

# 快讯-富途牛牛
# 接口: stock_info_global_futu
# 目标地址: https://news.futunn.com/main/live
# 描述: 富途牛牛-快讯
# 限量: 单次返回最近 50 条新闻数据
@router.get(
    "/api/public/stock_info_global_futu",
    summary="全球市场实时行情(Futu)",
    description=(
        "调用 AkShare `stock_info_global_futu` 获取全球市场的实时行情快照。\n"
        "参数: 无。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_info_global_futu():
    try:
        df = ak.stock_info_global_futu()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})



# 大盘资金流
# 接口: stock_market_fund_flow
# 目标地址: https://data.eastmoney.com/zjlx/dpzjlx.html
# 描述: 东方财富网-数据中心-资金流向-大盘
# 限量: 单次获取大盘资金流向历史数据
@router.get(
    "/api/public/stock_market_fund_flow",
    summary="东方财富网-大盘资金流向",
    description=(
        "调用 AkShare `stock_market_fund_flow` 获取东方财富网大盘资金流向历史数据。\n"
        "参数: 无。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_market_fund_flow():
    try:
        df = ak.stock_market_fund_flow()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


# 板块资金流排名
# 接口: stock_sector_fund_flow_rank
# 目标地址: https://data.eastmoney.com/bkzj/hy.html
# 描述: 东方财富网-数据中心-资金流向-板块资金流-排名
# 限量: 单次获取指定板块的指定期限的资金流排名数据
@router.get(
    "/api/public/stock_sector_fund_flow_rank",
    summary="东方财富网-板块资金流排名",
    description=(
        "调用 AkShare `stock_sector_fund_flow_rank` 获取东方财富网板块资金流排名数据。\n"
        "参数: indicator: str 可选值为 '今日', '3日', '5日', '10日'，默认为 '今日'。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_sector_fund_flow_rank(
    indicator: str = Query(
        "今日",
        description="资金流向类型，可选值：'今日', '3日', '5日', '10日'",
        example="今日",
    )
):
    try:
        df = ak.stock_sector_fund_flow_rank(indicator=indicator)
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


# 个股资金流排名
# 接口: stock_individual_fund_flow_rank
# 目标地址: http://data.eastmoney.com/zjlx/detail.html
# 描述: 东方财富网-数据中心-资金流向-排名
# 限量: 单次获取指定类型的个股资金流排名数据
@router.get(
    "/api/public/stock_individual_fund_flow_rank",
    summary="东方财富网-个股资金流排名",
    description=(
        "调用 AkShare `stock_individual_fund_flow_rank` 获取东方财富网个股资金流排名数据。\n"
        "参数: indicator: str 可选值为 '今日', '3日', '5日', '10日', '主力', '超大单', '大单', '中单', '小单'，默认为 '今日'。\n"
        "返回: JSON 数组；字段以上游返回为准。"
    ),
)
def stock_individual_fund_flow_rank(
    indicator: str = Query(
        "今日",
        description="资金流向类型，可选值：'今日', '3日', '5日', '10日', '主力', '超大单', '大单', '中单', '小单'",
        example="今日",
    )
):
    try:
        df = ak.stock_individual_fund_flow_rank(indicator=indicator)
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})
