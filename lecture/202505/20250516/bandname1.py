import random
color = ['검은','하얀','파란','빨간','노란','녹색','보라']
food = ['소보로','콰삭칩','쭈꾸미','커피','참치','옹심이']

print(color[random.randrange(1,len(color))-1],' ',food[random.randrange(1,len(food))-1])