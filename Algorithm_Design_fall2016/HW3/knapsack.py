import random

def branchAndBound(n, t, W, maxP, curW, curP, index, calc):
    global cout
    cout += 1
    if maxP > calc(n, W, t, index) + curP or index >= n:
        return maxP
    if curW + t[index][0] <= W:
        maxP = branchAndBound(n, t, W, max(maxP, curP + t[index][1]), curW + t[index][0], curP + t[index][1], index + 1, calc)

    maxP = branchAndBound(n, t, W, maxP, curW, curP, index + 1, calc)
    return maxP


def calcBound1(n, W, t : list, index):
    totalW = 0
    totalP = 0
    for i in range(index, n, 1):

        totalW += t[i][0]
        totalP += t[i][1]
    return totalP


def calcBound2(n, W, t, index):
    totalW  = 0
    totalP  = 0
    while totalW < W and index < n:
        if t[index][0] <= (W - totalW):
            totalW += t[index][0]
            totalP += t[index][1]
        else:
            totalP += t[index][1] * ((W - totalW)/t[index][0])
            totalW += W - totalW
        index += 1
    return totalP


n = 20
W = 30

w = [random.randint(1, 10)   for _ in range(n)]
p = [random.randint(10, 100) for _ in range(n)]


print("W : ", w, sum(w))
print("P : ", p, sum(p))

t = []
for i in range(n):
    t.append([w[i], p[i]])

t.sort(key=lambda s: s[1] / s[0], reverse=True)
print("T : ",t)

cout = 0
bound = calcBound1(n, W, t, 0)
print("First Bound : ", bound)
print("Best ProFit", branchAndBound(n, t, W, 0, 0, 0, 0, calcBound1))
print("Node That Seen : ", cout)
print("----------------------")
cout = 0
bound = calcBound2(n, W, t, 0)
print("Second Bound : ", bound)
print("Best ProFit", branchAndBound(n, t, W, 0, 0, 0, 0, calcBound2))
print("Node That Seen : ", cout)
print("***************")
