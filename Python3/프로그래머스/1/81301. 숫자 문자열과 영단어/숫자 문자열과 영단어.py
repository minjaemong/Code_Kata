def solution(s):
    english = {'zero': '0', 'one': '1', 'two': '2', 'three': '3', 'four': '4', 'five': '5', 'six': '6', 'seven': '7', 'eight': '8', 'nine': '9'}
    answer = ''
    eng_temp = ''
    for letter in s:
        if letter.isdigit():
            answer += str(letter)
        else:
            eng_temp += letter
            if eng_temp in english:
                answer += english[eng_temp]
                eng_temp = ''
    return int(answer)