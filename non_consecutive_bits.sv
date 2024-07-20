

// Code your testbench here
// or browse Examples

package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[31:0] my_var;
  rand int index_q[$];
  
  constraint c_my_var {
    index_q.size()==10;
    unique{index_q};
    
    foreach(index_q[i]){
      index_q[i] inside {[0:31]};
    }
    
      foreach(my_var[j]){
        if(j inside {index_q}){
          my_var[j]==1;
        }
          else{
            my_var[j]==0;
          }
      }
  }
endclass : my_cls

endpackage : my_pkg
          
          module tb;
            import my_pkg::*;
            
           my_cls cls;
            
            initial begin
              cls=new();
              cls.randomize();
              $display("The value of the variable is =%0b",cls.my_var);  
              end
              
            
              
          endmodule : tb
