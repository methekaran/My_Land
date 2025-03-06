 int nums[5] = {1,2,2,1,2};
  
  int my_hash[int];
  int my_queue[$];
  int return_val;
  
  initial begin
    for(int i=0;i<$size(nums);i++)begin
      my_hash[nums[i]] +=1;
    end
    my_queue = my_hash.find_index() with (item > ($size(nums)/2));
    return_val = my_queue[0];
    
    $display("my_return value=%d",return_val);
  end
