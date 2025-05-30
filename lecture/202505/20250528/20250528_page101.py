import streamlit as st

st.title("st.query_params")

"""
Please replace st.experimental_get_query_params with st.query_params.

st.experimental_get_query_params will be removed after 2024-04-11.

Refer to our docs page for more information.
"""

with st.expander("이 앱에 관하여"):
  st.write("'st.query_params' 은 사용자 브라우저의 URL에서 직접 쿼리 매개변수를 검색할 수 있게 해줍니다.")

st.header("1.지침")
st.markdown('''
인터넷 브라우저 URL에 다음을 추가해주세요.
`?firstname=Charlie&surname=Kim`
''')

st.header("2. st.query_params 내용")
"""
TypeError: 'QueryParamsProxy' object is not callable
Traceback:
File "/content/20250528_page101.py", line 23, in <module>
    st.write(st.query_params())
             ^^^^^^^^^^^^^^^^^
"""

#st.write(st.query_params.get_all())

st.header("3. URL에서 정보 검색 및 표시")

firstname = st.query_params['firstname']
surname = st.query_params['surname']

st.write(f'안녕하세요 **{firstname} {surname}**, 어떠세요?')
