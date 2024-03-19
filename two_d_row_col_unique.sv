//tb top

package my_pkg;

//Write a constraint for distinct adjacent element (adjacent elements should not be the same) in a 2d array (specifically for the boundary elements size of 2d array is mxm where m can be any integer)

import uvm_pkg::*;
`include "uvm_macros.svh"

class my_cls;
  
  rand bit[3:0] an_array[3][3];
  
  constraint an_array_c {
    //an_array.size() inside {3};
    //foreach(an_array[i]){
    //  an_array[i].size()==3;
    //}
    
      foreach(an_array[i,j]){
        foreach(an_array[,k]){
          if(j!=k){
            an_array[i][j] != an_array[i][k];
          }
        }
      }
            foreach(an_array[a,b]){
              foreach(an_array[c,]){
                if(a!=c){
                  an_array[a][b]!=an_array[c][b];
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
    cls = new();
    
    repeat(1)begin
      cls.randomize();
      foreach(cls.an_array[i,j])begin
        $display("a value generated:%d,i=%d,j=%d",cls.an_array[i][j],i,j);
      end
    end
  end
  
endmodule : tb_top
