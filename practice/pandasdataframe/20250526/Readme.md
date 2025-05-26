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
