import streamlit as st
import pandas as pd
import numpy as np
import altair as alt

st.header("st.write")
st.write("hello, *World!* :sunglasses:")
st.write(1234)

df = pd.DataFrame({
    'First':[1,2,3,4],
    'Second':[10,20,30,40]
})
st.write(df)
st.write('아래는 데이터프레임입니다.', df, '위는 데이터프레임입니다.')

df2 = pd.DataFrame(
    np.random.randn(200,3),
    columns=['a','b','c'])
c = alt.Chart(df2).mark_circle().encode(
    x='a',y='b',size='c',color='c', tooltip=['a','b','c'])
st.write(c)


