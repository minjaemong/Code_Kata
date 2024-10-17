def solution(left, right):
    sum = 0
    for i in range(left, right + 1):
        if (i ** 0.5) % 1 == 0:
            sum -= i
        else:
            sum += i
    return sum