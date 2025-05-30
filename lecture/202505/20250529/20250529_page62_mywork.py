import streamlit as st

st.title('vimeo-img-app')
st.header('Vimeo 썸네일 이미지 추출기 앱')

with st.expander('이 앱에 대하여'):
  st.write('이 앱은 Vimeo 동영상의 썸네일 이미지를 검색합니다.')

# 이미지 설정
st.sidebar.header('설정')
img_dict = {'Large(640)':'_large', 'Medium(200)':'_medium', 'Small(100)':'_small', 'Standard':''}
selected_img_quality = st.sidebar.selectbox('이미지 품질 선택', ['Large(640)', 'Medium(200)', 'Small(100)', 'Standard'])
img_quality = img_dict[selected_img_quality]

yt_url = st.text_input('Viemo URL 붙여넣기', 'https://vimeo.com/1086974424')

def get_ytid(input_url):
  ytid = input_url.split('/')[-1]
  return ytid

# Vimeo 썸네일 이미지 표시
if yt_url != '':
  ytid = get_ytid(yt_url) # yt or yt_url

  yt_img = f'https://vumbnail.com/{ytid}{img_quality}.jpg'
  st.image(yt_img)
  st.write('Vimeo 동영상 썸네일 이미지 URL: ', yt_img)
else:
  st.write('URL을 입력해 계속하세요 ...')
