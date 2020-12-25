import MetaTrader5 as mt5
import pandas as pd
from datetime import datetime
import time

if not mt5.initialize():
    print("MetaTrader Initialize error")
    mt5.shutdown()

stocks = mt5.symbols_get();

print(len(stocks))

position = mt5.copy_rates_from_pos('WINZ20', mt5.TIMEFRAME_M5, 0, 1)

print(position)

def get_ohcl(stockSelect, timeframe, n=5):
    stock = mt5.copy_rates_from_pos(stockSelect, timeframe, 0, n)
    stock = pd.DataFrame(stock)
    stock['time'] = pd.to_datetime(stock['time'], unit='s')
    stock.set_index('time', inplace=True)
    return stock

get_ohcl('WIN$', mt5.TIMEFRAME_M5)

print(mt5.symbol_info_tick('WIN$'))

stock_time = time.time() + 5

while time.time() < stock_time:
    tick = mt5.symbol_info_tick('WIN$')
    print(f"WIN - last:{tick.last}, bid:{tick.bid}, ask:{tick.ask}", end='/r')
    time.sleep(0.5)