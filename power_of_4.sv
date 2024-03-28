package my_pkg;

// constraint for power of 4 without using power operator
//valid values are : 4,16,64,256... etc
//100 last two bits has to be 0 
//%4==0 100 
//.   10000  //16 
//   100000 //64
// 10000000 //256
// lets say it has to generate in increasing order

/*class test;
  rand bit [7:0] arr[];
  constraint sz{
    arr.size() == 10;
  }
  constraint un {
    arr.sum() with (int'((item.index%2 == 0) ? item%2 == 0 : item%2 != 0)) == 10;
  }*/ 


import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[31:0] a_pow_of_4;
  bit[31:0] a_value=4;
  
  
  constraint monkeys_c {
    a_pow_of_4==a_value;
  }
  
  
  function void post_randomize();
    a_value  = a_pow_of_4;
    a_value = a_value << 2;
  endfunction : post_randomize
  
endclass : my_cls

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls= new();
    repeat(5)begin
      cls.randomize();
      $display("Power of 4 values:%d",cls.a_pow_of_4);
    end
  end
  
endmodule : tb_top

