def solution(s):
    split = s.split(' ')
    answer = []
    for word in split:
        tmp = ''
        for i, letter in enumerate(word):
            if i % 2 == 0:
                tmp += letter.upper()
            else:
                tmp += letter.lower()
        answer.append(tmp)
    answer = ' '.join(answer)
    return answer