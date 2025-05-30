import streamlit as st
import time

st.write("데이터를 불러옵니다...")
with st.spinner("잠시만 기다려주세요..."):
  time.sleep(5)

st.success("데이터 로딩 완료")
