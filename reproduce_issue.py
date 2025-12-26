import akshare as ak
try:
    print("Testing stock_news_em for symbol 300001")
    df = ak.stock_news_em(symbol="300001")
    print("Success!")
    print(df.head())
except Exception as e:
    print(f"Error: {e}")
    import traceback
    traceback.print_exc()
