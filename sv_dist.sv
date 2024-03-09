//tb top

package my_pkg;

// 

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[7:0] my_var;
  
  constraint my_var_c {
    my_var dist { 50:/5,[20:30]:/5};
  }
  // weight for value 50 is 5 whereas weightage for values 20,21,22,23,24,25,26,27,28,29,30 is 5/10 where 5 is the weight per value here n=10 hence 5/10 i.e. 1/2
endclass : my_cls
            
endpackage:my_pkg
        
        module tb_top;
          import my_pkg::*;
          
          my_cls cls;
          
          initial begin
            cls = new();
            repeat(5)begin
              cls.randomize();
              $display("Values for my_var=%d",cls.my_var);
            end
          end
        endmodule : tb_top


