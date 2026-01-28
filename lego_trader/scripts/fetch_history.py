# -*- coding: utf-8 -*-
"""
采集股票历史数据到 CSV 文件
使用前请确保已安装以下依赖：
pip install akshare pandas
"""

import akshare as ak
import pandas as pd
import os
import time
import datetime

# --- 配置项 ---
# 数据保存目录 (在项目根目录下的 data/stock_history)
DATA_DIR = os.path.join(os.path.dirname(os.path.dirname(__file__)), "data", "stock_history")
# 开始日期 (格式 YYYYMMDD)
START_DATE = "20200101"
# 结束日期 (默认为今天)
END_DATE = datetime.datetime.now().strftime("%Y%m%d")
# 复权方式: "qfq" (前复权), "hfq" (后复权), "" (不复权)
ADJUST = "qfq"
# 每次请求后的休眠时间（秒），防止被封 IP
SLEEP_TIME = 0.5

def init_env():
    """初始化环境，创建数据目录"""
    if not os.path.exists(DATA_DIR):
        try:
            os.makedirs(DATA_DIR)
            print(f"[INFO] 创建数据目录: {DATA_DIR}")
        except Exception as e:
            print(f"[ERROR] 创建目录失败: {e}")
            exit(1)

def get_stock_list():
    """获取 A 股所有股票列表"""
    print("[INFO] 正在获取 A 股股票列表...")
    try:
        # 使用 akshare 获取实时行情数据作为列表来源
        # 返回 DataFrame 包含: 序号, 代码, 名称, 最新价, 涨跌幅, ...
        df = ak.stock_zh_a_spot_em()
        return df
    except Exception as e:
        print(f"[ERROR] 获取股票列表失败: {e}")
        return pd.DataFrame()

def fetch_and_save_history(symbol, name):
    """获取并保存单只股票的历史数据"""
    file_path = os.path.join(DATA_DIR, f"{symbol}.csv")
    
    # 如果文件已存在，这里简单跳过，也可以改为覆盖或增量更新
    if os.path.exists(file_path):
        print(f"[SKIP] {symbol} {name} 文件已存在")
        return

    print(f"[FETCH] 正在采集 {symbol} {name} ...")
    try:
        # 获取日 K 线数据
        # period: period="daily"; choice of {'daily', 'weekly', 'monthly'}
        # adjust: choice of {'', 'qfq', 'hfq'}
        stock_df = ak.stock_zh_a_hist(
            symbol=symbol, 
            period="daily", 
            start_date=START_DATE, 
            end_date=END_DATE, 
            adjust=ADJUST
        )
        
        if stock_df is None or stock_df.empty:
            print(f"[WARN] {symbol} {name} 无数据")
            return

        # 保存为 CSV
        # encoding='utf-8-sig' 可以让 Excel 正确打开中文
        stock_df.to_csv(file_path, index=False, encoding='utf-8-sig')
        print(f"[OK] {symbol} {name} 已保存 ({len(stock_df)} 条记录)")
        
    except Exception as e:
        print(f"[ERROR] 采集 {symbol} {name} 失败: {e}")

def main():
    init_env()
    
    # 1. 获取列表
    df_stocks = get_stock_list()
    if df_stocks.empty:
        print("[ERROR] 股票列表为空，程序退出")
        return

    total = len(df_stocks)
    print(f"[INFO] 共获取到 {total} 只股票")

    # 2. 遍历采集
    for index, row in df_stocks.iterrows():
        symbol = str(row['代码'])
        name = str(row['名称'])
        
        # 显示进度
        print(f"[{index + 1}/{total}] Processing...", end=" ")
        
        fetch_and_save_history(symbol, name)
        
        # 延时
        time.sleep(SLEEP_TIME)

    print("[INFO] 所有任务完成")

if __name__ == "__main__":
    main()
