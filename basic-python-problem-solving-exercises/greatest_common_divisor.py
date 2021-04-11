def gcd(x, y):
    if x % y == 0:
        return y
    if y % x == 0:
        return x
    for i in range(int(min(x, y) / 2), 0, -1):
        if max(x, y) % i == 0 and min(x, y) % i == 0:
            return i
    return 1


print(gcd(25, 66))
