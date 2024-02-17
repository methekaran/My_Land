// Code your testbench here
// or browse Examples

package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class base;
  int P=5;  
  int Q=15;
  
  virtual function void update(input string str="");
    $display("str=%s : This is a BASE CLASS!",str);
  endfunction : update
  
endclass : base

class child extends base;
  int K=10;
  
  function void update(input string str="");
    $display("This is a CHILD CLASS!");
  endfunction : update
  
  function void check();
    if(K==10)begin
      $display("Check K=%d",K);
    end
  endfunction : check
  
endclass : child

endpackage : my_pkg

module tb_top;
  
  import my_pkg::*;
  
  base b;
  child c;
  
  initial begin
    b = new();//created memory for b as well
    c = new();//creating memory for c 
    
    //Memory locations for objects
    $display("B's addr=%0h && C's addr=%0h",b,c);
    
    //Before class assignment 
    b.update("BEFORE");
    
    b=c;//both the objects start pointing to one location which is C's address
    $display("After object assignment : B's addr=%0h && C's addr=%0h",b,c);
    
    b.Q=20;
    
    //after class assignment
    b.update("AFTER");//since the method from base is virtual it will get ponted to c class overriden method
    
    //b.check(); Compilation Error due to check not present in the base class
    c.update();
    
    //c.Q is actually updating the value in the base class because Chila class never created memory for variable Q after extension and hence working on the same copy as b class object
    c.Q =28;
    $display("The value of Q is :%d",b.Q);
  end
  
endmodule : tb_top
