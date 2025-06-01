# 2025년 06월 01일 - Pandas DataFrame 공부
-------------------------
## 12.확인
* DataFrame.idxmax(axis=0, skipna=True) : 최대값이 포함된 행/열
* DataFrame.idxmin(axis=0, skipna=True) : 최소값이 포함된 행/열
* DataFrame.empty : 축이 비어있는지 확인 => '' 또는 NaN 도 데이터 취급됨
* DataFrame.isin(values) : 일치하는 요소 확인
* DataFrame.all(axis=0, bool_only=None, skipna=True, level=None, kwargs) : 축요소의 True/False 확인 - AND
* DataFrame.any(axis=0, bool_only=None, skipna=True, level=None, kwargs) : 축요소의 True/False 확인 - OR
* DataFrame.count(axis=0, level=None, numeric_only=False) : 결측치가 아닌 요소의 수
* DataFrame.equals(other) : 일치여부
* DataFrame.bool() : 1칸 객체의 bool 확인
* DataFrame.duplicated(subset=None, keep='first') : 중복행 확인
------
## 13.축 및 레이블
* DataFrame.swapaxes(axis1, axis2, copy=True) : 행<=>열 교환   => DataFrame.transpose() 사용
* DataFrame.rename(mapper=None, index=None, columns=None, axis=None, copy=True, inplace=False, level=None, errors='ignore')
* DataFrame.rename_axis(mapper=None, index=None, columns=None, axis=None, copy=True, inplace=False)
* DataFrame.set_index(keys, drop=True, append=False, inplace=False, verify_integrity=False) : 열=>인덱스로 설정
* DataFrame.set_axis(labels, axis=0, inplace=False) : 레이블명 변경
* DataFrame.add_prefix(prefix)
* DataFrame.add_suffix(suffix)
* DataFrame.reindex(labels=None, index=None, columns=None, axis=None,method=None, copy=True, level=None, fill_value=nan, limit=None, tolerance=None)
* DataFrame.reindex_like(other, method=None, copy=True, limit=None, tolerance=None)
* DataFrame.reset_index(level=None, drop=False, inplace=False, col_level=0, col_fill='') : 인덱스를 열로 변환
* DataFrame.reorder_levels(order, axis=0) : 멀티인덱스 레벨 변경
------
## 14.통계(기초)
* DataFrame.max(axis=None, skipna=None, level=None, numeric_only=None, kwargs)
* DataFrame.min(axis=None, skipna=None, level=None, numeric_only=None, kwargs)
* DataFrame.mean(axis=None, skipna=None, level=None, numeric_only=None, kwargs) : 평균
* DataFrame.median(axis=None, skipna=None, level=None, numeric_only=None, kwargs) : 중앙값
* DataFrame.mode(axis=0, numeric_only=False, dropna=True) : 최빈값
* DataFrame.std(axis=None, skipna=None, level=None, ddof=1, numeric_only=None, kwargs) : 행/열에 대한 표본표준편차(std) ==> 모표준편차가 아님 ( ddof=0는 자유도가 n이므로 모표준편차로 계산됨 )
  * ddof : 표본표준편차 계산의 분모가 되는 자유도를 지정
  
  $`σ(모표준편차)=\sqrt{{Σ|x - μ |^2}\over{n}}\qquad s(표본표준편차)=\sqrt{{Σ|x - μ |^2}\over{n-ddof}}`$
* DataFrame.var(axis=None, skipna=None, level=None, ddof=1, numeric_only=None, kwargs) : 분산(var)

  $`σ^2(모분산)={{Σ|x - μ |^2}\over{n}}\qquad S^2(불편향분산)={{Σ|x - μ |^2}\over{n-ddof}}`$ 
* ~~DataFrame.mad(axis=None, skipna=None, level=None) : 평균절대편차~~ ==> 없어졌음

  $`m(평균절대편차)={{Σ|x - μ |}\over{n}}`$
* DataFrame.cummax(axis=None, skipna=True, args, kwargs) : 누적최대
* DataFrame.cummin(axis=None, skipna=True, args, kwargs) : 누적최소
* DataFrame.cumsum(axis=None, skipna=True, args, kwargs) : 누적합
* DataFrame.cumprod(axis=None, skipna=True, args, kwargs) : 누적곱
* DataFrame.quantile(q=0.5, axis=0, numeric_only=True, interpolation='linear') : 분위수
-----
## 15.통계(심화)
* DataFrame.cov(min_periods=None, ddof=1) : 공분산, 공분산이란 확률변수가 2가지 일때 얼마나 퍼져있는가를 구하는 방법입니다.
  * 좌표평면상에서 x가 증가할때 y도 증가하는 경향 : 이때 공분산(cov)값은 0보다 크며 양의 상관관계
  * 좌표평면상에서 x가 증가할때 y는 감소하는 경향 : 이때 공분산(cov)값은 0보다 작으며 음의 상관관계
  * 좌표평면상에서 y가 변하여도 x는 변하지 않음 : x와 y가 상관 없는경우 공분산(cov)값은 0
* DataFrame.kurt(axis=None, skipna=None, level=None, numeric_only=None, kwargs) : 첨도, 첨도란 데이터의 확률분포가 얼마나 뾰족한지를 나타내는 통계언어입니다.
* DataFrame.sem(axis=None, skipna=None, level=None, ddof=1, numeric_only=None, kwargs) : 표준 오차는 표본평균들의 표준편차, 추정값인 표본평균들과 참값인 모평균(표본평균의 평균)과의 표준차이, 표본평균의 정밀도를 표현
* DataFrame.skew(axis=None, skipna=None, level=None, numeric_only=None, kwargs) : 왜도, 비대칭도 라고도 하며, 평균에 대해 최빈값이 얼마나 치우쳐져있는지를 나타내는 척도, 우측으로 치우칠수록 음의값, 좌측으로 치우칠수록 양의 값
* DataFrame.corr(method='pearson', min_periods=1) : 각 열간의 강관 계수
* DataFrame.corrwith(other, axis=0, drop=False, method='pearson') : 두 DataFrame객체의 동일한 행/열 간의 상관 계수
------
## 16.시간
* DataFrame.at_time(time, asof=False, axis=None) : 특정시간 필터링
* DataFrame.between_time(start_time, end_time, include_start=True, include_end=True, axis=None) : 특정시간 필터링
  * include_start / include_end 사용안함 => inclusive = both / neighter / left / right
* DataFrame.first(offset) : 처음~특정기간 필터링  => DataFrame.loc() 사용
* DataFrame.last(offset) : 마지막~특정기간 필터링  => DataFrame.loc() 사용
* DataFrame.tz_convert(tz, axis=0, level=None, copy=True) : 타임존변경, 표준시간대가 설정되있지 않으면 타임존 변경시 오류발생
* DataFrame.tz_localize(tz, axis=0, level=None, copy=True, ambiguous='raise', nonexistent='raise') : 표준시간대 설정
* DataFrame.to_timestamp(freq=None, how='start', axis=0, copy=True)
* DataFrame.asfreq(freq, method=None, how=None, normalize=False, fill_value=None) : 인덱스나누기
* DataFrame.resample(rule, axis=0, closed=None, label=None, convention='start', kind=None, loffset=None, base=None, on=None, level=None, origin='start_day', offset=None) : 리샘플링, Datetime Index를 원하는 주기로 나누어주는 메서드, asfreq와 유사 하지만 더 많은 기능과 설정
  ![image](https://github.com/user-attachments/assets/0ba321ba-4eea-40cf-bc18-f7fb8fe4eb76)
* DataFrame.shift(periods=1, freq=None, axis=0, fill_value=NoDefault.no_default) : 시계열 데이터의 데이터나 인덱스를 원하는 기간만큼 쉬프트
* DataFrame.to_period(freq=None, axis=0, copy=True) : DatetimeIndex를 PeriodIndex로 변환
------
## 17.멀티인덱스 
* DataFrame.xs(key, axis=0, level=None, drop_level=True) : 멀티인덱스 객체에 대해서 하위 분류를 출력
* DataFrame.stack(level=- 1, dropna=True) : 열을 피벗하여 하위 인덱스로 변환
* DataFrame.unstack(level=- 1, fill_value=None) : 행을 언피벗하여 하위 열로 변환
* DataFrame.swaplevel(i=- 2, j=- 1, axis=0) : Multi Index (또는 Munti Columns)에서 두 인덱스의 순서를 변경
* DataFrame.droplevel(level, axis=0)
------
## 18.반복
* DataFrame.__iter__()
* DataFrame.items() :열-행/데이터 정보를 튜플 형태의 generator 객체로 반환
* DataFrame.iterrows() : 행-열/데이터 정보를 튜플 형태의 generator 객체로 반환
* DataFrame.itertuples(index=True, name='Pandas') : 인덱스, 열-값 정보를 map오브젝트의 튜플 형태로 반환
------
## 19.형식변환
* DataFrame.to_csv(path_or_buf=None, sep=',', na_rep='', float_format=None, columns=None, header=True, index=True, index_label=None, mode='w', encoding=None, compression='infer', quoting=None, quotechar='"', line_terminator=None, chunksize=None, date_format=None, doublequote=True, escapechar=None, decimal='.', errors='strict', storage_options=None)
* DataFrame.to_excel(excel_writer, sheet_name='Sheet1', na_rep='', float_format=None, columns=None, header=True, index=True, index_label=None, startrow=0, startcol=0, engine=None, merge_cells=True, encoding=None, inf_rep='inf', verbose=True, freeze_panes=None, storage_options=None)
* DataFrame.to_clipboard(excel=True, sep=None, kwargs)
* DataFrame.to_dict(orient='dict', into=)
* DataFrame.to_markdown(buf=None, mode='wt', index=True, storage_options=None, kwargs)
* DataFrame.to_pickle(path, compression='infer', protocol=5, storage_options=None)
* DataFrame.to_html(buf=None, columns=None, col_space=None, header=True, index=True, na_rep='NaN', formatters=None, float_format=None, sparsify=None, index_names=True, justify=None, max_rows=None, max_cols=None, show_dimensions=False, decimal='.', bold_rows=True, classes=None, escape=True, notebook=False, border=None, table_id=None, render_links=False, encoding=None)
* DataFrame.to_string(buf=None, columns=None, col_space=None, header=True, index=True, na_rep='NaN', formatters=None, float_format=None, sparsify=None, index_names=True, justify=None, max_rows=None, max_cols=None, show_dimensions=False, decimal='.', line_width=None, min_rows=None, max_colwidth=None, encoding=None)
* DataFrame.values => DataFrame.to_numpy
* DataFrame.DataFrame.from_dict(data, orient='columns', dtype=None, columns=None)
------
## 20.플로팅
* DataFrame.plot(args, kwargs) : matplotlib 라이브러리를 이용해 dataframe 객체를 시각화
  * DataFrame.plot.[area / bar / barh / line].(x, y, kwargs) : pandas에서 지원하는 matplotlib 메서드 중에서 x축 / y축(값) 에 해당되는 열을 입력하여야 하는 메서드
  * DataFrame.plot.[hexbin / scatter].(x, y, c, kwargs) : pandas에서 지원하는 matplotlib 메서드 중에서 x축 / y축(값) /c (colorbar status) 에 해당되는 열을 입력하여야 하는 메서드
  * DataFrame.plot.[box / hist / pie].(kwargs) : pandas에서 지원하는 matplotlib 메서드 중에서 데이터를 그대로 가져와 플롯
  * DataFrame.plot.[kde / density].(bw_method, ind, kwargs) :  pandas에서 지원하는 matplotlib 메서드 중에서 커널밀도추정(KDE)에 대한 그래프를 반환하는 메서드






















