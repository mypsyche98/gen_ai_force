import streamlit as st
import numpy as np
import pandas as pd
from time import time

st.title("st.cache_data")

"""
* st.cache는 deprecated 되었으므로 st.cache_data를 사용한다
* 교재 코드처럼 하면 st.write()하는 시간이 많이 걸려서 실제 캐시 적용여부를 판단하기가 힘들다
* 2000천만건으로 늘려서 순수 시간으로만 계산한다.
"""

@st.cache_data
def load_data_a():
  df = pd.DataFrame(
      np.random.rand(20000000, 5),
      columns=['a','b','c','d','e']
  )
  return df

def load_data_b():
  df = pd.DataFrame(
      np.random.rand(20000000, 5),
      columns=['a','b','c','d','e']
  )
  return df

# use cache
st.subheader('st.cache using')

st.subheader('call func - load_data_a() - first')
a0 = time()
dfa = load_data_a()
a1 = time()
st.info(a1-a0)


st.subheader('call func - load_data_a() - second')
a0 = time()
dfa = load_data_a()
a1 = time()
st.info(a1-a0)
#st.write(dfa)   ## 교재 코드처럼 하면 st.write()하는 시간이 많이 걸려서 실제 캐시 적용여부를 판단하기가 힘들다

st.subheader('st.cache not using')

st.subheader('call func - load_data_b() - first')
a0 = time()
dfb = load_data_b()
a1 = time()
st.info(a1-a0)


st.subheader('call func - load_data_b() - second')
a0 = time()
dfb = load_data_b()
a1 = time()
st.info(a1-a0)
#st.write(dfb)
# 2000천만건으로 늘려서 순수 시간으로만 계산한다.
