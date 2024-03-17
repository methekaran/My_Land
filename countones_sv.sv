
//tb top

package my_pkg;

//Write a constraint for a 10 bit variable so that; -> 10% of the time 1 bit in en is high -> 10% of the time 2 bits in en are high ... -> 10% of the time all 10 bits in en are high.
//Write a constraint to generate a number which has binary all 1s grouped to gather

//1. only 1 bit is high any one of the 10 bits :=10
//2. only 2 bits are high from 10 bits :=10
//3. only 3 bits are high from 10 bits : 10

// create a dist for $countones(1,2,3,4,....10)


import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  
  rand bit[9:0] a_var;
  
  // NOTE: $COUNTONES takes a variable as an input and constraint need to make sure to assign the number of 1's needed
  
  constraint an_array_c {
    //num_of_ones inside {[1:10}];
    $countones(a_var) dist {1:=10,2:=10,3:=10,4:=10,5:=10,6:=10,7:=10,8:=10,
                9:=10,10:=10};
  }
  
endclass : my_cls



endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls = new();
    
    repeat(100)begin
      cls.randomize();
      $display("an value:%b",cls.a_var);
    end
  end
  
endmodule : tb_top


