def solution(s, n):
    answer = ''
    for char in s:
        if char == ' ':
            answer += ' '
        elif char.islower():
            asc = ord(char) + n
            if asc > 122:
                asc -= 26
            answer += chr(asc)
        elif char.isupper():
            asc = ord(char) + n
            if asc > 90:
                asc -= 26
            answer += chr(asc)

    return answer