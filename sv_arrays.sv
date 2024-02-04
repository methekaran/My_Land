// Code your testbench here
// or browse Examples

//In general Queue's are better with the rich functions for accessing elements from an array 
// Only associative and queue's have ability to delete a particular elements form an array

module tb_top;
  
  //define a static array
  int my_array[3];
  int m_q[$];
  int u_q[$];
  
  int d_dyn[];
  
  //Dynamic array element initialization
  initial begin
    d_dyn = new[10];
    foreach(d_dyn[i])begin
      d_dyn[i] = i*10;
      $display("Values of the array:%d",d_dyn[i]);
    end
    
    // For dynamic arrays If you want to preserve the previous elements and add 5 or more elements then the way to do it is below
    d_dyn = new[15](d_dyn);// copying previous elements and add 5 more
    foreach(d_dyn[a])begin
      $display("After adding more elements:a=%d && value=%d",a,d_dyn[a]);
    end
    
    // delete an element from a dynamic array
    //d_dyn.delete(10); //10 is an index here
    //The above code is not possible for dynamic arrays only queue elements can be deleted one at a time.
    //This will delete an entire array
    d_dyn.delete();
    $display("Size of the dynamic array is :%d",d_dyn.size());
  end
  
  initial begin
    foreach(my_array[i])begin
      my_array[i] = i*10;
      $display("array values are :my_array[i]=%d",my_array[i]);
    end
    m_q = my_array.find(item) with (item==20);
    
    foreach(m_q[i])begin
      $display("m_q[i]=%d",m_q[i]);
    end
    u_q = my_array.unique();
    
    foreach(u_q[j])begin
      $display("unique_q:%d",u_q[j]);
    end
  end
  
  // associative arrays
  int my_assoc_arr[int];
  int idx,a; 
  initial begin
    
    repeat(5)begin
      my_assoc_arr[idx]=idx*15;
      idx++;
    end
    
    //exists for an index
    if(my_assoc_arr.exists(4))begin
      $display("Array element found at 4 : :%d!!!",my_assoc_arr[4]);
    end
    
    idx=0;
    
    do 
      begin
      $display("ASSOC_ARRAY value=%d && index=%d",my_assoc_arr[idx],idx);
      a = idx;
    end while(my_assoc_arr.next(idx));
  end//initial
    
  
endmodule : tb_top

