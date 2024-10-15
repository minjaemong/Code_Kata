def solution(absolutes, signs):
    lst = []
    for a, s in zip(absolutes, signs):
        if s == True:
            lst.append(int(a))
        else:
            lst.append(-int(a))
        answer = sum(lst)
    return answer