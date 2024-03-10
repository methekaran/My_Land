package my_pkg;

//Write a constraint to randomize 3x3x3 array with unique elements
//Write constraints to generate MxN matrix with each element with 0,1 and sum of all elements less the MAX_SUM


import uvm_pkg::*;
`include "uvm_macros.svh"


/*rand bit[7:0] a_2d_ary[5][5];
  rand bit[9:0] a_2d_ary_500[5][5];
  
  constraint a_2d_ary_c {
    //a_2d_ary.size()==5;
    //foreach(a_2d_ary[i]){
    //  a_2d_ary[i].size()==5;
    //}
    foreach(a_2d_ary[i,j]){
      a_2d_ary.sum() with (item.index(2)==j ? int'(item):0)==100;  
    }
  }*/
      
class my_cls;

  //When defining the 2 dimensional array sum mehtod can only work on fixed size arrays or static array
  //Error-[IAMC] Invalid array manipulation method called
  //testbench.sv, 38
  //Wrong usage of array manipulation method 'sum' as this method is not 
  //supported on variable-size multidimensional arrays.
  
  rand bit[7:0] my_var[4][6];
  
  int MAX_SUM=70;
  
  constraint my_var_c {
    foreach(my_var[i,j])
    {
        my_var.sum() with (int'(item)) < MAX_SUM;  
    }
  }
endclass : my_cls
            
endpackage:my_pkg
        
        module tb_top;
          import my_pkg::*;
          
          my_cls cls;
          
          
          initial begin
            cls = new();
            cls.randomize();
            foreach(cls.my_var[i,j])begin
              $display("Values for my_var=%d",cls.my_var[i][j]);
            end
          end
        endmodule : tb_top


