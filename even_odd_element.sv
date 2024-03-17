//tb top

package my_pkg;


//write a constraint to make sure every even item in an array is even and every odd item is odd.

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  
  rand bit[7:0] an_array[$];
  
  constraint an_array_c {
    an_array.size() inside {[10:20]};
    
    foreach(an_array[i]){
      if(i%2==0){
        an_array[i][0]==0;
      }
      else {
        an_array[i][0]==1;
      }
    }
  }
  
endclass : my_cls



endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls = new();
    
    repeat(1)begin
      cls.randomize();
      foreach(cls.an_array[i])begin
        $display("an array value:%d",cls.an_array[i]);
      end
    end
  end
  
endmodule : tb_top
