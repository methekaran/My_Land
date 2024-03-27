#Reversing a list in python
#two approches one is where u can use list slicing technique to reverse a list and second approcah is just use one for loop and start from the end of the list

head = [1, 2, 3, 4, 5, 6]
#Output: [2,1]
#output = head[::-1]
output = []

#Note : Stop function will not see value of 0th element, hence -1 to observe the 0th element of the nums array
                  start         ,stop,incr/decr
for idx in range((len(head) - 1), -1, -1):
    output.append(head[idx])

print(f"{output}\n")


#Different approaches below
#reverse a given array
#The fist approach is using one for loop add creating an output array
#traversing through last element to the first element
#second approach can be just using rsort function of python
#third approach is slicing the list
# fourth approach is using the same array to swap the elements until we reach till the middle element // 2 to find the middle of the array

nums = [1, 2, 4, 3, 45, 96]

output_l = []

#Note : Stop function will not see value of 0th element, hence -1 to observe the 0th element of the nums array
#for j in range(len(nums) - 1, -1, -1):
#    output_l.append(nums[j])

#4,3
#output_l = nums[::-1]
#print(f"{output_l}\n")

j = 0
if (len(nums) % 2 == 0):
    len_of_nums = int(len(nums) / 2) - 1
else:
    len_of_nums = int(len(nums) / 2)
for a in range(len(nums) - 1, len_of_nums, -1):
    nums[a] = nums[a] + nums[j]
    nums[j] = nums[a] - nums[j]
    nums[a] = nums[a] - nums[j]
    j += 1

print(f"{nums}\n")

