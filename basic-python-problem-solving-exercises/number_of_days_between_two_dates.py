from datetime import date

firstDate = date(2019, 2, 2)
secondDate = date(2000, 4, 4)

delta = firstDate - secondDate

print(delta.days)
