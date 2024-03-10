package my_pkg;

//Write constraint for an integer array with 10 elements such that exactly 3 of them are same and rest are unique
// 10 elements in an array 3 of them are 5 while rest means 7 elements are unique

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[7:0] a_q[10];
  rand bit[7:0] same_val;
  rand int index_q[$];
  
  constraint q_c {
    same_val inside {[1:20]};
    index_q.size()==3;
    
    unique{index_q};
    foreach(index_q[i]){
      index_q[i] inside {[0:9]};
    }
        
      foreach(a_q[i]){
        if(i inside index_q){
          a_q[i]==same_val;
        }
        else if(i > 0){
          a_q[i] > a_q[i-1];  
          a_q[i] != same_val;
        }
      }
  }
  
endclass : my_cls
            
endpackage:my_pkg
        
        module tb_top;
          import my_pkg::*;
          
          my_cls cls;
          
          initial begin
            cls = new();
            cls.randomize();
            foreach(cls.a_q[i])begin
              $display("Values for my_var=%d",cls.a_q[i]);
            end
          end
        endmodule : tb_top


