package my_pkg;

//Generating 100 sequential numbers without repeating them
// Approach here is to generate 100 elements by using a foreach loop and then shuffle the array in post randomize

//Generate an array with sum of all the elements equal to 100

//1st approach is using sum method of the array to create a array which will add to 100 values

//2nd approach is using a function to generate sum equal to 100 and pushing to a queue/array

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  
  rand bit[7:0] my_arr[$];
  int sum_to_be=100;
  rand bit[7:0] an_ele;
  
  //1st approach by using sum method of systemverilog
 // constraint sum_c {
       
  //      my_array.sum() with (int'(item))==100; First approach NOTE: always use sum with method for generating sum of all the elements

 // }
  
  //2nd approach below without using sum method
  constraint my_arr_c {
    an_ele inside {[0:sum_to_be]};
  }
  
  
  function void post_randomize();
    if(an_ele <= sum_to_be)begin
      sum_to_be= sum_to_be - an_ele;
    end
    else begin
      sum_to_be = 0;
    end
  endfunction : post_randomize
  
endclass : my_cls

endpackage:my_pkg
        
        module tb_top;
          import my_pkg::*;
          
          my_cls cls;
          bit[7:0] an_arr[20];
          
          initial begin
            cls =new();
            foreach(an_arr[i])begin
              cls.randomize();
              an_arr[i] =cls.an_ele;
            end
            
            foreach(an_arr[j])begin
              $display("The value of the array=%0d",an_arr[j]);
            end
          end
        endmodule : tb_top


