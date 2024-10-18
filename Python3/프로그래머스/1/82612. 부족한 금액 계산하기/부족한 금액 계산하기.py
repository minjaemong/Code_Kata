def solution(price, money, count):
    price = sum(price * x for x in range(1, count + 1))
    if price < money:
        return 0
    return price - money