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

// Code your testbench here
// or browse Examples
/*
package my_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh" 
   
   class my_base_cls;
     int addr;
     function new(int addr);
       this.addr =addr;
     endfunction :new
     
     virtual function void display();
       $display("My Base address =%0h",addr);
     endfunction : display
   endclass : my_base_cls

class my_child_cls extends my_base_cls;
   int data;
  
  function new(int addr,int data);
    super.new(addr);
     this.data=data;          
  endfunction : new
               
  function void display();
    $display("My child class address=%0h & data=%0h",addr,data);               
  endfunction : display
endclass : my_child_cls
endpackage : my_pkg
               
               module tb_top;
                 import my_pkg::*;
                 
                 my_base_cls b_cls;
                 my_child_cls c_cls;
                 
                 initial begin
                   b_cls=new('h1000);
                   c_cls=new('h2000,'hdeadbeef);
                   
                   b_cls = c_cls;// assigning child class handle to base class then child class and base class pointing to same memory location hence it will display the c_cls.address=2000 if we don't assign the child handle to base class then it would have displayed 1000
                   if($cast(c_cls,b_cls))begin
                     `uvm_info("TB",$sformatf("Cast worked!!!"),UVM_LOW)
                   end
                   else begin
                     `uvm_info("TB",$sformatf("Cast didn't work!!!"),UVM_LOW)
                   end
                   b_cls.display(); 
                   c_cls.display();
                 end
               endmodule : tb_top
*/
