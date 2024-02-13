import random

#Given an array of integers nums which is sorted in ascending order, and an integer #target, write a function to search target in nums. If target exists, then return its #index. Otherwise, return -1.

#You must write an algorithm with O(log n) runtime complexity.

#Example 1:

#Input: nums = [-1,0,3,5,9,12], target = 9
#Output: 4
#Explanation: 9 exists in nums and its index is 4

#Example 2:
#Input: nums = [-1,0,3,5,9,12], target = 2
#Output: -1
#Explanation: 2 does not exist in nums so return -1

#Step 1 Write comments on what steps needs to be done for a problem statement
#create an input array or list
nums = [-1, 0, 3, 5, 9, 12]

#define the target variable
target = 9
index = 0
l = 0
r = len(nums) - 1

# search for the target inside the list or an array and return the index of the array/list
while (l <= r):
    m = (l + r) // 2  # r=10 l=0 5 +0=5
    if (nums[m] < target):
        l = m + 1
    elif (nums[m] > target):
        r = m - 1
    else:
        index = m
        break

print(f"{index}\n")

# search for the target inside the list or an array and return the index of the array/list
#for idx in range(len(nums)):
#    if (nums[idx] == target):
#        index = idx
#        break
#    else:
#        index = -1

#if (index == -1):
# print(f"{index}\n")
#else:
#    print(f"{index}\n")

#step 2 once understood the comments then categorize as smaller tasks

#step 3 write smaller and simpler tasks into code

#step 4 read your code and find any typos or errors if any

#step 5 run the code

## two more possible solutions are i) doing XOR with every element of the array with target and if any value ==0 means we found else not found
##                                ii) creating an associative array or dictionary from the list and then using find_first_index function of the SV

