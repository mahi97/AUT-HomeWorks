import numpy as np

const = 160

island = np.arange(0, const)


def kruskal(inGraph, tree):
    global island

    j = 0
    while j < const - 1:
        minV = inGraph.min()
        minI = inGraph.argmin()
        GI = int(np.floor(minI / const))
        GJ = int(minI % const)
        if island[GI] != island[GJ]:
            tree.append((GI, GJ))
            i = 0
            first = island[GI]
            second = island[GJ]
            while i < const:
                # print('i -> ', island[i])
                if island[i] == first:
                    # print(island)
                    island[i] = second
                    # print(island)
                i += 1

            j += 1
        inGraph[GI][GJ] = np.inf
    # print(island)
    # print(tree)


g = np.random.rand(const, const)
np.fill_diagonal(g, np.inf)
inF = open('input.txt', 'w')
for i in range(len(g)):
    inF.write(str(g[i][0]))
    for ii in range(1, len(g[i])):
        inF.write("," + str(g[i][ii]))
    inF.write("\n")
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
kruskal(lis, tree)

outF = open('output.txt', 'w')
outF.write(str(tree))
# print(tree)
