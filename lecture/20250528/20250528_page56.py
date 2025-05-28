import streamlit as st

st.header("st.multiselect")

option = st.multiselect(
    "가장 좋아하는 색상은 무엇인가요?",
    ["Blue", "Green", "Red", "Pink", "Purple", "Yellow", "Violet"])

st.write("Your favorite color is :", option)
