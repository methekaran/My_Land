//tb top

package my_pkg;

//For a 8 bit variable if the past randomization resulted in a odd value, the next randomization should be even with 75% probability else be even with 25% probability. 

//i) 8 bit variable past randomization is stored in post_randomize (3)
//ii) To decide next randomization it should be even :=75 (even) (odd:=25)
//iii) Else :=25% probability of generating even (odd :=75)

import uvm_pkg::*;
`include "uvm_macros.svh"

//5,7,6,4,3,2

class my_cls;
  
  rand bit[7:0] even_odd_num;
  bit[7:0] prev_value;
  
  constraint even_odd_num_c {
    if(prev_value%2!=0){
      (even_odd_num[0]) dist {0:=75,1:=25};
    }
    else {
      (even_odd_num[0]) dist {0:=25,1:=75};
    }
  }
   function void post_randomize();
     prev_value = even_odd_num;
   endfunction : post_randomize
  
endclass : my_cls

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls = new();
    
    repeat(10)begin
    cls.randomize();
      $display("The even_odd number are=%0h, prev_val=%0h",cls.even_odd_num,cls.prev_value);
    end
    
  end
  
endmodule : tb_top
