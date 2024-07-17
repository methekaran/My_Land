

package my_pkg;


import uvm_pkg::*;
`include "uvm_macros.svh"

 parameter int min=0;
 parameter int max=4000;

class non_ov_addr;
  rand int start_addr_q[$];
  rand int end_addr_q[$];
  rand int size_q[$];
  rand int chunks;
  
  constraint chunks_c {
    chunks==10;
    start_addr_q.size()==chunks;
    end_addr_q.size()==chunks;
    size_q.size()==chunks;
  }
  
  constraint size_q_c {
    foreach(size_q[j]){
      size_q[j] == end_addr_q[j] - start_addr_q[j];
      size_q[j] inside {[0:100]};
    }
  }
      
  constraint non_overlap_c {
    foreach(start_addr_q[i]){
      if(i>0){
        start_addr_q[i] > end_addr_q[i-1];
      }
    }    
  }
  
  constraint start_addr_c {
    foreach(start_addr_q[i]){
      start_addr_q[i] inside {[min:max]};
      end_addr_q[i]   inside {[min:max]};
      start_addr_q[i] < end_addr_q[i];
    }
  }
  
endclass : non_ov_addr

endpackage : my_pkg

module tb;
  import my_pkg::*;
  
  non_ov_addr nva;
  
  initial begin
    nva =new();
    nva.randomize();
    
    foreach(nva.start_addr_q[j])begin
      $display("The start_address=%0d, size=%0d,end_addr=%0d",nva.start_addr_q[j],nva.size_q[j],nva.end_addr_q[j]);
    end
  end
  
endmodule : tb
