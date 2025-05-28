import streamlit as st

st.title('st.form')

st.header("1. 'with' 표기법 사용 예시")
st.subheader("커피 머신")

with st.form("my_form"):
  st.subheader("**커피 주문하기**")

  coffee_bean_val = st.selectbox("커피콩", ["아라비카","로부스타"])
  coffee_roast_val = st.selectbox("로스팅", ["라이트","미디엄","다크"])
  brewing_val = st.selectbox("추출", ["에어로프레스", "드립", "프렌치프레스", "모카포드", "사이폰"])
  serving_type_val = st.selectbox("서빙", ["핫", "아이스", "프레페"])
  milk_val = st.selectbox("우유", ["없음", "낮음", "중간", "높음"])
  owncup_val = st.checkbox("자신의 컵 가져오기")

  submitted = st.form_submit_button("주문")

if submitted:
  st.markdown(f'''
              주문하신내용:
              - 커피콩 : `{coffee_bean_val}`
              - 로스팅 : `{coffee_roast_val}`
              - 추출 : `{brewing_val}`
              - 서빙 : `{serving_type_val}`
              - 우유 : `{milk_val}`
              - 자신의 컵 : `{owncup_val}`
            ''')
else:
  st.write('주문하세요')

st.header("2. 객체표기법예시")

form = st.form("my_form_2")
selected_val = form.slider("값 선택")
form.form_submit_button("확인")

st.write("selected value:", selected_val)
