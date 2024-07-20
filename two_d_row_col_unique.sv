//tb top

//A generation of unique numbers for a 2d array

package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

      class my_2d_arr;
        bit[7:0] a_2d_arr[5][5];
        rand bit[7:0] temp_arr[25];
        
        constraint a_2d_arr_c {
          foreach(temp_arr[i]){
            if(i>0){
              temp_arr[i] > temp_arr[i-1];
            }
          }
        }
              
              function void post_randomize();
            temp_arr.shuffle();
            foreach(a_2d_arr[i,j])begin
              a_2d_arr[i][j] = temp_arr[i*5+j];
              $display("My 2d arr value is=%0d",a_2d_arr[i][j]);
            end
            endfunction : post_randomize
      endclass : my_2d_arr
              
endpackage : my_pkg

module tb;
  import my_pkg::*;
  
  my_2d_arr md;
  
  initial begin
    
    md = new();
    md.randomize();
  end
  
endmodule : tb
            
