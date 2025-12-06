from fastapi import FastAPI
import os
import sys

# 确保可直接运行 main.py 时能够找到本目录下的 routes 包
CURRENT_DIR = os.path.dirname(__file__)
if CURRENT_DIR not in sys.path:
    sys.path.append(CURRENT_DIR)

from routes.stocks import router as stocks_router
from routes.news import router as news_router
from routes.market import router as market_router
from routes.sectors import router as sectors_router

app = FastAPI(title="python_akshare", version="0.1.0")


@app.get("/")
def index():
    return {"service": "python_akshare", "status": "ok"}
app.include_router(stocks_router)
app.include_router(news_router)
app.include_router(market_router)
app.include_router(sectors_router)
