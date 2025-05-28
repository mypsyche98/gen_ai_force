# Pandas DataFrame : 2025년 05월 28일 실습
-----
## 07. 정렬
* 값기준 정렬 : DataFrame.sort_values(by, axis=0, ascending=True, inplace=False, kind='quicksort', na_position='last', ignore_index=False, key=None)
  * inplace : 원본대체여부 False(df)/True
  * kind : 정렬알고리즘 - quicksort(df)/mergesort/heapsort/stable
* 인덱스기준 정렬 : DataFrame.sort_index(axis=0, level=None, ascending=True, inplace=False, kind='quicksort', na_position='last', sort_remaining=True, ignore_index=False, key=None)
  * sort_remaining : multi index의 경우 다른 레벨에 대해서도 정렬할지 여부 False(df)/True
* 정렬후추출
  * DataFrame.nlargest(n, columns, keep='first')
  * DataFrame.nsmallest(n, columns, keep='first')
-----
## 08. 결합 : 두 데이터프레임의 결합
* combine : DataFrame.combine(other, func, fill_value=None, overwrite=True) - 함수를 이용한 열 단위 결합
* combine_first : DataFrame.combine_first(other) - 다른 객체로 결측치 덮어쓰기
* join : DataFrame.join(other, on=None, how='left', lsuffix='', rsuffix='', sort=False) - 인덱스기준 병합
* merge : DataFrame.merge(right, how='inner', on=None, left_on=None, right_on=None, left_index=False, right_index=False, sort=False, suffixes=('_x', '_y'), copy=True, indicator=False, validate=None) - join과 비슷하지만 세부설정이 가능, 인덱스-열 기준 병합가능
  * indicator : True로 할경우 병합이 완료된 객체에 추가로 열을 하나 생성하여 병합 정보를 출력합니다.
  * validator : {'1:1' / '1:m' / 'm:1' / 'm:m'} 병합 방식에 맞는지 확인할 수 있습니다. 만약 validate에 입력한 병합방식과, 실제 병합 방식이 다를경우 오류가 발생됩니다.
  * how='cross' : 행렬곱
* align : DataFrame.align(other, join='outer', axis=None, level=None, copy=True, fill_value=None, method=None, limit=None, fill_axis=0, broadcast_axis=None) - 병하측의 결측제어
* update : DataFrame.update(other, join='left', overwrite=True, filter_func=None, errors='ignore') - 동일한 열의 값으로 update
