
//tb top

package my_pkg;

//Write a constraint on a 4 bit variable such that the probability of values being the same on the lower two bits have only 5% chance
// Only lower bits being same is very less 5% and not same is 95%

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[3:0] a_value;
  
  constraint a_value_c {
    //a_value[1:0] dist {2'b00:/5,2'b11:/5,2'b10:/95,2'b01:/95}; 
    a_value[1] dist {a_value[0]:=5,~a_value[0]:=95};
  }
endclass : my_cls



endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls = new();
    
    repeat(10)begin
    cls.randomize();
      $display("a new number is:%0b",cls.a_value);  
    end
  end
  
endmodule : tb_top
