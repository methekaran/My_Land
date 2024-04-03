package my_pkg;

//Given a 2D pixel matrix, around an OFF pixel there is always an ON pixel

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit a_2d_arr[5][5];
  
  constraint a_2d_arr_c {
  
    foreach(a_2d_arr[i,j]){
      if(i>0){
        a_2d_arr[i][j] == ~a_2d_arr[i-1][j];
      }
    }
  }
  
  
  function void post_randomize();
  endfunction : post_randomize
  
endclass : my_cls

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls= new();
    repeat(1)begin
      cls.randomize();
      foreach(cls.a_2d_arr[a,b])begin
        $display("ON_OFF : %b",cls.a_2d_arr[a][b]);
      end
    end
  end
  
endmodule : tb_top

