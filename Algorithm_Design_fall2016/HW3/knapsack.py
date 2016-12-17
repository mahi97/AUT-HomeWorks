def promising(i):
    pass


def branchAndBound(index, items, value):
    global n
    if promising(index):
        if index == n:
            print("Items", items)
            print("Value", value)
        else:
            for j in range(n):

                branchAndBound(index + 1)


def showKnapsack():
    pass


n = int(input("Please Enter number of items"))  # number of items
w = []  # wights
p = []  # prices
for i in range(n):
    w.append(int(input("Wight of item no. {0}".format(i))))
    p.append(int(input("Price of item no. {0}".format(i))))

t = []
for i in range(n):
    t.append((w[i], p[i]))

item  = []
value = 0

branchAndBound(-1, item, value)
showKnapsack()