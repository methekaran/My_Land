package my_pkg;


//Write a constraint to divide values of 1 queue into 3 queues so that all 3 queues have unique elements

//One approach is create unique values with 1 queue and then 3 empty queues 
//each one of the queue is unique elements
//index elements
import uvm_pkg::*;
`include "uvm_macros.svh"

//5,7,6,4,3,2

class my_cls;
  
  rand bit[7:0] one_q[$];
  
      bit[7:0] q1[$];
      bit[7:0] q2[$];
      bit[7:0] q3[$];
    
  constraint one_q_c {
    (one_q.size()%3==0);
    one_q.size()<16;
    foreach(one_q[i]){
      if(i>0){
        one_q[i] > one_q[i-1];
      }
    }
  }
        
        function void post_randomize();
  
      
      foreach(one_q[i])begin
        if(i%3==0)begin
          q1.push_back(one_q[i]);
        end
        else if(i%2==0)begin
          q2.push_back(one_q[i]);
        end
        else begin
          q3.push_back(one_q[i]);
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
    cls.randomize();
    
    foreach(cls.one_q[i])begin
      $display("ONE_Q values:%0h",cls.one_q[i]);
      end
    
    foreach(cls.q1[j])begin
      $display("The values of Q1:%0h",cls.q1[j]);
    end
    
    foreach(cls.q2[j])begin
      $display("The values of Q2:%0h",cls.q2[j]);
    end
    
    foreach(cls.q3[j])begin
      $display("The values of Q3:%0h",cls.q3[j]);
    end
  end
  
endmodule : tb_top



