
package my_pkg;
  //https://verificationacademy.com/forums/t/generating-multiple-non-overlapping-chunks-of-memories-from-a-given-big-memory/39464/5

// Add a non-overlapping constraint for an address ranging from 1-4000
// generate different chunks of addresses between 1-4000
// lets generated 10 different address range
//One approach is keep track of previously generated chunks and don't generate them again.
// create a queue of start_addr+end_address range 

//Generate address of byte aligned, 16bit aligned, 32-bit aligned,64bit aligned

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  
  rand bit[15:0] address;
  rand int size;
  int  gen_addr_range[$];
  
  constraint an_address_c {
    address inside {[1:4000]};
    !(address inside {gen_addr_range});
    size inside {[20:50]};
  }
          
        function void post_randomize();
          for(int i=address; i<(address+size);i++)begin
            gen_addr_range.push_back(i);
          end
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
    end
    foreach(cls.gen_addr_range[i])begin
      $display("a generated address=%0d",cls.gen_addr_range[i]);
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



