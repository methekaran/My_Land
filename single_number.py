import random

#Example 1:

#Input: nums = [2,2,1]
#Output: 1
#Example 2:

#Input: nums = [4,1,2,1,2]
#Output: 4

#Example 3:

#Input: nums = [1]
#Output: 1

#Step 1 Write comments on what steps needs to be done for a problem statement
#create an input array or list
nums = [1, 2, 1, 2, 3]

#define the target/output variable
output = 0

my_dict = {}

for i in range(len(nums)):
    output = output ^ nums[i]
    my_dict[nums[i]] = 0

for j in range(len(nums)):
    my_dict[nums[j]] += 1

for key in my_dict:
    if (my_dict[key] == 1):
        print(f"Key is {key}\n")
        output = key

print(f"The final output is {output}\n")
#step 2 once understood the comments then categorize as smaller tasks

#step 3 write smaller and simpler tasks into code

#step 4 read your code and find any typos or errors if any

#step 5 run the code

#another approch would be create a hash or dictionary of all elements and find that index whoes value is 1 other values will be more than 1
