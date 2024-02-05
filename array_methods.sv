// Array Methods
module tb_top;
  
  int my_assoc_arr[int];
  int i=0;
  int out_q[$];
  
  initial begin
	  repeat(10)begin
        my_assoc_arr[i++]=i*10;   
      end
    
    // Find will find an actual element with that value
    out_q = my_assoc_arr.find(item) with (int'(item)==50);
    $display("The elemnt found in the q:%d",out_q[0]);
    out_q={};
    
    //Find index will give u an index of the element that ur lokking for
    out_q =my_assoc_arr.find_index(item) with (int'(item)==60);
    $display("The index for the value 60 is:%d",out_q[0]);
    out_q= {};
    
    //Find first if there are many occurance of the element then use this if u want the first one
    out_q = my_assoc_arr.find_first(item) with (int'(item)==90);
    $display("The first element found from the array is :%d",out_q[0]);
    out_q = {};
    
    //find first index will give the first occurances index by not wanting other indices
    out_q = my_assoc_arr.find_first_index(item) with (int'(item)==90);
    $display("The first occurance of the index is:%d",out_q[0]);
    out_q = {};
      
    //find last will give the last element by satisfying the expression
    out_q = my_assoc_arr.find_last(item) with (int'(item)==60);
    $display("The last element that I found is:%d",out_q[0]);
    out_q ={};
    
    //Find last index for an element with the given expression
    out_q = my_assoc_arr.find_last_index(item) with (int'(item)==60);
    $display("The last index of the element is :%d",out_q[0]);
    out_q = {};
    
    //find min value from the array
    out_q = my_assoc_arr.min();
    $display("The lowest value of the array is :%d",out_q[0]);
    out_q = {};
    
    //find max value from the array
    out_q = my_assoc_arr.max();
    $display("The max value of the array is %d",out_q[0]);
    out_q ={};
    
    //find unique elements from the array
    out_q = my_assoc_arr.unique();
    foreach(out_q[i])begin
      $display("The unique values are:%d",out_q[i]);
    end
    out_q = {};
    
    //find unique indexes of all unique elments
    out_q = my_assoc_arr.unique_index();
    foreach(out_q[i])begin
      $display("The unique indices are:%d",out_q[i]);
    end
    out_q = {};
  end
endmodule : tb_top
