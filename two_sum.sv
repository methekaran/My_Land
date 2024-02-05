module tb_top;

  int nums[4] = {7,1,15,2};
  int out_q[$];
  int target=3;
  
  //This one is O(n) method for two sum's problem
  int my_assoc_arr[int];
  int assoc_q[$];
  
  initial begin
  for(int i=0;i<$size(nums);i++)begin
    assoc_q = my_assoc_arr.find_index(item) with (int'(item)==int'(target-nums[i]));//getting the index if element already exists
    if(assoc_q.size() > 0)begin
      out_q.push_back(assoc_q[0]);
      out_q.push_back(i);
    end
    else begin
      my_assoc_arr[i]=nums[i];
    end
  end
    foreach(out_q[a])begin
      $display("Output values in the index are:%d",out_q[a]);
    end
  end
  
  
 /* 
 
 Below is the brut force method for two sum's problem
 O(n^2)
 
 initial begin
  for(int i=0; i<$size(nums)-1;i++)begin
    for(int j=i+1; j<$size(nums);j++)begin
      if(nums[i]+nums[j]==target)begin
        out_q.push_back(i);
        out_q.push_back(j);
        break;
     end
    end
  end
  
    foreach(out_q[i])begin
      $display("Values of index are:%d",i);
    end
  end*/
  
endmodule : tb_top
