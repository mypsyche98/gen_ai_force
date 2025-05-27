# Pandas DataFrame : 2025년 05월 27일
---------
## 04. 인덱싱
* DataFrame.at['행','열'] : 레이블기반 스칼라(at) / loc와 동맇하게 레이블 기반 인덱싱이지만 하나의 스칼라값에 접근
* DataFrame.loc['행','열'] : 레이블기반 데이터(loc)
  * bool 값 사용가능
  * 슬라이싱 가능
* DataFrame.iat['행','열'] : 정수기반 스칼라
* DataFrame.iloc['행','열'] : 정수기반 데이터
  * bool 값 사용가능
  * 슬라이싱 가능
* DataFrame.head(n=5) : 앞에서 n행 인덱싱, n이 양수이면 앞에서, 음수이면 뒤에서
* DataFrame.tail(n=5) : 뒤에서 n행 인덱싱, n이 양수이면 뒤에서, 음수이면 앞에서
* Multi Index 의 경우
  * 하나의 행을 지정하면 단일 index로 리턴
  * 튜플로 지정시 Series로 반환됨 => DataFrame 형태로 return 하려면 [[ ]] 형태로 인덱싱 해야함
  * 튜플를 이용하여 슬라이싱 가능
-----
## 05. 비교 & 필터링
* 비교연산
  * 특징
    * 스칼라 비교가능
    * Series와 비교가능 => 존재하지 않은 레이블이면 레이블이 생성됨
    * axis="column|index" => 열/행 단위로 처리됨
    * DataFrame과 비교가능
    * Multi Index 와 비교시 level 지정필요  
  * 종류
    * 초과 : pandas.DataFrame.gt(other, axis='columns', level=None)
    * 미만 : pandas.DataFrame.lt(other, axis='columns', level=None)
    * 이상 : pandas.DataFrame.ge(other, axis='columns', level=None)
    * 이하 : pandas.DataFrame.le(other, axis='columns', level=None)
    * 같음 : pandas.DataFrame.eq(other, axis='columns', level=None)
    * 다름 : pandas.DataFrame.ne(other, axis='columns', level=None)
* DataFrame.select_dtypes(include=None, exclude=None) : dtype기반 열 선택  
  * include / exclude : 포함/미포함을 선택하역 DataFrame형태로 반환 => 값이 비어있으면 안됨, 'float' 처럼 타입을 스트링으로 지정해야함
* DataFrame.clip(lower=None, upper=None, axis=None, inplace=False, args, kwargs) : 임계값 지정
* DataFrame.filter(items=None, like=None, regex=None, axis=None) : 레이블 필터링
  * 이름 또는 포함된 문자열, 정규식 으로 필터링 가능함
* DataFrame.sample(n=None, frac=None, replace=False, weights=None, random_state=None, axis=None, ignore_index=False) : 샘플추출
----
## 06. 결측제어
* 결측값 확인
  * 종류
    * DataFrame.isna() / .isnull()
    * DataFrame.notna() / .isnotnull()
* DataFrame.dropna(axis=0, how='any', thresh=None, subset=None, inplace=False) : 결측값 제거
* 결측값 없는 인덱스 확인
  * 종류
    * DataFrame.first_valid_index( ) : 메서드의 경우 처음으로 결측치가 아닌값이 나오는 행의 인덱스를 출력합니다.
    * DataFrame.last_valid_index( ) : 메서드의 경우 마지막으로 결측치가 아닌값이 나오는 행의 인덱스를 출력합니다.
* 결측값 변경
  * 종류
    * DataFrame.fillna(value=None, method=None, axis=None, inplace=False, limit=None, downcast=None)
    * DataFrame.bfill() / DataFrame.backfill( )
    * DataFrame.ffill() / DataFrame.pad()
* DataFrame.asof(where, subset=None) : 결측값 없는 마지막 행 반환
