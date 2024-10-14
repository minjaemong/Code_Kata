def solution(x):
    lst = list(str(x))
    int_lst = list(map(int, lst))
    if x % sum(int_lst) == 0:
        answer = True
    else:
        answer = False
    return answer