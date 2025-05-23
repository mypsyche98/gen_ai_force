# 한 눈에 읽는 파이썬3 기초 - 20250517 연습코드

## Tuple -Immutable 리스트형 데이터 구조
* 괄호()로 선언함
  ```
  t1 = ('a','b','c',1,2,3)
  ```
* 괄호 생략도 가능함
  ```
  t1 = 'a','b','c',1,2,3
  ```
* 리스트 내 어떤 값도 가능 (리스트, 딕셔너리, 튜플 등등)
  ```
  s1 = list(set([1,2,3]))
  t4 = ([1,2,3], {"사과":"apple","포도":"grape"}, ('a','b','c'), s1)
  ```
* 튜플 요소가 mutable이면 수정가능
  ```
  t4[3][2] = "edit"
  ```
* 한개의 요소만 초기화할때는 요소뒤에 꼭 콤마 필요
  ```
  t2 = ("hello")
  print(t2, type(t2)) # hello <class 'str'> => 튜플이 아님
  t2 = ("hello",)
  print(t2, type(t2)) # ('hello',) <class 'tuple'>
  ```
* 인덱싱과 슬라이싱, +/* 연산가능

----
## Set - 중복과 순서가 없는 데이터 구조, 단 튜플은 원소로 가능하지만 리스트와 집합자체는 안됨
* 중괄호{}로 선언함
  ```
  s1 = {3,2,5,1,8,4,3}
  print(s1, type(s1)) # <class 'set'>
  ```
* 중복되는 값은 한개만 저장됨
  ```
  s1 = {3,2,5,1,8,4,3}
  print(s1, type(s1))  #{1, 2, 3, 4, 5, 8} <class 'set'>
  ```
* 순서가 없음 => 그러므로 인덱싱이 안됨
  ```
  l = ['a','b','c',"goorm","hello",10,30,30]
  print(l, type(l)) #['a', 'b', 'c', 'goorm', 'hello', 10, 30, 30] <class 'list'>
  
  s1 = set(l)
  print(s1, type(s1)) #{'hello', 'goorm', 'b', 10, 30, 'a', 'c'} <class 'set'>
  ```
* 딕셔너리의 경우 key만 저장됨
  ```
  d = {"Anna":25, "Bob":23}
  print(d, type(d)) #{'Anna': 25, 'Bob': 23} <class 'dict'>
  
  s2 = set(d)
  print(s2, type(s2)) #{'Anna', 'Bob'} <class 'set'>
  ```
* string의 경우 character 단위로 분할됨
  ```
  str = "Hello goorm!!!"
  print(str, type(str))  # {' ', 'l', 'H', 'e', 'g', 'r', 'o', 'm', '!'} <class 'set'>
  ```
* 집합이므로 집합함수 사용가능
  * 교집합 : & or intersection()
  * 합집합 : | or union()
  * 차집합 : - or difference()
* 다양한 연산 함수 사용가능
  * add() : 단일개체 추가 => tuple의 경우 1개로 인식
  * update() : 여러개체 추가 => string경우 character 단위로 분할됨
  * remove() : 단일값 삭제
 
----

## 반복문 - 어떤 기능을 특정 조건 만큼 반복해서 처리하는 코드
* while : 입력조건이 True 인경우 서브루틴을 반복실행함 (변경조건이 없으면 무한루프)
* for : 시작조건,종료조건,변경조건이 True인경우 서브루틴을 반복실행함
* 반복문의 중첩 : 반복문의 서브루틴이 반복문인경우

-----

## 조건문 - 특정 조건이 True/False 인지에 따라서 실행되는 서브루틴이 다른 코드
* if / elif 의 조건이 True 일때만 수행됨
* 맨마지막은 else 또는 elif
* else는 없어도 무방
* 비교연산자
  * and
  * or
  * not
 
-------

## 제어문 - 반복문 처리중 하위 코드를 넘어가거나 반복문을 중단할 필요가 있는 경우에 사용
* break : 반복문을 중단시킬때, 자신을 포함하고 있는 반복문만 종료시킴
* continue : 반복 처리중 이번순서를(하위코드 미실행) 건너뛰는 경우
