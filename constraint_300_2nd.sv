import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  
  rand bit[7:0] a_arr[300];
  
  constraint a_300_q_c {
    foreach(a_arr[i]){
      a_arr[i] inside {[0:5]};
      if(i>0){
        a_arr[i-1] != a_arr[i];
      }
    }
        a_arr.sum() with (int'(item inside {[0:5]}))>=40;
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
      foreach(cls.a_arr[j])begin
        $display("a value generated:%d",cls.a_arr[j]);
      end
    end
  end
  
endmodule : tb_top
