package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class address;
  int start_addr;
  int end_addr;
  
  function new();
    start_addr='ha0a0;
    end_addr='hf0f0;
  endfunction : new
  
  //Copy method implementation
  function address copy();
    copy = new();//copy is an object here of type address
    copy.start_addr = this.start_addr;
    copy.end_addr   = this.end_addr;
    return copy;
  endfunction : copy
  
  
endclass : address

class my_class;
  int data;
  address adr;
  
  function new();
    data='h100;
    adr = new();//creating the object of the address class
  endfunction : new
  
  function my_class copy();
    copy = new(); // copy is also an object of type my_class
    copy.data = this.data;
    copy.adr  = adr.copy;
    return copy;
  endfunction : copy
endclass : my_class

endpackage : my_pkg
  
module tb_top;
  
  import my_pkg::*;
  
  my_class m1,m2;
  
 
  initial begin
    m1= new();//created memory for m1

    //Below line will do the deep copy that means we are creating the memory for the object m2 and then internal objects and then copies the values so every nested objects and primary objects will have a dedicated memory
     m2 = m1.copy();
    $display("The addresses for different objects are : m1=%0h,m2=%0h,m1.adr=%0h,m2.adr=%0h",m1,m2,m1.adr,m2.adr);
    
    $display("The values are m1.data=%0h,m1.adr.start_addr=%0h,m1.adr.end_addr=%0h,m2.data=%0h,m2.adr.start_addr=%0h,m2.adr.end_addr=%0h",
             m1.data,m1.adr.start_addr,m1.adr.end_addr,m2.data,m2.adr.start_addr,m2.adr.end_addr);
  end
  
endmodule : tb_top
