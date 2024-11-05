def solution(k, score):
    answer = []
    hall_of_fame = []
    for i, num in enumerate(score):
        hall_of_fame.append(num)
        if len(hall_of_fame) > k:
            hall_of_fame.remove(min(hall_of_fame))
        answer.append(min(hall_of_fame))
    return answer