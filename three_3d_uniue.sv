package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class A;
  rand bit[7:0] arr[3][3][3];
  rand bit[7:0] temp[27];

    constraint arr_c {
        foreach (temp[i]) foreach (temp[j]) 
          if (i != j) 
            temp[i] != temp[j];
    }

    function void post_randomize();
      foreach (arr[i,j,k]) begin
          arr[i][j][k] = temp[i*9+j*3+k];
        $display("Array value is:%d,i=%d,j=%d,k=%d",arr[i][j][k],i,j,k);
      end
    endfunction
endclass



endpackage : my_pkg
      
      module tb_top;
        import my_pkg::*;
        
        A a_cls;
        
        initial begin
          a_cls = new();
          a_cls.randomize();
          
        end
      endmodule : tb_top
