def solution(s):
    answer = []
    dict1 = {}
    for i, letter in enumerate(s):
        if letter not in dict1:
            answer.append(-1)
            dict1[letter] = i
        else:
            answer.append(i - dict1[letter])
            dict1[letter] = i
            
    return answer