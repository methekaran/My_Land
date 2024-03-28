//tb top

//tb top

package my_pkg;


//Write SV constraint to limit sum of odd elements of an array to be 30 and sum of even elements to be 60
//1 create a one dimensional array
//2 can we use sum method to generate this?
//3 use sum method with index of the item if even or based on odd and then generate the sum

//Write a constraint for 4 monkeys having to share 10 bananas and make sure every monkey gets atleast 1 banana
// create a data structure which will have 4 monkeys and sum of all the banans should be 10 and every element or monkey should get atleast 1 banana

/*class test;
  rand bit [7:0] arr[];
  constraint sz{
    arr.size() == 10;
  }
  constraint un {
    arr.sum() with (int'((item.index%2 == 0) ? item%2 == 0 : item%2 != 0)) == 10;
  }*/ 


import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[7:0] one_hot_v[8];
  
  constraint monkeys_c {
      foreach(one_hot_v[i]){
        $onehot(one_hot_v[i]);
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
    foreach(cls.one_hot_v[j])begin
      $display("One hot values:%d",cls.one_hot_v[j]);
    end
  end
  
endmodule : tb_top



//assertion Q: data/address shouldnt change while en is high.

//property data_p;
//@(posedge clk) disable iff(~resetn) (en===1) |-> throughout $stable(data) $fell(en)[->1];
//endproperty : data_p

//property addr_p;
//  @(posedge clk) disable iff(~resetn) (en===1) |-> throughout $stable(addr) $fell(en)[->1]; 
//endproperty : addr_p
