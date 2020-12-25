import MetaTrader5 as mt5
import pandas as pd
from datetime import datetime
import time

if not mt5.initialize():
    print("MetaTrader Initialize error")
    mt5.shutdown()


symbol = 'WIN$'

symbol_info = mt5.symbol_info(symbol)

if symbol_info is None:
    print(symbol, 'not found')
    mt5.shutdown()
    quit()


if not symbol_info.visible:
    print(symbol, 'not visible, adding...')
    if not mt5.symbol_select(symbol, True):
        print('symbol_select() failed, exiting..', symbol)
        mt5.shutdown()
        quit()

lot = 1
point = mt5.symbol_info(symbol).point
price = mt5.symbol_info_tick(symbol).ask
deviation = 20
request = {
    "action": mt5.TRADE_ACTION_DEAL,
    "symbol": symbol,
    "volume": lot,
    "type": mt5.ORDER_TYPE_BUY,
    "sl": price - 100 * point,
    "tp": price + 100 * point,
    "deviation": deviation,
    "magic": 234000,
    "comment": "python script open",
    "type_time": mt5.ORDER_TIME_GTC,
    "type_filling": mt5.ORDER_FILLING_RETURN
}

result = mt5.order_send(request)
print(f"1. order send: {lot} of {symbol} with price:{price}")

if result.retcode != mt5.TRADE_RETCODE_DONE:
    print("2. order send failed, retcode={}".format(result.retcode))
    result_dict = result._asdict()
    for field in result_dict.keys():
        if field=="request":
            traderrequest_dict=result_dict[field]._asdict()
            for traderreq_filed in traderrequest_dict:
                print("         traderrequest: {}={}".format(traderreq_filed))

    mt5.shutdown()
    quit()