import json
import requests
import pandas as pd

def debug_stock_news_em(symbol: str = "300001"):
    url = "https://search-api-web.eastmoney.com/search/jsonp"
    inner_param = {
        "uid": "",
        "keyword": symbol,
        "type": ["cmsArticleWebOld"],
        "client": "web",
        "clientType": "web",
        "clientVersion": "curr",
        "param": {
            "cmsArticleWebOld": {
                "searchScope": "default",
                "sort": "default",
                "pageIndex": 1,
                "pageSize": 10,
                "preTag": "<em>",
                "postTag": "</em>"
            }
        }
    }
    params = {
        "cb": "jQuery35101792940631092459_1764599530165",
        "param": json.dumps(inner_param, ensure_ascii=False),
        "_": "1764599530176"
    }
    headers = {
        "accept": "*/*",
        "accept-encoding": "gzip, deflate, br, zstd",
        "accept-language": "en,zh-CN;q=0.9,zh;q=0.8",
        "cache-control": "no-cache",
        "connection": "keep-alive",
        "host": "search-api-web.eastmoney.com",
        "pragma": "no-cache",
        "referer": "https://so.eastmoney.com/news/s?keyword=" + symbol,
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
    }
    r = requests.get(url, params=params, headers=headers)
    print(f"Status Code: {r.status_code}")
    print(f"Response Text: {r.text[:200]} ... {r.text[-50:]}")
    
    data_text = r.text
    # Replicate the logic in akshare
    stripped_text = data_text.strip("jQuery35101792940631092459_1764599530165(")[:-1]
    print(f"Stripped Text Start: {stripped_text[:100]}")
    print(f"Stripped Text End: {stripped_text[-50:]}")
    
    try:
        data_json = json.loads(stripped_text)
        print("JSON Load Success")
    except Exception as e:
        print(f"JSON Load Error: {e}")

if __name__ == "__main__":
    debug_stock_news_em()
