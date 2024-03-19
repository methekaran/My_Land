#Given an array find the largest and sec largest elements from an array
nums = [1, 9, 4, 5, 6, 7]

# first approach is assume the first element is largest and the second largest element starts as 0
# then iterate over the array to compare every element and find the largest and sec largest
#second approach is using max function of python
#third is sort the array and take the last 2 element will be largest and sec largest

largest = nums[0]
sec_largest = 0

for idx in range(len(nums)):
    if (idx > 0):
        if (largest < nums[idx]):
            sec_largest = largest
            largest = nums[idx]
        else:
            if (sec_largest < nums[idx] and largest > nums[idx]):
                sec_largest = nums[idx]

print(f"The largest element is:{largest} & sec_largest is {sec_largest}\n")
