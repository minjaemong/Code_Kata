def solution(sizes):
    max_size = [0, 0]
    for size in sizes:
        size = sorted(size)
        if size[0] > max_size[0]:
            max_size[0] = size[0]
        if size[1] > max_size[1]:
            max_size[1] = size[1]
    return max_size[0] * max_size[1]