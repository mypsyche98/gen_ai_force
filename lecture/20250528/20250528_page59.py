import streamlit as st

st.header("st.checkbox")

st.write("주문하고 싶은 것이 무엇인가요?")

icecream = st.checkbox("icecream")
coffee = st.checkbox("coffee")
cola = st.checkbox("cola")

if icecream:
  st.write("This is icecream")

if coffee:
  st.write("This is coffee")

if cola:
  st.write("This is cola")
