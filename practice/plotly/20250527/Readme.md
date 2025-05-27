# Plotly Tutorial - 파이썬 시각화의 끝판왕 마스터하기 - 실습 결과
-----
## 06. Basic Chart
### 06-01 Scatter Chart : 산점도
* mode
  * markers : 점
  * lines : 선
  * markers+lines : 점+선
* 다양한 심볼 사용가능
```
import plotly.graph_objects as go
from plotly.validators.scatter.marker import SymbolValidator

raw_symbols = SymbolValidator().values
namestems = []
namevariants = []
symbols = []
for i in range(0,len(raw_symbols),3):
    name = raw_symbols[i+2]
    symbols.append(raw_symbols[i])
    namestems.append(name.replace("-open", "").replace("-dot", ""))
    namevariants.append(name[len(namestems[-1]):])

fig = go.Figure(go.Scatter(mode="markers", x=namevariants, y=namestems, marker_symbol=symbols,
                           marker_line_color="midnightblue", marker_color="lightskyblue",
                           marker_line_width=2, marker_size=15,
                           hovertemplate="name: %{y}%{x}<br>number: %{marker.symbol}<extra></extra>"))
fig.update_layout(title="Mouse over symbols for name & number!",
                  xaxis_range=[-1,4], yaxis_range=[len(set(namestems)),-1],
                  margin=dict(b=0,r=0), xaxis_side="top", height=1400, width=400)
fig.show()
```
* facet_col / facet_row 를 이용하여 그래프를 분리하여 생성가능
### 06-02 Line Plot : 꺾은선 그래프
* mode
  * markers : 점
  * lines : 선
  * markers+lines : 점+선
* facet_col / facet_row 를 이용하여 그래프를 분리하여 생성가능
* interpolation : 보간 - 점과점 사이를 선으로 표현하는 방법
  * linear : 점과 점 사이를 직선으로 연결합니다.
  * spline : 점과 점 사이를 곡선으로 연결합니다.
  * vhv : 점과 점 사이를 두 점의 평균선으로 연결합니다.
  * hvh : 가장 가까운 점의 값으로 선을 연결합니다.
  * vh : 다음 점의 위치로 선을 연결합니다.
  * hv : 이전 선의 위치로 선을 연결합니다
### 06-03 Bar Plot : 막대 그래프
* orientation을 이용하여 수평으로 변경 가능 : v(df), h
* barmode를 이용하여 쌓아올리거나 별도의 막대로 표시 가능 : group(분리)
* text_auto=True : 막대위에 텍스트 삽입 => 다양한 스타일로 가공가능
* pattern_shape : 막대 내부에 다양한 패턴 입력가능
* facet_col / facet_row 를 이용하여 그래프를 분리하여 생성가능
* 막대의 색, 너비, 간격 조정가능
### 06-04 Pie Chart : 원형 그래프
* holes : 중간 구멍 크기 조절
* pull : 조각을 분리하여 띄우기
* 파이에 다양한 텍스트와 스타일 지정가능
### 06-05 Gantt Chart
* 시계열 데이터(ISO date, pandas(date/datetime))를 기반으로 생성됨
* color : 컬러맵으로 표현 가능
### 06-06 Table
* header와 cells 영역으로 데이터가 분리되어 있음
* 테이블과 셀의 높이,너비,색상,크기를 다양한 스타일로 조절 가능
* pandas.read_csv() 를 이용하여 원격지 files를 DataFrame으로 로딩가능 => header와 column별 데이터를 별도로 처리해야함
* plotly.figure_factory.create_table(DataFrame) 을 이용하여 자동화 가능
-----
## 07. Statistic Chart
### 07-01 Box Plot : 상자수염, 봉, 캔들등 이름이 다양함, 데이터의 통계학적 의미를 표연할때 자주사용됨
![image](https://github.com/user-attachments/assets/57e13967-d9e7-4be8-8562-429ba4bfa22f)
* points : 소스 데이터를 점으로 함께 표시
* quartilemethod : 사분위수 계산 방법 변경 : https://jse.amstat.org/v14n3/langford.html
  * linear
  * exclusive
  * inclusive
* notched : 노치표시
* input을 x만 변경하면 가로로 생성 가능
### 07-02 Histogram : 순서형/수치형 자료를 이용한 도수분포표 그래프
* nbins : Bin의 사이즈를 설정 => 영역을 몇등분 할것인지를 설정, 적절한 수치를 찾는것이 중요
* histfunc : 데이터 가공
  * count : y값의 개수 (df)
  * avg : y값의 평균
  * sum : 합
  * max : 최대값
  * min : 최소값
* normalization : 설정하지 않으면 count로 표시됨
  * percent
  * probability
  * density
  * probability density
* barmode
  * overlay : 겹쳐노출
  * stack : 위로 쌓기
* 입력값을 x에서 y로 변경하면 가로형태
* bargap : 바사이 간격
* 다양한 스타일 적용 가능
### 07-03 Violin Plot : 항아리 그래프 - 일변량, 연속형 데이터 분포
* points : 소스 데이터를 점으로 함께 표시
  * all : 모두표시
  * outliers : 바깥을 벗어난 값만 표시
  * suspectedoutliers : 벗어난 값중 일부만 하일라이트
  * False : X
* violinmode='overlay' : 겹처그리지
* box=True : 내부에 박스플롯 표시
* side : 반만표시 - positive(오른쪽만), negative(왼쪽만) => 별도의 데이터를 각자 반반하여 결합하여 표시 가능
* x로 입력데이터를 넣으면 가로모드
### 07-04 선형/비선형추세선 그래프 : statsmodels 패키지 필요함
* 데이터별로 추세선 생성가능 => trendline_scope="overall" 전체로 표현할때
* 추세선에 대한 데이터를 결과테이블로 조회가능
```
results = px.get_trendline_results(fig)
results.px_fit_results.iloc[0].summary()
```
* trendline_options=dict(log_x=True) : 추세선 데이터에 로그함수 적용가능
* trendline
  * ols
  * moving average
  * lowess : local regression / local polynomial regression
* trendline_options=dict(frac=0.1) : 추세선의 smoothing을 조정함 df:0.666
* trendline_options=dict(window=5) : 기본이동평균선
### 07-05 주변확율분포 그래프 : main plot 위 또는 오른쪽에 있는 1차원의 그래프로 데이터의 분포를 보여줌
* 종류 : histogram / rug / box / violin
* Scatter : marginal_x / marginal_y
* Histogram : marginal
* color 구분하여 다수개 표현 가능
* Facet으로 분리된 그래프 가능
-----
## 08. Scientific Chart
### 08-01 Contour Plot : 등치선 또는 등고선 그래프, 차원 데이터를 2차원 공간산에 분포하는 동일한 값을 가지는 인접한 지점을 연속적으로 이어 구성한 선
* colormap 변경가능 : https://wikidocs.net/186283
* z값의 최대/최소값과 간격 지정가능 : contours_start / contours_end / contours_size
* connectgaps=True : 결측치 자동 메우기
### 08-02 Heatmap : 2차원 평면 위애 색을 활용하여 다양한 정보를 표현
* 종류
  * Matrix Heatmap : 2차원 행렬 또는 배열데이터를 직접 받아서 시각화 하는 방법 ex) 이미지 데이터
  * Density Heatmap : 데이터를 목록으로 받아들이고 데이터의 개수 또는 합계와 같은 집계된 수량을 시각화 하는 방법 ex) 데이터 밀도확인
* nbinsx / nbinsy : 축분할 개수를 변경
* z 값을 추가하여 histfunc (count/avg/min/max/sum) 계산 가능
* marginal_x / marginal_y : 주변확율분포표시
### 08-03 Radar Chart : Spider Plot 또는 Star Plot 이라고도 불리며 한국말로는 방사형 차트 
* 인수명
  * r = 정량값 리스트
  * theta = 축 레이블
  * line_close = True
* color로 여러개 겹치기 가능
* 컬러맵 사용가능
