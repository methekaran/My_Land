// Code your testbench here
// or browse Examples


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
  
endmodule : tb_top
