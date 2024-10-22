def solution(n, m):
    a = n
    b = m
    while b:
        a, b = b, a % b
    gcd = a
    lcm = (n * m) // gcd
    answer = [gcd, lcm]
    return answer