//tb top

package my_pkg;

//Write constraints – to pick a ball out of 10 different colored balls and that color should not be repeated for in next 3 draws

// 10 different colors enum variable and color should not be repeated within 3 draws means we need to pick 3 colors and those should be unique

import uvm_pkg::*;
`include "uvm_macros.svh"

typedef enum bit[3:0] {RED,GREEN,BLUE,ORANGE,PURPLE,
                       WHITE,BLACK,YELLOW,PINK,BROWN} color_e; 

class my_cls;
  rand color_e my_color_q[$];
  
  constraint my_color_q_c {
    
    my_color_q.size()==3;
    //unique{my_color_q};
    foreach(my_color_q[i]){
      if(i >0){
        my_color_q[i] > my_color_q[i-1];
      }
    }
  }
  
  function void post_randomize();
      my_color_q.shuffle();    
  endfunction : post_randomize
endclass : my_cls

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls = new();
    cls.randomize();
    
    foreach(cls.my_color_q[j])begin
      $display("Colors of the balls are:%s",cls.my_color_q[j]);
    end
  end
  
endmodule : tb_top
