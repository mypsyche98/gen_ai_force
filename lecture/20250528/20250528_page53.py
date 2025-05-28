import streamlit as st

st.header("st.selectbox")

option = st.selectbox(
    "가장 좋아하는 색상은 무엇인가요?",
    ("Blue", "Green", "Red", "Pink", "Purple"))

st.write("Your favorite color is :", option)
