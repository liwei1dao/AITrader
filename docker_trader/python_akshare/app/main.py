import akshare as ak
from fastapi import FastAPI
from fastapi.responses import JSONResponse
import datetime

app = FastAPI()

def df_to_records(df):
    try:
        df = df.copy()
        def norm(x):
            if hasattr(x, "isoformat"):
                return x.isoformat()
            return x
        df = df.applymap(norm)
        return df.to_dict(orient="records")
    except Exception:
        return []

def normalize_symbol(symbol: str) -> str:
    s = symbol.lower()
    if s.startswith("sz") or s.startswith("sh"):
        return s
    if symbol and symbol[0] == "6":
        return "sh" + symbol
    return "sz" + symbol

@app.get("/api/public/stock_zh_a_spot")
def stock_zh_a_spot():
    try:
        df = ak.stock_zh_a_spot()
        records = df_to_records(df)
        if isinstance(records, list) and len(records) == 0:
            return JSONResponse(content=[{"error": "empty"}])
        return JSONResponse(content=records)
    except Exception as e:
        return JSONResponse(content=[{"error": str(e)}])

@app.get("/api/public/stock_zh_a_hist")
def stock_zh_a_hist(symbol: str, period: str = "daily", start_date: str = "", end_date: str = "", adjust: str = ""):
    try:
        df = ak.stock_zh_a_hist(symbol=symbol, period=period, start_date=start_date, end_date=end_date, adjust=adjust)
        records = df_to_records(df) if hasattr(df, "to_dict") else df
        if isinstance(records, list) and len(records) == 0:
            ns = normalize_symbol(symbol)
            try:
                df2 = ak.stock_zh_a_daily(symbol=ns, start_date=start_date, end_date=end_date, adjust=adjust)
                return JSONResponse(content=df_to_records(df2))
            except Exception:
                pass
        return JSONResponse(content=records)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})

@app.get("/api/public/stock_individual_info_em")
def stock_individual_info_em(symbol: str):
    try:
        df = ak.stock_individual_info_em(symbol=symbol)
        return JSONResponse(content=df_to_records(df))
    except Exception as e:
        return JSONResponse(content={"error": str(e)})

@app.get("/api/public/stock_financial_analysis_indicator")
def stock_financial_analysis_indicator(stock: str):
    try:
        try:
            df = ak.stock_financial_analysis_indicator(stock=stock)
        except Exception:
            df = ak.stock_financial_analysis_indicator(symbol=stock)
        records = df_to_records(df) if hasattr(df, "to_dict") else df
        if isinstance(records, list) and len(records) == 0:
            return JSONResponse(content={"error": "empty"})
        return JSONResponse(content=records)
    except Exception as e:
        return JSONResponse(content={"error": str(e)})

@app.get("/health")
def health():
    return {"status": "ok"}
