import numpy as np
import time


def dot(mat1, mat2):
    answer = np.zeros((1000, 1000))
    for i in range(mat1.shape[0]):
        for j in range(mat2.shape[1]):
            for k in range(mat1.shape[1]):
                answer[i][j] += mat1[i][k] * mat2[k][j]
    return answer

first_matrix = np.random.rand(1000, 1000)
second_matrix = np.random.rand(1000, 1000)


t1 = time.time()
dot_matrix = first_matrix.dot(second_matrix)
t2 = time.time()
print('Time Pass Numpy Dot : {}'.format(t2 - t1))

t1 = time.time()
dot_matrix1 = dot(first_matrix, second_matrix)
t2 = time.time()
print('Time Pass My Dot    : {}'.format(t2 - t1))
