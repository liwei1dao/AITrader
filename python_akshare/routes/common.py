import pandas as pd


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

