import numpy as np
import time
import csv


count = 1000

# Normal Add Lines
t1 = time.time()
file = open('normal.txt', 'w')
for i in range(count):
    file.write('Line ' + str(i) + '\t' + "{:.6f}".format(np.random.random()) + '\n')
t2 = time.time()
print('normal: {}'.format(t2 - t1))

t1 = time.time()
with open('csv.csv', 'w') as csvfile:
    writer = csv.writer(csvfile)
    for i in range(count):
        writer.writerow(['Line {}'.format(i) + '\t' + "{:.6f}".format(np.random.random())])
t2 = time.time()
print('csv   : {}'.format(t2 - t1))

# Third
t1 = time.time()
list = ['Line :' + str(i) + '\t' + '{:.6f}'.format(np.random.random()) + '\n' for i in range(count)]
file1 = open('list.txt', 'w')
file1.writelines(list)
t2 = time.time()

print('List  : {}'.format(t2 - t1))