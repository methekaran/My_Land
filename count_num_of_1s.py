import random
#Write a function that takes the binary representation of an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

#Note:

#Note that in some languages, such as Java, there is no unsigned integer type. In this case, the input will be given as a signed integer type. It should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.

#Example 1:

#Input: n = 00000000000000000000000000001011
#Output: 3
#Explanation: The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
#Example 2:

#Input: n = 00000000000000000000000010000000
#Output: 1
#Explanation: The input binary string 00000000000000000000000010000000 has a total of one '1' bit.

#Example 3:

#Input: n = 11111111111111111111111111111101
#Output: 31
#Explanation: The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.

#Step 1 Write comments on what steps needs to be done for a problem statement
#create an input array or list
n = 31  #1111
#define the target/output variable
output = 0

while (n > 0):
    output += 1
    n = n & (n - 1)  # 13
    #print(f"{n}\n")

print(f"The final result is {output}\n")
#step 2 once understood the comments then categorize as smaller tasks

#step 3 write smaller and simpler tasks into code

#step 4 read your code and find any typos or errors if any

#step 5 run the code

#another approch would be create a hash or dictionary of all elements and find that index whoes value is 1 other values will be more than 1
