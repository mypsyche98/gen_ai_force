
from mrjob.job import MRJob
from mrjob.step import MRStep
import csv

cols="lastName,middleInitial,firstName,jobClass,agencyName,agencyID,annualSalary,grossPay,hireDate,fiscalYear,ObjectId".split(",")

class salarymax(MRJob):
  def mapper(self, _, line):
    # 각 줄을 딕셔너리로 변환
    # AttributeError: '_csv.reader' object has no attribute 'next'
    #row = dict(zip(cols, [a for a in csv.reader([line])]))

    reader = csv.reader([line])
    values = next(reader)
    row = dict(zip(cols, values))

    #self.stdout.write((f"\n\nRow being processed: {row}\n\n").encode('utf-8'))

    # 급여를 생성합니다
    try:
      yield 'salary', (float(row['annualSalary'][1:]), line)
    except ValueError:
      self.increment_counter('warn','missing salary', 1)
      yield 'salary', 0

    # 총 급여를 생성합니다
    try:
      yield 'gross', (float(row['grossPay'][1:]), line)
    except ValueError:
      self.increment_counter('warn','missing gross', 1)

  def reducer(self, key, values):
    topten = []
    for p in values :
      topten.append(p)
    #topten.sort()
    topten = topten[-100:]
    for p in topten:
      yield key, p

  combiner = reducer

if __name__ == '__main__':
  salarymax.run()
