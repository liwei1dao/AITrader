import akshare as ak
from fastapi import FastAPI
from fastapi.responses import JSONResponse

app = FastAPI()

def df_to_records(df):
    try:
        return df.to_dict(orient="records")
    except Exception:
        return []

@app.get("/api/public/stock_zh_a_spot")
def stock_zh_a_spot():
    df = ak.stock_zh_a_spot()
    return JSONResponse(content=df_to_records(df))

@app.get("/api/public/stock_zh_a_hist")
def stock_zh_a_hist(symbol: str, period: str = "daily", start_date: str = "", end_date: str = "", adjust: str = ""):
    df = ak.stock_zh_a_hist(symbol=symbol, period=period, start_date=start_date, end_date=end_date, adjust=adjust)
    if hasattr(df, "to_dict"):
        return JSONResponse(content=df_to_records(df))
    return JSONResponse(content=df)

@app.get("/api/public/stock_individual_info_em")
def stock_individual_info_em(symbol: str):
    df = ak.stock_individual_info_em(symbol=symbol)
    return JSONResponse(content=df_to_records(df))

@app.get("/api/public/stock_financial_analysis_indicator")
def stock_financial_analysis_indicator(stock: str):
    df = ak.stock_financial_analysis_indicator(stock=stock)
    if hasattr(df, "to_dict"):
        return JSONResponse(content=df_to_records(df))
    return JSONResponse(content=df)

@app.get("/health")
def health():
    return {"status": "ok"}
