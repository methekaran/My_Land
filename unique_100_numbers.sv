package my_pkg;

//generating unique 100 numbers
//create an array of 100 elements
//each and every element should be unique
//https://yue-guo.com/2019/03/16/3-ways-to-generate-an-array-with-unique-elements-using-systemverilog-constraints/
  
//second approach is just creating every element as incremental orderusing foreach and then shuffle the array inside post_randomize
import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[7:0] arr[100];
  
  //1st approach On^2
 /* constraint unique_c {
    foreach(arr[i]){
      foreach(arr[j]){
        if(i!=j){
          arr[i]!=arr[j];
        }
      }
    }
      }*/
          
          //Optimum solution//O(N)
  constraint unique_c {
    foreach(arr[i]){
      if(i>0){
        arr[i] > arr[i-1];
      }
    }
  }
        
  function void post_randomize();
      arr.shuffle();    
  endfunction : post_randomize
  
endclass : my_cls

endpackage:my_pkg
        
        module tb_top;
          import my_pkg::*;
          
          my_cls cls;
          
          initial begin
            cls =new();
            cls.randomize();
            foreach(cls.arr[i])begin
              $display("Elements of the array are: %d",cls.arr[i]);
            end
          end
        endmodule : tb_top

      //tb top

/*
Below code is for making sure generating 20 unique values within a given range of 20-50

package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  //generate unique numbers between a range 20-50 20
  rand bit[7:0] a_arr[20];
  
  constraint a_q_c {
    foreach(a_arr[i]){
      a_arr[i] inside {[20:50]};
      if(i>0){
        a_arr[i] > a_arr[i-1];
      }
    }
  }
  
        function void post_randomize();
     a_arr.shuffle();
      endfunction : post_randomize
  
endclass : my_cls

endpackage:my_pkg
        
        module tb_top;
          import my_pkg::*;
          
          my_cls cls;
          
          initial begin
            cls =new();
            cls.randomize();
            foreach(cls.a_arr[i])begin
              $display("Elements of the array are: %d",cls.a_arr[i]);
            end
          end
        endmodule : tb_top*/


