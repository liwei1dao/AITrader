import pandas as pd
from fastapi.encoders import jsonable_encoder


def df_to_records(df: pd.DataFrame):
    if df is None:
        return []
    if not isinstance(df, pd.DataFrame):
        return []
    df = df.replace([float("inf"), float("-inf")], None)
    df = df.where(pd.notnull(df), None)
    records = df.to_dict(orient="records")
    return jsonable_encoder(records)


def _normalize_symbol_xq(symbol: str) -> str:
    s = (symbol or "").strip()
    if len(s) == 6:
        if s[0] == "6":
            return "SH" + s
        return "SZ" + s
    if len(s) >= 2 and s[:2].lower() in ("sz", "sh"):
        return s.upper()
    return s
