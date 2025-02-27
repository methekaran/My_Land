You are given an integer array nums consisting of n elements, and an integer k.

Find a contiguous subarray whose length is equal to k that has the maximum average value and return this value. Any answer with a calculation error less than 10^-5 will be accepted.

//https://leetcode.com/problems/maximum-average-subarray-i/solutions/6410913/simple-and-optimal-solution-with-explanation-o-n/

Example 1:

Input: nums = [1,12,-5,-6,50,3], k = 4
Output: 12.75000
Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

Formulate contiguous subarray of 4 whose maximum average you need to return 
We can see that only 3 arrays can be made contiguously, 
Out of those 3 arrays find the max sum of the elements and return those. 
Int sum=0;
Int max_sum;

For(int I=0;i<k;i++)begin //6-4=2
  Sum + =num[I];
end

for(int j=k;j<$size(nums);j++)begin
  Sum + =nums[j] - nums[j-k];
  If(sum > max_sum)begin
    max_sum = sum;
  end
end

Return max_sum*1.0/k;
