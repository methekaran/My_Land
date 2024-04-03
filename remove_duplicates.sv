//tb top

//tb top
//tb top

//tb top

//tb top

//tb top
//tb top


//tb topo
//Checking if the number is palindrome or not
//333
// take number % 10= remainder 333 %10 =33
// new_num = remainder + 10 * new_num
// n = n /10 33


package my_pkg;


import uvm_pkg::*;
`include "uvm_macros.svh"

// Find the Duplicate Number (Medium) [1,2,2,1,5,6,7,7]
//1 step is to create a data structure of an associative array by adding the elements of this arr as an index and the count is kept to add up the value

//2 step is find all elements from the assoc array which are greater than 1
class my_cls;
  
  
endclass : my_cls

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  int inp_arr[$] = {1,2,2,5,6,7,7};
  int assoc_arr[int];
  int out_arr[$];
  
  initial begin
    foreach(inp_arr[i])begin
      assoc_arr[inp_arr[i]]+=1;
    end
    out_arr = assoc_arr.find_index() with (int'(item) > 1);
    assoc_arr.delete();
    foreach(out_arr[j])begin
      $display("The out arr values are :%d",out_arr[j]);
    end
    out_arr = {};
  end
  
  
endmodule : tb_top
