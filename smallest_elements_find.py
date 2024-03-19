# Find the minimum element from the array
# consider the first element as min of the array
# then compare each element until you find the min of all the elements
#iterate over the array to find out
#second approach is use min function of the python
#third approach is dictionary if you find the min then put in hash and then replace with the most min

#Example 1:

#Input: nums = [3,4,5,1,2]
#Output: 1
#Explanation: The original array was [1,2,3,4,5] rotated 3 times.
#Example 2:

#Input: nums = [4,5,6,7,0,1,2]
#Output: 0
#Explanation: The original array was [0,1,2,4,5,6,7] and it was rotated 4 times.
#Example 3:

#Input: nums = [11,13,15,17]
#Output: 11
#Explanation: The original array was [11,13,15,17] and it was rotated 4 times.

nums = [3, 4, 5, 1, 0]
min_val = nums[0]

for idx in range(len(nums)):
    if (idx > 0):
        if (min_val > nums[idx]):
            min_val = nums[idx]

print(f"The min value is {min_val}\n")

#######Below solution is for Finding the second smallest element from the array
min_val = nums[0]  #3
sec_smallest = 0

for idx in range(len(nums)):
    if (idx > 0):
        if (min_val > nums[idx]):
            sec_smallest = min_val
            min_val = nums[idx]
        else:
            if (sec_smallest > nums[idx] and min_val < nums[idx]):
                sec_smallest = nums[idx]

print(f"sec_smallest number is:{sec_smallest}\n")
