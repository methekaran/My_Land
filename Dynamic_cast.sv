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
    
    
    B=C;//assigning child class object to parent class is allowed
    
    //C=B; not allowed direct assignment
    
    //For downcasting to work we should done an up-casting for matching the types
    $cast(C,B);
    
   // SystemVerilog provides a dynamic $cast function that checks to see if the assignment is compatible & if yes, its does assign the Handle back.
    
	/*    Error-[DCF] Dynamic cast failed
	testbench.sv, 36
  	Casting of source class type 'my_pkg.base' to destination class type 
  	'my_pkg.child' failed due to type mismatch.
  	Please ensure matching types for dynamic cast*/
	  B.display();//I am a Child class
	  C.display(); // I am a child class
    
  end
  
endmodule : tb_top
