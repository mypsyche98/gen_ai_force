import streamlit as st
import requests

st.title("Bored API 앱")

st.sidebar.header("입력")
selected_type = st.sidebar.selectbox('활동유형선택', ['education','recreational','social','diy','charity','cooking','relaxation','music','busywork'])

suggested_activity_url = f"http://bored.api.lewagon.com/api/activity?type={selected_type}"
json_data = requests.get(suggested_activity_url)
suggested_activity = json_data.json()

c1, c2 = st.columns(2)
with c1:
  with st.expander("이 앱에 대하여"):
    st.write("지루하신가요? **Bored API 앱**은 지루할 때 할 수 있는 활동을 제안합니다. 이 앱은 Bored API에 의해 구동됩니다.")
with c2:
  with st.expander("JSON 데이터"):
    st.write(suggested_activity)

st.header("제안된 활동")
st.info(suggested_activity['activity'])

col1, col2, col3 = st.columns(3)
with col1:
  st.metric(label="참가자 수",value=suggested_activity['participants'],delta='')
with col2:
  st.metric(label="활동 유형",value=suggested_activity['type'],delta='')
with col3:
  st.metric(label="가격",value=suggested_activity['price'],delta='')
