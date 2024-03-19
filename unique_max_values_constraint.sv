//tb top

package my_pkg;

//Write a constraint for a 2d array such that it has a unique max value in each row and that max value should not be equal to any other max value in other rows

// lets start with 3x3 matrix and create 3 max unique values array 1-dimensional
// within 2d constraint stating do not repeat the max values in any other rows
// other row should make sure the max value from previous row is not generated

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  
  rand bit[3:0] an_array[3][3];
  rand bit[3:0] max_values[3];
  
  constraint an_array_c {
    unique{max_values};
    
    foreach(an_array[i,j]){
      foreach(an_array[,k]){
        if(j!=k){
            an_array[i][j] != an_array[i][k];  
          (an_array[i][j] < max_values[i%3]);
          }
        }
      }
  }
          
        function void post_randomize();
        foreach(an_array[i,j])begin
          if(i==0 && j==1)begin
            an_array[i][j] = max_values[i];
          end
          else if(i==1 && j==0)begin
            an_array[i][j] = max_values[i];
          end
          else if(i==2 && j==2)begin
            an_array[i][j] = max_values[i];
          end
          
        end
        
        endfunction : post_randomize
endclass : my_cls



endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  
  my_cls cls;
  
  initial begin
    cls = new();
    
    repeat(1)begin
      cls.randomize();
      foreach(cls.max_values[j])begin
        $display("Max values are:%d",cls.max_values[j]);
      end
      
      foreach(cls.an_array[i,j])begin
        $display("a value generated:%d,i=%d,j=%d",cls.an_array[i][j],i,j);
      end
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

