import math
import numpy as np
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


def to_json_safe(obj):
    def _san(v):
        if isinstance(v, float):
            if math.isnan(v) or not math.isfinite(v):
                return None
            return v
        if isinstance(v, (np.floating,)):
            f = float(v)
            if math.isnan(f) or not math.isfinite(f):
                return None
            return f
        if isinstance(v, (np.integer,)):
            return int(v)
        # pandas NA/NaT
        try:
            if isinstance(v, pd.Timestamp):
                return v.isoformat()
            if pd.isna(v):
                return None
        except Exception:
            pass
        if isinstance(v, dict):
            return {k: _san(val) for k, val in v.items()}
        if isinstance(v, (list, tuple, set)):
            return [_san(x) for x in v]
        return v

    if isinstance(obj, pd.DataFrame):
        obj = obj.replace([float("inf"), float("-inf"), np.inf, -np.inf], None)
        records = obj.to_dict(orient="records")
        records = [{k: _san(v) for k, v in row.items()} for row in records]
        return jsonable_encoder(records)
    if isinstance(obj, pd.Series):
        s = obj.replace([float("inf"), float("-inf"), np.inf, -np.inf], None)
        s = s.where(pd.notnull(s), None)
        return jsonable_encoder(_san(s.to_dict()))
    return jsonable_encoder(_san(obj))
