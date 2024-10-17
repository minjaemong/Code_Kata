def solution(a, b):
    sum = 0
    for i in range(len(a)):
        sum+= int(a[i]) * int(b[i])
    return sum