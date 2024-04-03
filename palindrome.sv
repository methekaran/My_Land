//tb topo
//Checking if the number is palindrome or not
//333
// take number % 10= remainder 333 %10 =33
// new_num = remainder + 10 * new_num
// n = n /10 33

package my_pkg;


import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  
  
endclass : my_cls

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  int a_num = 333;
  string my_str="daab";
  string out_str="";
  
  int temp_num=a_num;
  int final_num=0;
  int remainder=0;
  
  initial begin
    while(a_num>0)begin
      remainder = a_num % 10;
      final_num = remainder + 10*final_num;
      a_num = a_num / 10;
      $display("Final num:%d",final_num);
    end
    
    for(int i=my_str.len();i>=0; i--)begin
      out_str = {out_str,my_str[i]};
    end
    $display("Output string is :%s",out_str);
    
    if(temp_num==final_num)begin
      $display("The given number is a palindrome!!!");
    end
    else begin
      $display("The number is not a palindrome number!!!");
    end
  end
  
  initial begin
    
  end
  
endmodule : tb_top
