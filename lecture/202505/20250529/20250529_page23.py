import streamlit as st
import time

st.write("데이터 처리 진행 상황")
with st.spinner("전체 작업 진행 중..."):
  progress = st.progress(0)
  status_text = st.empty()

  for i in range(5):
    status_text.write(f" Step {i+1}/5: 데이터 준비 중...")
    time.sleep(1)
    progress.progress((i+1)*20)

st.success("처리가 모두 끝났습니다.!!")
