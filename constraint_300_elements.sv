//tb top

package my_pkg;

//Write a constraint to generate dynamic array of 300 elements. each element can have value 0/1/2/3/4 each of the above values should be present more than 40 times in the array element 0 can be repeated while 1/2/3/4 are not allowed to repeat consecutively ex: 001342.. allowed(0 can be repeated) ex: 0122431.. not allowed(2 is repeated)

//i) dynamic array has 300 elements
//ii) 0,1,2,3,4
//iii) The values 1,2,3,4 should be present more than 40 times
//iv) The element 0 can be repeated multiple times
//v) other elements can be consecutively repeated (1,2,3,4)

import uvm_pkg::*;
`include "uvm_macros.svh"

//5,7,6,4,3,2

class my_cls;
  
  rand bit[2:0] a_q[$];
  
  constraint a_q_c {
    a_q.size()==300;
    foreach(a_q[i]){
      a_q[i] inside {0,1,2,3,4};
      if(i>0){
        if(a_q[i-1] inside {1,2,3,4}){
          a_q[i] != a_q[i-1];
          }
    }
   }
          a_q.sum() with (int'(item inside {1,2,3,4}))>=40;
   //array.sum() with (int'(item == item)) >= 40;
  }
  
        
  
        function void post_randomize();
  
      endfunction : post_randomize
  
endclass : my_cls

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls = new();
    cls.randomize();
    
    foreach(cls.a_q[j])begin
      $display("VALUES OF A_Q=%d",cls.a_q[j]);
    end
  end
  
endmodule : tb_top
