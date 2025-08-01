import streamlit as st
from datetime import time, datetime

st.header("st.slider")

# ex1
st.subheader("Slider")

age = st.slider("당신의 나이는?", 0, 130, 25)
st.write("나는 " , age, "살입니다.")

# ex2
st.subheader("범위 슬라이더")

values = st.slider(
    "값의 범위를 선택하세요.",
    0.0, 100.0, (25.0, 75.0))
st.write("값:", values)

# ex3
st.subheader("시간 범위 슬라이더")

appointment = st.slider(
    "약속을 예약하세요:",
    value=(time(11,30), time(12,45)))
st.write("예약된 시간:", appointment)

# ex4
st.subheader("날씨 및 시간 슬라이더")

start_time = st.slider(
    "언제 시작하시겠습니까?",
    value=datetime(2020,1,1,9,30),
    format="YY/MM/DD - hh:mm")
st.write("시작 시간:", start_time)
