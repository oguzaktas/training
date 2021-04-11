def lcm(x, y):
    if x > y:
        lcm = x
    else: lcm = y

    while True:
        if lcm % x == 0 and lcm % y == 0:
            return lcm
        else:
            lcm += 1


print(lcm(10, 27))

a = 4.72
print(isinstance(a, complex))
