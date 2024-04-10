
//rand bit[31:0] addr[];
//rand int idx[];

//size of addrs : 10
//at least, there should be one address which is not multiple of 4
//First u create an array of size 10 and then randomaly select that index which you dont want the address to be of multiple of 4
//Then check with %MOD operator to see rest of the addresses are %4 and only 1 is not MOD of 4

/*

int a[], b[], c[$];
a = '{0, 1, 2, 3, 4};
b = a; //can we do this ? why and why not?
b = new[a.size()](a);
c = a;
c = {a,b};

Display arry for every integer value.
int array[uvm_object][string][int][$][];

*/
//Req if not seen in 5 mircoseconds should throw error.

package my_pkg;


import uvm_pkg::*;
`include "uvm_macros.svh"

class my_class;
  rand bit[7:0] address_q[10];
  rand bit[3:0] index_of_4;
  
  constraint addr_c {
    index_of_4 inside {[0:9]};
    foreach(address_q[i]){
      if(i==index_of_4){
        !(address_q[i] %4==0);
      }
      else {
        (address_q[i] %4==0);
      }
    }
  }
endclass : my_class

endpackage : my_pkg

module tb_top;
  import my_pkg::*;
  my_class cls;
  bit clk;
  bit req=0;
  bit flag=0;
  
  int a[];
  int b[]; 
  int c[$];
 
  initial begin
     a = '{0, 1, 2, 3, 4};
 	 b = a; 
     b = new[a.size()](a);   
  
    cls=new();
    cls.randomize();
    foreach(cls.address_q[i])begin
      $display("Cls.address=%0h",cls.address_q[i]);
    end
  end
  
  initial begin
    foreach(a[i])begin
      $display("a[i]=%d && b[i]=%d",a[i],b[i]);
    end
    $display("The size of the array=%d",b.size());
  end
  
  initial begin//Initial begin in itself is a thread forever begin will hold the thread until it ends the simulation
    forever begin
      #5ns clk = ~clk;
    end
  end
  
  initial begin
    fork 
    forever begin
      #1us;
      req<=1'b1;
    end
      
    join_none
    
    fork
      begin
    	#5us;
        $display("Done WAITING!!!!");
      end
      begin
        wait(req===1);
        flag=1;
      end
    join_any
    disable fork;
    if(flag==0)begin
   		$error("The flag was never set");
  	end
    else begin
      $display("flag is set to 1!!!");
    end
    #10us;
    $finish();
  end
        
endmodule : tb_top
