def solution(s):
    lower = []
    upper = []
    for i in s:
        if i.islower():
            lower.append(i)
        else:
            upper.append(i)
    return ''.join(sorted(lower, reverse=True)) + ''.join(sorted(upper, reverse=True))
