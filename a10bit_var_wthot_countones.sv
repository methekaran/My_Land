//tb top

//tb top

package my_pkg;

// Add a non-overlapping constraint for an address ranging from 1-4000
// generate different chunks of addresses between 1-4000
// lets generated 10 different address range
//One approach is keep track of previously generated chunks and don't generate them again.
// create a queue of start_addr+end_address range 

//Generate address of byte aligned, 16bit aligned, 32-bit aligned,64bit aligned

//nums = [1, 1, 1, 2, 2, 3]
//k = 2
//output = []
//hash_map = {}


//How to write a constraint to generate a random value of 10 bits as 1 and no two bits should be next to each other. This should be written without using $countones.
//i) 2 bits should be next to each other  total numbers of 1's will be max 5 between 1:5
//ii) can it have a value of all bits 0?
//iii) 

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand bit[9:0] a_value;
  
  constraint a_value_c {
    foreach(a_value[i]){
      if(i>0){
        if(a_value[i-1]=='b1){
        a_value[i]== ~(a_value[i-1]);
        }
      }
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
    repeat(5)begin
      $display("A_value:%0b",cls.a_value);
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
