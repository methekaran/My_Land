//tb top

//tb top

/*
Statement: Write a constraint for 10 elements with even index and odd index elements sum accounts to 10
class test;
  rand bit [7:0] arr[];
  constraint sz{
    arr.size() == 10;
  }
  constraint un {
    arr.sum() with (int'((item.index%2 == 0) ? item%2 == 0 : item%2 != 0)) == 10;
  }*/ 


package my_pkg;


//Write a constraint for 4 monkeys having to share 10 bananas and make sure every monkey gets atleast 1 banana
// create a data structure which will have 4 monkeys and sum of all the banans should be 10 and every element or monkey should get atleast 1 banana

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[3:0] monkeys[4];
  
  constraint monkeys_c {
    monkeys.sum() with (int'(item))==10;
    foreach(monkeys[i]){
      monkeys[i] > 0;
    }
  }
endclass : my_cls

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls= new();
    cls.randomize();
    //repeat(5)begin
    foreach(cls.monkeys[j])begin
      $display("A_value:%d",cls.monkeys[j]);
    end
  end
  
endmodule : tb_top

