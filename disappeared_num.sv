
The numbers of an array are below, find all disappearing numbers from the array
nums = [4,3,2,7,8,2,3,1]
Output: [5,6]
A. Create an associative array with index counting the numbers until the length of the array
B. Find method on associative array which will give the numbers whose value is 0.
Int assoc_arr[int];
Int out_q[$];
Initial begin
For(int I=0;i<nums.size();I++)begin
  Assoc_arr[nums[I]]=1; //assoc_arr[4]=1
end
For(int I=1;i<=nums.size();I++)begin
  If(assoc_arr[I]==0)begin
    Out_q.push_back(i);
  end
end
assoc_arr.delete();
end
