// Code your testbench here
// or browse Examples

package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class base;
  int N=3;// Class Base's variable N is at a location X
endclass : base

class child extends base;
  int N=4;// Class Child's variable N is at a location Y 
  int a_val;
  //function new();
  function void get_super_addr();  
    $display("super's address=%0h",super);
  endfunction : get_super_addr
endclass : child

endpackage : my_pkg

module tb_top;
  
  import my_pkg::*;
  
  base b;
  child c;
  
  initial begin
    //b = new();
    c = new();// memory for child class object
    $display("Child_N=%d",c.N);
    c.get_super_addr();
    $display("Before : B's address:%0h, C's addr=%0h",b,c);//This will be 0 for B as b is not created yet
    
    b = c;// now B & C are at same address location
    $display("B's address:%0h && C's address:%0h",b,c);
    $display("B's N is :%d && C's N is :%d",b.N,c.N);// Class Base's variable N is at a location X Class Child's variable N is at a location Y
    //This still displays class B's N because the attribute is getting accessed based on the type of the handle rather than object's handle
  end
endmodule : tb_top
