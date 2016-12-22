n = int(input("Numbers count: "))
s = str(input("Numbers : ")).split(" ")
a = [int(s_) for s_ in s]
b = {-1: -1}
for a_ in a:
    if b.get(a_) is None:
        b[a_] = 1
    else:
        b[a_] += 1

c = []
for k, v in b.items():
    for i in range(v):
        c.append(k)
print(c)
