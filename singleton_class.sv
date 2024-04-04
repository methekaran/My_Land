//Define a singleton class
// A singleton class is a class object which has one object once created it is used everywhere within the testbench.
//A singleton class is constructed using a protected method new method. The function to get the object is defined as protected and it returns the object
//the object handle is defined as static since the get_inst method is static in nature for getting only 1 object
package my_pkg;


import uvm_pkg::*;
`include "uvm_macros.svh"

class my_singleton_class;
  static protected my_singleton_class sg_cls;
  static bit flag=1;
  
  protected function new(string name="my_singleton_class");
  endfunction : new
  
  static function my_singleton_class get_inst();
    if(sg_cls==null)begin
      sg_cls=new();
    end
    return sg_cls;
  endfunction :get_inst
  
endclass : my_singleton_class

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  //Creating an object only once
  my_singleton_class m_s_cls=my_singleton_class::get_inst();
  
  initial begin
    $display("m_s_cls.flag=%d",m_s_cls.flag);
  end
endmodule : tb_top
