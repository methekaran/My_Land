Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]

Move zero’s to the end of the array
Current element at index I
The next element is index j 
If the current element is zero then u shuffle and also check until the last element


Int I;
Int j=0;
//[1,0,0,3,12]
For(I=0;i<$size(nums)-1;I++)begin
  If(nums[I]!=0)begin
    Nums[j] = nums[I]+nums[j];//0+1=1
    Nums[I] = nums[j] - nums[I];//1-0=1
    Nums[j] = nums[j] - nums[I];//1-1=0
  end
  j++;
end
