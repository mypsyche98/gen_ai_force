# 한 눈에 읽는 파이썬3 기초 - 20250518 연습코드

## 함수 : 특정 기능을 실행하는 단위
* 형태 : input(argument/parameter) => process(내부코드) => output(return/yield)
* 함수의 정의
  ```
  def 함수이름(매개변수1, ... ,매개변수n) :
    실행구문
    ...
    return 반환인자
  ```
* 함수의 호출
  ```
  함수이름(전달인1, ... , 전달인자n)
  ```
* 함수의 형태
  * 매개변수 X / 반환값 X => func1(): pass
  * 매개변수 O / 반환값 X => func2(a): print(a)
  * 매개변수 X / 반환값 O => func3(): return "None"
  * 매개변수 O / 반환값 O => func4(b): return b*b
* 매개변수를 지정해서 전달가능
  ```
  def subNums(a,b):
    return a-b
  
  num = 3
  print(subNums(b=20, a=num))
  ```
* 가변인자
  * \* \+ 변수명으로 선언 => ex) def funcx(x, y, *args):
  ```
  def subNums(*t):
    print(t, type(t))
    total = 0
  
    for i in t:
      total += i
  
    return total
  
  print(subNums(1,5,32,3,4,57,5))
  print(subNums(5,29))
  ```
  * 매개변수는 가변인자 앞에 선언해야함
* 키워드 매개변수
  * \*\* \+ 변수명으로 선언 => ex) def funcx(x, y, *args, **kwargs):
  * key:value 형태로 인자를 전달해야하며 key에는 문자열(ex:"aaa":"bbb") 형태는 불가능함 => 변수명으로 사용되기 때문
  * 매개변수 순서 : def func(일반1, ... 일반n, 가변인자, 키워드매개변수)
  ```
  def func(*nums, **kwargs):
    print(nums)
    print(kwargs)
  
  num = 10
  func(1,3,5,7, 사과="apple", a=num, num=4)
  ```
* 반환값
  * 파이썬은 타입지정 언어가 아니므로 반환값에 어떤 값도 사용할 수 있음
  * 배열도 사용가능 => return [a,b,c,e]
  * 반환값이 여러개인 경우 자동으로 튜플로 변환함
  ```
  def calculator(a,b):
    sum = a+b
    sub = a-b
    mul = a*b
    div = a/b
    return sum, sub, mul, div
  
  reslist = calculator(10,2)
  print(reslist, type(reslist)) # (12, 8, 20, 5.0) <class 'tuple'>
  ```  
* 전역변수와 지역변수 : 메모리에 존재하는 시간이 다르다
  * 전역변수 : 코드 전체에서 사용할 수 있는 변수
  * 지역변수  :정해진 영역에서만 사용 가능한 변수
  ```
  num = 3 #전역 변수 num 선언
  globallist = [] #전역 변수 globallist 선언
  
  def mulNum(a) : #지역 변수 a 선언
      a = a * num
      globallist.append(3)
      return a #a 소멸
  
  def subNum(a) : #지역 변수 a 선언
      a = a - num
      print(a) #a 소멸
  
  res = mulNum(4) #전역 변수 res 선언
  print(res)
  
  subNum(7)
  print(num)
  print(globallist) #프로그램 종료, 전역 변수 num, res, globallist 소멸
  ```
  * 변수 접근 조건

  |기능|전역변수|지역변수|
  |:---|:---:|---:|
  |함수내에서 읽기/수정|가능|가능|
  |함수내에서 '='|\"**global**\"사용이외불가능|가능|
  |합수밖에서 읽기/수정|가능|불가능|
  |함수밖에서 '='|가능|불가능|

----

## 파일 읽기/쓰기
* 파일 열기/생성
  * 파일을 열면서 열기모드 지정 => 파일객체이름 = open("파일경로/파일이름", "파일열기모드")
    * r = 읽기모드
    * w = 쓰기모드 - 내용을 새로작성하는 경우
    * a = 추가모드 - 마지막 부분에 내용을 추가하는 경우
  * 파일 사용이 완료되었다면 반드시 닫아야함 => 파일객체이름.close()
* 파일읽기 함수 종류
  * readline() : 한줄씩 읽고 문자열 반환
  * readlines() : 모든줄을 읽고 각줄을 리스트로 반환
  * read() : 모든 문자열을 읽고 반환
* 파일쓰기 함수 종류
  * write() : 이용해서 파일쓰기 => 문자열만 가능
 
----

## 클래스 - 객체지향(OOP)
* Object(Class)와 Instance
  * Object는 설계된 객체 틀 : 붕어빵틀
  ```
  붕어빵틀 : 
   속재료, 밀가루반죽
   구운시간
   기능 붕어빵굽기 :
     속재료, 밀가루반죽, 구운시간을 가지고 만들기
     return 만들어진붕어빵
  ```
  * Instance는 설계된 Object로 생성된 개체 : 붕어빵
* Object와 Class변수
  * Object는 Class를 선언하기 위한 기본구조
  * Class 변수는 같은 클래스로 만들어진 인스턴스끼리 공유하고 접근 가능한 변수
    * 접근은 클래스명.변수명
    * 하지만 변수값 자체는 개별 인스턴스 별도로 관리됨
  ```
  class Triangle:
    height = 10
    bottom = 4
  
  tri1 = Triangle()
  print(tri1.height, tri1.bottom)
  
  tri2 = Triangle()
  print(tri2.height, tri2.bottom)
  
  tri1.height = 8 # tri1만 영향을 받음
  print(tri1.height, tri1.bottom)
  
  print(tri2.height, tri2.bottom)
  ```
* 인스턴스 변수와 메소드
  * 메소드 : 클래스 안에서 특정 기능을 수행하는 함수 / 자신을 위한 self 매개변수 사용
  * 변수 : self.변수이름 형태로 사용하는 변수
  ```
  class Triangle:
    def setData(self, b, h):
      self.b = b
      self.h = h
  
    def area(self) : # def area(): 불가능
      return self.b * self.h / 2
  
  tri1 = Triangle()
  tri1.setData(4,5) # self는 사용자가 입력하는 값이 아님
  
  tri2 = Triangle()
  tri2.setData(6,10)
  
  print(tri1.b, tri1.h, tri1.area())
  print(tri2.b, tri2.h, tri2.area())
  ```
* 클래스변수와 인스턴스변수의 비교
  ```
  class Triangle:
    cal_count = 0
    
    def __init__(self, b, h = 5):
      self.b = b
      self.h = h
  
    def area(self) : 
      Triangle.cal_count += 1 # Triangle을 생략하면 오류 #UnboundLocalError: cannot access local variable 'cal_count' where it is not associated with a value
      return self.b * self.h / 2
  
  tri1 = Triangle(4)
  tri2 = Triangle(6, 10)
  
  print(tri1.b, tri1.h, tri1.area(), tri1.cal_count)
  print(tri2.b, tri2.h, tri2.area(), tri2.cal_count)
  print(Triangle.cal_count)
  ```
  * 클래스변수 : 동일한 클래스의 다른 인스턴스와 공유되는 변수
  * 인스턴스변수 : 생성된 인스턴스 만의 고유 변수
* 생성자과 메소드
  * 생성자 : 객체를 생성할 때 자동호출 __init__ => 함수 > 메소드 > 생성자
* 메소드 종류
  * 정적메소드 : self 매개변수를 갖이 않은 메소드 / @staticmethod
  * 인스턴스메소드 : self 필요ㅕ
  * 클래스메소드 : 클래스변수에 접근할때 사용되면 cls로 전달받음 / @classmethod
* 클래스 상속
  * A클래스는 B클래스를 상속할 수 있음
    * 이런경우 B를 부모클래스, A를 자식클래스라고 함
    * 자식클래스는 부모클래스의 특성을 상속받음
  * class A클래스(B클래스) 형식으로 선언
* 접근범위
  * 클래스 메소드의 클래스 변수 접근 범위
    * 부모클래스는 자식클래스를 포함하지만 자식클래스 메소드에 접근 불가
    * 자식클래스는 부모클래스 메소드에 접근가능
  * 인스턴스의 메소드 접근 범위
  * 같은 이름으로 자식 클래스에서 재정의한 메소드 : Method Overriding
* 클래스 심화 개념
  * 다중상속 : class 자식클래스(부모클래스A, 부모클래스B)  형태로 정의
  * 파이썬은 MRO(Method Resolution Order)에 따라 다중 상속을 처리
    * 선언된 부모클래스 왼쪽에서 오른쪽 순서로 메소드를 탐색함
    * 클래스의 변수이름이 동일하다면 왼쪽에 있는 클래스 변수에 접근함
  * Overloading 지원하지 않음 : 동일한 클래스에서 같은 이름의 메소드를 여러개 선언하는것, 동일한 이름이 있으면 마지막 메소드가 실행됨
    

