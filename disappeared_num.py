import random

#Input: nums = [4,3,2,7,8,2,3,1]
#Output: [5,6]

## iterate through each element in array with an index if that index doesn't exists then populate your output array
nums = [4, 3, 2, 7, 8, 2, 3, 1]
output = []

print(f"Length of num:{len(nums)}")

for i in range(1, len(nums) + 1):
    if (i in nums):
        i = i
    else:
        output.append(i)
print(f"The final output array is:{output}")
