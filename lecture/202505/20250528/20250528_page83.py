import streamlit as st

st.set_page_config(layout="wide")

st.title("Streamlit App Layout")

with st.expander("About this app..."):
  st.write("이 앱은 Streamlit 앱을 구성하는 다양한 방법을 보여줍니다.")
  st.image("https://streamlit.io/images/brand/streamlit-logo-secondary-colormark-darktext.png",width=250)

st.sidebar.header("input")
user_name = st.sidebar.text_input("What is your name?")
user_emojo = st.sidebar.selectbox('Choose emoji', ['AA','BB','CC','DD','EE','FF','GG'])
user_food = st.sidebar.selectbox('Your favorite food?', ['', 'steak','corndog','hamburger','noodle','pizza'])

st.header("print")

col1, col2, col3 = st.columns(3)

with col1:
  if user_name != '':
    st.write(f' hi!! {user_name}!')
  else:
    st.write('plz input your **name** !!')

with col2:
  if user_emojo != '':
    st.write(f' your emoji is {user_emojo}!')
  else:
    st.write('plz choose your **emoji** !!')

with col1:
  if user_food != '':
    st.write(f' your favorite food is {user_food}!')
  else:
    st.write('plz choose your **food** !!')
