# Pandas DataFrame - 2025년 05월 30일 학습내용
------
## 09.가공
* 열삽입 : DataFrame.insert(loc, column, value, allow_duplicates=False)
  * allow_duplicates : 이미 열이 존재하면 ValueError 발생
* 열꺼내기 : DataFrame.pop(item) => 원본에서 제거됨
* (전체)복사 : DataFrame.copy(deep=True)
  * deep=True : 완전 별개의 복사본
  * deep=False : shallow, 원본의 링크
* 행/열삭제 : DataFrame.drop(labels=None, axis=0, index=None, columns=None, level=None, inplace=False, errors='raise') => 원본유지
* 행추가 : DataFrame.append(other, ignore_index=False, verify_integrity=False, sort=False)
  * pandas.concat(objs, *, axis=0, join='outer', ignore_index=False, keys=None, levels=None, names=None, verify_integrity=False, sort=False, copy=None)으로 변경됨 !!!
  * https://pandas.pydata.org/docs/reference/api/pandas.concat.html
* 자르기 : DataFrame.truncate(before=None, after=None, axis=None, copy=True)
* 중복행제거 : DataFrame.drop_duplicates(subset=None, keep='first', inplace=False, ignore_index=False)
* 차원축소 : DataFrame.squeeze(axis=None)
* 피벗변환 : DataFrame.pivot(index=None, columns=None, values=None)
  * 중복값이 있으면 ValueError: Index contains duplicate entries, cannot reshape
* 피벗생성(테이블기반) : DataFrame.pivot_table(values=None, index=None, columns=None, aggfunc='mean', fill_value=None, margins=False, dropna=True, margins_name='All', observed=False, sort=True)
* 피벗해제 : DataFrame.melt(id_vars=None, value_vars=None, var_name=None, value_name='value', col_level=None, ignore_index=True)
* 새열할당 : DataFrame.assign(kwargs)
* 값변경 : DataFrame.replace(to_replace=None, value=None, inplace=False, limit=None, regex=False, method='pad')
* 리스트형태의 값전개 : DataFrame.explode(column, ignore_index=False)
-------
## 10.정보
* DataFrame.index
* DataFrame.columns
* DataFrame.dtypes
* DataFrame.axes
* DataFrame.ndim : 차원(축의수)를 반환
* DataFrame.size
* DataFrame.shape
* DataFrame.keys() : 정보축에 대한 데이터 => DataFrame.keys는 객체를 리턴함
* DataFrame.get(key, default=None) : 요소값 반환
* DataFrame.compare(other, align_axis=1, keep_shape=False, keep_equal=False)
* DataFrame.value_counts(subset=None, normalize=False, sort=True, ascending=False, dropna=True) : 고유한 행의수
* DataFrame.nunique(axis=0, dropna=True) : 고유한 요소의 수
------
## 11.데이터타입
* DataFrame.astype(dtype, copy=True, errors='raise') : dtype의 변경
* DataFrame.convert_dtypes(infer_objects=True, convert_string=True, convert_integer=True, convert_boolean=True, convert_floating=True) : 열의 dtype통일
* DataFrame.infer_objects() : 열의 적절 dtype 추론
