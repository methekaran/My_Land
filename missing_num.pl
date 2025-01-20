## find a missing number from the given array

#Input: nums = [0,1,2,4]

#Missing numbers from the list of numbers
#Do a XOR of index & the result plus result ^ element of the array
#That will be the answer


#int res = nums.length;//4

#    for(int i=0; i<nums.length; i++){
#        res ^= I; 4 ^0=4; 4 ^1 =5; 4^2=6; 4^3=7
#        res ^= nums[I]; 4^0 =4 5^1=4; 6^2=4; 7^4 0111^0100=0011
#    }
#    return res;

#SUM METHOD
#int len = nums.length;
#    int sum = (0+len)*(len+1)/2;
#    for(int i=0; i<len; i++)
#        sum-=nums[i];
#    return sum;

#Below solution is using sort method of python 
#my_list = [9,6,4,2,3,5,7,0,1]

#my_list.sort()

#for i in range(len(my_list)):
#  if(i in my_list):
#    continue 
    #print("The index is found\n")
#  else:
#    print(f"The missing number is {i}\n")
