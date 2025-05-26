# Pandas DataFrame : 2025년 05월 26일 
-------
## Pandas.DataFrame 클래스 구조
* 기본생성자 : class pandas.DataFrame(data=None, index=None, columns=None, dtype=None, copy=None)
  * data : ndarray, Iterable, dict, DataFrame
    * dict : Series, Array, List, etc - 열의 순서는 삽입순서를 따름
  * index : index 또는 배열형태의 객체 - df) 0,1,2,3,...
  * columns : index 또는 배열형태의 객체 - df) 0,1,2,3,...
  * dtype : dtype 데이터 유형 강제 - df) None : 자동추론
  * copy : Bool
    * True : 원본 수정시 다른 인스턴스는 변경 안됨
    * False : 원본 수정시 다른 인스턴스도 같이 변경됨
-----
## 01. 객체 간 연산
* add, radd
  * DataFrame.add(other, axis='columns', level=None, fill_value=None)
  * radd 는 reverse add => df.radd(df2) == df2.add(df)
* sub, rsub
  * DataFrame.sub(other, axis='columns', level=None, fill_value=None) 
* mul, rmul
  * DataFrame.mul(other, axis='columns', level=None, fill_value=None) 
* div, rdiv
  * DataFrame.div(other, axis='columns', level=None, fill_value=None)
* mod, rmod
  * DataFrame.mod(other, axis='columns', level=None, fill_value=None)
* pow, rpow
  * DataFrame.pow(other, axis='columns', level=None, fill_value=None)
* dot : 행렬곱
  * DataFrame.dot(other)
```
     col1 col2                col1 col2                  col1   col2
row1    A    B     x     row1    a    b     =     row1  Aa+Bc  Ab+Bd
row2    C    D           row2    c    d           row2  Ca+Dc  Cb+Dd
```
----
## 02. 객체 내 연산
* round : 반올림
  * DataFrame.round(decimals=0, args, kwargs)
  * decimal
    * == 0 : 일의자리까지 반올림
    * > 0 : 소수 n번쨰 자리까지 반올림
    * < 0 : 10의 n승 자리까지 반올림
* sum : 합계
  * DataFrame.sum(axis=None, skipna=None, level=None, numeric_only=None, min_count=0, kwargs)
  * axis : 0:행/1:열 기준
  * level : Multi index의 경우의 레벨
* prod, product : 곱
  * DataFrame.prod(axis=None, skipna=None, level=None, numeric_only=None, min_count=0, kwargs) 
* abs : 절대값
  * DataFrame.abs( )
  * 복소수의 경우 크기를 출력 : a+bj => sqrt(a**2 + b**2) 
* transpose, T : 전치
  * DataFrame.transpose(args, copy=False)
  * [0,0] ~ [n,m] 의 대각선을 중심으로 데이터를 뒤집기
* rank : 순위
  * DataFrame.rank(axis=0, method='average', numeric_only=None, na_option='keep', ascending=True, pct=False) 
* diff : 차이(이산) - 열과열 / 행과행의 차이를 출력
  * DataFrame.diff(periods=1, axis=0)
* pct_change : 차이(백분율) - 행과행의 차이를 현재값과 백분율로 출력
  * DataFrame.pct_change(periods=1, fill_method='pad', limit=None, freq=None, kwargs)
  * Future Warning
    * DataFrame.diff() => DataFrame.diff(fill_method=None)
    * DataFrame.pct_change(fill_method='bfill') => DataFrame.bfill().pct_change()
    * DataFrame.pct_change(limit=2) => DataFrame.ffill(limit=2).pct_change(fill_method=None)
* expanding : 행/열에 대해서 누적계산, 추가메서드 사용
  * DataFrame.expanding(min_periods=1, center=None, axis=0, method='single')
  * Future Warning
    * df.expanding(axis=1).sum() => df.T.expanding().sum().T
* rolling : 기간이동 계산, 일정크기의 window내의 데이터를 추가메서드를 통해 계산
  * DataFrame.rolling(window, min_periods=None, center=False, win_type=None, on=None, axis=0, closed=None, method='single')
  * Future Warning
    * pd.period_range(start='2022-01-13 00:00:00',end='2022-01-13 02:30:00',freq='30T') => freq='30min'
    * df.rolling(window=3).sum() => df['col1'].rolling(window=3).sum()
  * closed : window=3
    * left : 3 <= x < 6
    * right : 3 < x <= 6
    * both : 3 <= x <= 6
    * neither : 3 < x < 6
  * center : 결과가 위치할 영역
* groupby : 데이터를 그룹화하여 연산을 수행
  * DataFrame.groupby(by=None, axis=0, level=None, as_index=True, sort=True, group_keys=True, squeeze=NoDefault.no_default, observed=False, dropna=True)
  * Future Warning
    * df.groupby('index',group_keys=False).apply(top) => df.groupby('index').apply(top, include_groups=False)
    * df['col1'].groupby(df_cat,observed=True).count() => (df_cat,observed=True) observed 필수
* ewm : 지수가중함수, 오래된 데이터에 지수감쇠를 적용하여 최근 데이터가 더 큰 영향을 끼치도록 가중치를 부여
  * DataFrame.ewm(com=None, span=None, halflife=None, alpha=None, min_periods=0, adjust=True, ignore_na=False, axis=0, times=None, method='single')
  * 평활계수 : alpha / span / com / halflife
------
## 03. 함수 적용
* apply : 전달 객체는 Series형식으로, 행/열 기준으로 함수를 적용함
  * DataFrame.apply(func, axis=0, raw=False, result_type=None, args=(), **kwargs)
* applymap : 객체의 각 요소에 함수를 적용  => DataFrame.map 사용
  * DataFrame.applymap(func, na_action=None, **kwargs)
* map :
  * DataFrame.map(func, na_action=None, **kwargs)
* pipe : 함수내 함수를 연속적으로 적용
  * DataFrame.pipe(func, args, kwargs)
* aggregate, agg : apply와 유사, 여러개의 apply를 동시 수행, 축(행/열)기준
  * DataFrame.agg(func=None, axis=0, args, kwargs)
* transfrom : agg와 유사, 객체의 개별 요소기준
  * DataFrame.transform(func, axis=0, args, kwargs)
* eval : 문자열 형식의 계산식 적용
  * DataFrame.eval(expr, inplace=False, kwargs)


















