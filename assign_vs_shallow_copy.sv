// Code your testbench here
// or browse Examples

package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_class;
  int a_var;
  int a_b;
  int addr;
  int data;
  
  //Constructor can never be a virtual because there is no virtual table/virtual pointer available 
  function new();
    //`uvm_info("my_class",$sformatf("My class name is "my_class"),UVM_LOW)    
    //If you try to return from a new method it will throw a compile error as it returns an object / or address of the object hence explicit return is not allowed
  endfunction : new
                                        
  virtual function void disp(input int a_var);
    this.a_var= a_var;     
    $display("This var is =%d",this.a_var);
    $display("a_b=%0h",a_b);
    $display("Address:%0h && data=%0h",addr,data);
   // `uvm_info(get_type_name(),$sformatf("The variable value is a_var=%d",this.a_var),UVM_LOW)
  endfunction : disp
endclass : my_class

class addr_c;
  int address;
  
endclass : addr_c

class shallow_cp;
  addr_c add;
  int    data;
  
  function new();
    add = new();
  endfunction : new
endclass : shallow_cp
                                        
endpackage : my_pkg

module tb_top;
  
  import my_pkg::*;
  
  my_class m_cls,m_cls_2;
  
  initial begin
    m_cls= new();
    m_cls_2 = new();
    m_cls.addr='h3ff;
    m_cls.data='ha5a5;
    m_cls_2 = m_cls; //Two objects start pointing to same location in the memory m_cls_2 is not newed it's just a handle or pointer to the m_cls object
    m_cls.addr = 'hA0;
    m_cls.data = 'h5a5a;
    $display("this will display the address of an object : m_cls=%0h",m_cls);
    m_cls_2.disp($urandom_range(1,30));
    $display("m_cls_2 object address:%h and m_cls_1 object address:%h",m_cls,m_cls_2);
  end
  
  //Shallow copy
  shallow_cp sp_1,sp_2;
  
  initial begin
    sp_1=new();
    sp_1.data='h1010;
    sp_1.add.address='hF5F5;
    
    //below is shallow copy assignment
    sp_2 = new sp_1;
    //#################################
    
    $display("Memory location for SP1:%0h && SP2:%0h",sp_1,sp_2);
    
    //Internal objects attributes address location display
    $display("Memory location for SP_1_ADD:%0h && SP_2_ADD:%0h",sp_1.add,sp_2.add);
    
    $display("SP_1.DATA=%0h && SP_2.DATA=%0h",sp_1.data,sp_2.data);
    
    //Below shows that the shallow copy is a partial copy where only class attributes or their object handles get copied and the internal objects variables share the same memory as it has a common handle 
    $display("The internal object's attributes values are: sp_1.add.address=%0h && sp_2.add.address=%0h",sp_1.add.address,sp_2.add.address);
    
    
    sp_1.data = 'h5000;
    sp_1.add.address='h0;
    
    //After changing above values sp2's address field of add is also changed that shouldn't have happened
    $display("The sp_1.data=%0h && sp1_add=%0h while sp2.data=%0h && sp2.add=%0h",sp_1.data,sp_1.add.address,sp_2.data,sp_2.add.address);
    
    //https://verificationguide.com/systemverilog/systemverilog-shallow-copy/
  end
  
endmodule : tb_top
