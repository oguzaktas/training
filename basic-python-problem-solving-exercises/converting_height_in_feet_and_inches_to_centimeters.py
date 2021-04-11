def lengthOfLastWord(s: str) -> int:
    l = s.split(" ")
    if len(l) == 0:
        return 0
    else:
        if l[len(l) - 1] != "":
            return len(l[len(l) - 1])
        else:
            return len(l[len(l) - 2])

s = "a "
print(lengthOfLastWord(s))