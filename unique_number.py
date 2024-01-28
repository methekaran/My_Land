import random

#Input: nums = [2,2,1]
#Output: 1

#steps : By doing an exor ^ operation with a zero value first and then iterating over the array will give us the unique number from the array/list

nums = [4, 2, 1, 2, 1]
unique_num = 0

for i in range(len(nums)):
    unique_num = unique_num ^ (nums[i])

print(f"The unique number from the array is : {unique_num}")
