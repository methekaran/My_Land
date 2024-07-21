//Based on http://cluelogic.com/2015/02/hidden-gems-of-systemverilog-solving-sudoku/

// Code your testbench here
// or browse Examples
package my_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  class my_cls;
    rand int sudoku[9][9];
    
    constraint c_sudoku{
      foreach(sudoku[row,col]){
        sudoku[row][col] inside {[1:9]};
      }
        
      //every row's element must be unique
        foreach(sudoku[row,col0]){
          foreach(sudoku[,col1]){
            if(col0!=col1){
              sudoku[row][col0]!=sudoku[row][col1];
            }
          }
        }
       
      //every col's element must be unique
       foreach(sudoku[row0,col]){
        foreach(sudoku[row1,]){
          if(row0!=row1){
            sudoku[row0][col]!=sudoku[row1][col];
          }
        }        
      }
            
      //every 3x3 box must be unique
            foreach(sudoku[row,col]){
              foreach(sudoku[row1,col1]){
                if(row/3==row1/3 && col/3==col1/3 && !(row==row1 && col==col1)){
                  sudoku[row][col]!=sudoku[row1][col1];
                }
              }
            
            }
    }
  endclass : my_cls
endpackage : my_pkg
                  
                  module tb;
                    import my_pkg::*;
                    
                    my_cls cls;
                    
                    initial begin
                      cls=new();
                      cls.randomize();
                      foreach(cls.sudoku[i,j])begin
                        $display("The sudoku values are=%d,row=%d,col=%d",cls.sudoku[i][j],i,j);
                      end
                    end
                  endmodule : tb


