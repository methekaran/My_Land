#Given an array and k as an integer return the k unique and most frequent elements from the array

#Input: nums = [1,1,1,2,2,3], k = 2
#Output: [1,2]

#Example 2:
#Input: nums = [1], k = 1
#Output: [1]

# First approach is hash or dicitonary to make sure the most frequent elements
# secondly you will try to get the k elements from the array
#if k is 0 return an empty list
# numbers can be sorted or not sorted

nums = [1, 1, 1, 2, 2, 3]
k = 2
output = []
hash_map = {}
hash_map2 = {}

for i in range(len(nums)):
    hash_map[nums[i]] = 0
    hash_map[nums[i]] += 1

hash_map2 = hash_map.copy()

for j in hash_map2:
    temp = max(hash_map, key=hash_map.get)
    if (k == 0):
        break
    output.append(temp)
    del hash_map[j]
    k -= 1

hash_map = {}
hash_map2 = {}
print(f"{output}\n")
