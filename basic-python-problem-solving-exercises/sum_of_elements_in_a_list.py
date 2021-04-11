num = int(input("How many numbers: "))
list = []

for n in range(num):
    numbers = int(input("Enter a number: "))
    list.append(numbers)

print("Sum of the numbers:", sum(list))
