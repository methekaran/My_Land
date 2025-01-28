import random
#You are climbing a staircase. It takes n steps to reach the top.

#Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

#Example 1:

#Input: n = 2
#Output: 2
#Explanation: There are two ways to climb to the top.
#1. 1 step + 1 step
#2. 2 steps
#Example 2:

#Input: n = 3
#Output: 3
#Explanation: There are three ways to climb to the top.
#1. 1 step + 1 step + 1 step
#2. 1 step + 2 steps
#3. 2 steps + 1 step

#Constraints:
#1 <= n <= 45

#Step 1 Write comments on what steps needs to be done for a problem statement

#create an input array or list

#define the target/output variable
n = 5  #1,1,1,1,1 1,2,2 2,2,1 2,1,2 1,2,1,1 2,1,1,1 
output = 0


def climbing_stairs(n):
    if (n <= 1):
        return 1
    else:
        return (climbing_stairs(n - 2) + climbing_stairs(n - 1))


output = climbing_stairs(n)
print(f"The final result is {output}\n")

######## sv code below or another approach  #############
Int prev,sum;
Int num=1;
Initial begin
  for(int I=0;i<=n;i++)begin
    Sum = prev+num; //1, 2, 3
    prev=num;  // 1 // 1 // 2 
    num=sum;   //1   //2 //3
  end
end

