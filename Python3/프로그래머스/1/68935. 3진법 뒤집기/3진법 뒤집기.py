def solution(n):
    answer = ''
    decimal = 0
    while n > 0:
        answer += str(n % 3)
        n //= 3
    answer = answer[::-1]
    for i in range(len(answer)):
        decimal += int(answer[i]) * (3 ** i)
    return decimal