from fastapi import APIRouter, Query
from fastapi.responses import JSONResponse
import akshare as ak

from .common import df_to_records


router = APIRouter()

@router.get(
    "/api/public/board_industry_list_em",
    summary="行业板块列表(东方财富)",
    description=(
        "调用 AkShare `stock_board_industry_name_em` 获取东方财富行业板块列表。\n"
        "返回: JSON 数组；常见字段包含板块名称、板块代码、涨跌幅、总市值等（具体字段随上游可能变化）。"
    ),
)
def board_industry_list_em():
    try:
        df = ak.stock_board_industry_name_em()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


@router.get(
    "/api/public/board_industry_cons_em",
    summary="行业板块成分股(东方财富)",
    description=(
        "调用 AkShare `stock_board_industry_cons_em` 获取指定行业板块的成分股。\n"
        "参数: `industry` 为板块名称，需与列表返回的名称一致。"
    ),
)
def board_industry_cons_em(industry: str = Query(...)):
    try:
        df = ak.stock_board_industry_cons_em(industry=industry)
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e), "industry": industry})


@router.get(
    "/api/public/board_concept_list_em",
    summary="概念板块列表(东方财富)",
    description=(
        "调用 AkShare `stock_board_concept_name_em` 获取东方财富概念板块列表。"
    ),
)
def board_concept_list_em():
    try:
        df = ak.stock_board_concept_name_em()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


@router.get(
    "/api/public/board_concept_cons_em",
    summary="概念板块成分股(东方财富)",
    description=(
        "调用 AkShare `stock_board_concept_cons_em` 获取指定概念板块的成分股。\n"
        "参数: `board` 为板块名称（board_name），需与列表返回的名称一致。"
    ),
)
def board_concept_cons_em(board: str = Query(...)):
    try:
        df = ak.stock_board_concept_cons_em(board_name=board)
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e), "board": board})


@router.get(
    "/api/public/board_industry_flow_rank_em",
    summary="行业板块资金流排名(东方财富)",
    description=(
        "调用 AkShare `stock_board_industry_fund_flow_rank_em` 获取行业板块资金流排名。"
    ),
)
def board_industry_flow_rank_em():
    try:
        df = ak.stock_board_industry_fund_flow_rank_em()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})


@router.get(
    "/api/public/board_concept_flow_rank_em",
    summary="概念板块资金流排名(东方财富)",
    description=(
        "调用 AkShare `stock_board_concept_fund_flow_rank_em` 获取概念板块资金流排名。"
    ),
)
def board_concept_flow_rank_em():
    try:
        df = ak.stock_board_concept_fund_flow_rank_em()
        recs = df_to_records(df)
        return JSONResponse(content=recs)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})

