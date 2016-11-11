import os
import subprocess
import matplotlib.pyplot as plt
from matplotlib.pyplot import setp
from time import clock
import numpy as np

c_time =      [0, 0.143, 0.161, 0.171, 0.221, 0.402, 0.900, 0.983, 4.102, 19.506]
python_time = [0, 0.150, 0.154, 0.169, 0.180, 0.385, 2.500, 32.209, 1000, 50000]

print(c_time)
print(python_time)

plt.savefig('result.pdf')
fig = plt.figure(1)
ax = plt.axes([0.1, 0.1, 0.8, 0.8])
setp(ax, 'frame_on', False)
degree = [0, 5, 10, 20, 40, 80, 160, 320, 680, 1280]
ax.set_yscale('log')
ax.plot(degree, python_time, label='Prim', marker='o')
ax.plot(degree, c_time, label='Kruskal', marker='o')
# End Plot
ax.set_xlabel(r'Vertex Count (n)')
ax.set_ylabel(r'Time (ms)')
handle, label = ax.get_legend_handles_labels()
ax.legend(handle, label, loc='upper left', bbox_to_anchor=(0.01, 0.99), ncol=1, labelspacing=0.3, fancybox=True,
          shadow=True,
          columnspacing=1, borderpad=0.2, title='', handletextpad=0.1,
          numpoints=1, handlelength=1.5, markerscale=1)
plt.savefig(os.path.join(os.getcwd(), 'result.pdf'))
