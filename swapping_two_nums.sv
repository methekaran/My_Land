package my_pkg;


import uvm_pkg::*;
`include "uvm_macros.svh"

class my_class;
  
endclass : my_class

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  int a=20;
  int b=30;
  
  initial begin
    //a = a + b;//50
    //b = a - b;//20
    //a = a - b;//30
    
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
    
    
    $display("Finally A:%d && B:%d",a,b);
  end
  
endmodule : tb_top
