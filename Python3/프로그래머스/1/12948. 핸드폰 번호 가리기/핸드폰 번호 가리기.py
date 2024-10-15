def solution(phone_number):
    answer = '*' * (len(phone_number) - 4)
    for i in range(-4, 0):
        answer += phone_number[i]
    return answer