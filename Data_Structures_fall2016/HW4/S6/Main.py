from S6.Heap import *

num_count = input('Enter Quantity of numbers : ')
nums = str(input('Numbers : ')).split(' ')

if len(nums) is not int(num_count):
    print("Bad input")
    exit()

my_heap = Heap(nums)
nums = my_heap.heap

print(nums)
