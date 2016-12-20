import numpy as np
import json

const = 640

blue = [0]

white = np.arange(1, const)


def prim(g, tree):

    global blue
    i = 0
    while i < (const - 1):
        new = []
        new1 = []
        new2 = []
        for j in blue:
            new.append(g.argmin(0)[j])
            new1.append(g.min(0)[j])
            new2.append(j)
        # print(new)
        # print(new1)
        # print(new2)
        new1 = np.array(new1)
        blue.append(new[new1.argmin()])
        g[new[new1.argmin()]][:] = np.inf
        tree.append((new2[new1.argmin()], new[new1.argmin()]))
        # print(blue)
        i += 1
        # print(tree)

g = np.random.rand(const, const)
np.fill_diagonal(g, np.inf)
inF = open('input.txt', 'w')
for i in range(len(g)):
    inF.write(str(g[i][0]))
    for ii in range(1, len(g[i])):
        inF.write("," + str(g[i][ii]))
    inF.write("\n")
# inF.write(g)
inF.close()

inF = open('input.txt', 'r')
lis = []
for i in inF.readlines():
    i = i.replace('\n', '')
    li = i.split(',')
    li = [float(i) for i in li]
    lis.append(li)
# print(lis)
lis = np.array(lis)

tree = []
prim(lis, tree)

outF = open('output.txt', 'w')
outF.write(str(tree))
# print(tree)
