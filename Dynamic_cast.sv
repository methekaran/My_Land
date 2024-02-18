// Code your testbench here
// or browse Examples

package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class base;
	int J=22;
  
  virtual function void display();
    $display("I am a BASE CLASS!");
  endfunction : display
endclass : base

class child extends base;
	int R=25;  
  function void display();
    $display("I am a CHILD CLASS!");
  endfunction : display
endclass : child

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  base B;
  child C;
  
  initial begin
    C = new();//created memory for C
    B = new();
    
   
    // B = C; would cast to make it work because then they both start referring to the same memory location  and types would match

    $cast(C,B);//Comilation error because you never did up-casting for downcasting to work
    
	/*    Error-[DCF] Dynamic cast failed
	testbench.sv, 36
  	Casting of source class type 'my_pkg.base' to destination class type 
  	'my_pkg.child' failed due to type mismatch.
  	Please ensure matching types for dynamic cast*/
    
    C.display();
    
  end
  
endmodule : tb_top
