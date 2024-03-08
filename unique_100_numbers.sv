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


