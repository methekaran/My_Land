//tb top

package my_pkg;

//write a constraint for generating leap years
// Leap year only when a n year is divisible by %4==0
//Century years should be divisible by 400

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  rand int leap_year_check;
  rand bit yes_or_no;
  
  constraint lp_check{
    leap_year_check inside {[1:4000]};
    
    if(leap_year_check % 100==0){
      if(leap_year_check %400==0){
        yes_or_no==1; 
      }
      else {
        yes_or_no==0;
      }
    }
    else{
      if(leap_year_check%4==0){
      	yes_or_no==1;
      }
      else{
        yes_or_no==0;  
      }
    }
  }
  
endclass : my_cls



endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls = new();
    
    repeat(10)begin
      cls.randomize();
      if(cls.yes_or_no==1)begin
        $display("This is a leap year=%0d",cls.leap_year_check);
      end
      else begin
        $display("This is not a leap year=%0d",cls.leap_year_check);
      end
    end
  end
  
endmodule : tb_top
