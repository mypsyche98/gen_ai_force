import pandas as pd
import plotly.express as px
import streamlit as st

#자료출처
#https://kosis.kr/statHtml/statHtml.do?sso=ok&returnurl=https%3A%2F%2Fkosis.kr%3A443%2FstatHtml%2FstatHtml.do%3FtblId%3DDT_1B040A3%26orgId%3D101%26
df = pd.read_csv("20250529_korea_population.csv")

fig = px.bar(df, x='데이터', y='행정구역(시군구)별', color='항목', facet_row='시점')
fig.update_layout(height=1000)
#fig.show()

st.set_page_config(layout="wide")
with st.expander("자료의 출처"):
  st.markdown('''
    이 자료는 [KOSIS](https://kosis.kr/statHtml/statHtml.do?sso=ok&returnurl=https%3A%2F%2Fkosis.kr%3A443%2FstatHtml%2FstatHtml.do%3FtblId%3DDT_1B040A3%26orgId%3D101%26)에서 가져온것입니다.
    ''')
st.title("2025년 02~04월 - 월별/지역별/남녀별 인구수도표")

st.write("아래는 Pandas DataFrame을 기반으로 생성된 Plotly 차트입니다.")

st.plotly_chart(fig, use_container_width=True)


