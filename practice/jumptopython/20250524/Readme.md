# 점프투파이썬 2025년 05월 24일 현습

## Iterator
* next함수 호출시 그 다음 값을 데이터가 끝날때까지 리턴하는 객체(1순환만)
* __next__, __iter__ 함수 구현 필요
----
## Generator
* Iterator를 생성해주는 함수
* return 대신 yield 사용
* () 로도 간단하게 generator 사용가능
```
gen = (i * i for i in range(1, 1000))
```
----
## Python Type Annotation
* Python은 Dynamic Programming Language
* 3.5 부터 Type Annotation 사용가능 => 하지만 강제가 아닌 힌트임
```
num:int = 1

def add(a:int, b:int) -> int:
  return a+b

print(type(num))

print(add(1,2))
print(add("a","b")) # 정상처리됨
```
* 타입을 강제하고 싶으면 mypy 모듈 설치후 사용

-------

## Regular Expression
* 복잡한 문자열을 처리할 때 사용하는 기법의 형식 언어
* 메타문자 사용
  ```
  . ^ $ * + ? { } [ ] \ | ( )
  ```
  *  \[ \] 문자 : 문자클래스, \[ \] 사이에는 어떠한 문자도 들어갈 수 있음, '-'을 이용하여 범위 표현 가능
  ```
  [a-zA-Z] # 모든알파벳
  [0-9] # 모든숫자
  [abc] # a, b, c 가능
  ```
    * \d : 숫자 == [0-9]
    * \D : 숫자아님 == [^0-9]
    * \s : 공백문자 == [ \t\n\r\f\v]
    * \S : not \s
    * \w : 문자+숫자(alphanumeric) == [a-zA-Z0-9_] (하이픈포함)
    * \W : not \w
    * \\\\ : \ 표시
    * raw string : re.compile('\\\\section') == re.compile(r'\\section')
  * . 문자 : \n을 제외한 모든 문자, re.DOTALL옵션사용시 \n도 매치됨
  ```
  a.b   # a + 모든문자 + b
  a[.]b   # a + . + b
  ```
  * \* 문자 : 바로앞의 문자가 0~infini 반복 가능
  * \+ 문자 : 바로앞의 문자가 1~infini 반복 가능
  ```
  # {m,n} 를 사용하면 반복회수 고정가능
  {1,} == +
  {0,} == *

  # {m} 형식
  ca{2}t    # c + a를 반드시 2번 반복 + t
  # {m,n} 형식
  ca{2,5}t   # c + a를 2~5회반복 + t
  ```
  * ? 문자 : 0 or 1개의 문자 == {0,1}
  ```
  ab?c    # a + b가 0~1개 + c
  ```
* re 모듈 사용
  * re.compile() : Pattern 생성
  * p.match() : 처음부터 매치되는지 조사 - start with
  * p.search() : 전체를 검색하여 매치되는지 조사
  * p.findall() : 매치되는 모든 문자열을 리스트로 리턴
  * p.finditer() : 매치되는 모든 문자열을 iterable 객체로 리턴
* Match method()
  * group() : 매치된 문자열 리턴
  * start() : 매치된 문자열의 시작위치
  * end() : 매치된 문자열의 끝위치
  * span() : 매치된 문자열의 (시작,끝)튜플 리턴
* Compile Options
  * DOTALL(S) : . 이 줄바꿈 문자를 포함해서 모든 문자와 매치될 수 있도록
  * IGNORECASE(I) : 대소문자 무시
  * MULTILINE(M) : 여러줄과 매치가능하게 ^, $ 메타 문자와 사용
  * VERBOSE(X) : verbose 모드
* 문자열 소비가 없는 메타 문자
  * | : or
  * ^ : 문자열의 맨처음(여러줄의 경우에도 각줄의 처음)
  * $ : 문자열의 맨마지막
  * \A : 문자열의 처음, 여러줄이라도 상관없음
  * \Z : 문자열의 마지막,
  * \b : word boundary(일반적으로 화이트스페이스)
  * \B : not \b
* ( ) : Grouping, 반복되는 문자열 검색
  * m.group(n) : n번째 그룹의 문자열
  * \n : 그룹index로 재참조
  * ?P<name> : 그룹에 이름 지정, 재참조도 가능 => (?P=name)
* Lookahead Assertions : 전방탐색 확장구문
  * Positive : (?=...) : ...에 해당하는 정규식과 매치되어야 하며 조건이 통과되어도 문자열이 소비되지 않음
  ```
  p = re.compile('.+(?=:)')
  m = p.search("http://google.com")
  print(m.group())     # http
  ```
  * Negative : (?!...) : ...에 해당하는 정규식과 매치되지 않아야하면 조건이 통과되어도 문자열이 소비되지 않음
  ```
  .*[.](?!bat$).*$    # 확장자 bat 제외
  .*[.](?!bat$|exe$).*$    # 확장자 bat, exe 제외
  ```
* sub : 문자열바꾸기, 첫번째 인자의 값으로 매치되는 문자열과 치환
```
p = re.compile('(blue|white|red)')
print(p.sub('colour', 'blue socks and red shoes'))   # colour socks and colour shoes
```
  * sub 사용시 참조 구문 사용하기
  ```
  p = re.compile(r"(?P<name>\w+)\s+(?P<phone>(\d+)[-]\d+[-]\d+)")
  print(p.sub("\g<phone> \g<name>", "park 010-1234-1234"))
  ```
  * sub 사용시 매개변수를 함수로 넣기
    ```
  def hexrepl(match):
    value = int(match.group())
    return hex(value)
  
  p = re.compile(r'\d+')
  print(p.sub(hexrepl, 'Call 64590 for printing, 49152 for user code.')) # Call 0xfc4e for printing, 0xc000 for user code.
  ```
* subn : 기능은 sub와 동일, return은 튜플
```
p = re.compile('(blue|white|red)')
print(p.sub('colour', 'blue socks and red shoes'))   # ('colour socks and colour shoes', 2)
```
* greedy 와 non-greedy
  * 기본적으로 * 는 greedy 가능한 최대의 매치 결과를 검색
  * non-greedy를 위해서는 ? 를 사용
  ```
  s = '<html><head><title>Title</title>'
  print(len(s))
  print(re.match('<.*>', s).span())   # greedy
  print(re.match('<.*>', s).group())  # greedy
  print()
  print(re.match('<.*?>', s).group()) # non-greedy
  ```
  


















