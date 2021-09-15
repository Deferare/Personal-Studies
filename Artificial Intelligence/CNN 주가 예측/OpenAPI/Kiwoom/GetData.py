from Login import *
import pandas as pd

df = kiwoom.block_request("opt10080",
                          종목코드="005930",
                          틱범위="5:5분",
                          수정주가구분=0,
                          output="주식분봉차트조회",
                          next=0)
df = df[["체결시간", "시가", "고가", "저가", "현재가", "거래량"]]
print(df)