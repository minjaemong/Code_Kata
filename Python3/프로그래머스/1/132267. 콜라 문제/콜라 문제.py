def solution(a, b, n):
    answer = 0
    while n >= a:
        new = (n // a) * b
        n = new + (n % a)
        answer += new
    return answer