package my_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"


endpackage : my_pkg

module my_tb;
  import my_pkg::*;
  
  //define clock
  bit clk;
  
  //instantiate the interaface
  my_intf vif(clk);
    
  //instantiate the dut
    my_dut d(vif);
    
  //set the interface
  initial begin
    uvm_config_db#(virtual my_intf)::set(null,"*","vif",vif);
  end
  
  initial begin
    vif.reset <=0;
    vif.req =0;
    #5ns vif.reset<=1;
    
    
    #200ns; 
    $finish();
  end
  
  initial begin
    fork
  		forever begin
     	 #5ns clk=~clk;
    	end
    	forever begin
      	#10ns vif.req <= ~vif.req;
    	end
    join_none
  end
endmodule : my_tb

// Code your design here
// Code your design here
interface my_intf(input bit clk);
  logic reset;
  logic req;
  logic gnt;
  
  //modport dut(input reset,input req,output gnt);
  //modport tb(input gnt,output req, output reset);
endinterface : my_intf

module my_dut(my_intf vif);
  
  always_ff@(posedge vif.clk or negedge vif.reset)begin
    if(!vif.reset)begin
      vif.gnt <=0;
    end
    else begin
      if(vif.req===1'b1)begin
        vif.gnt <= vif.req;
        $strobe("1.time:%t, gnt=%d,req=%d",$time,vif.gnt,vif.req);
      end
      else begin
        vif.gnt <=0;
        $strobe("2.time:%t, gnt=%d,req=%d",$time,vif.gnt,vif.req);
      end
    end
  end
 
 
  
  property p_req_gnt_count;
   int req_cnt=0;
   int gnt_cnt=0;
    @(posedge vif.clk) disable 
    iff(!vif.reset) ($rose(vif.req),req_cnt++,$display("r_time:%t req_cnt=%d",$time,req_cnt)) ##1 
    ($rose(vif.gnt),gnt_cnt++,$display("g_time :%t gnt_cnt=%d",$time,gnt_cnt)) |-> (req_cnt===gnt_cnt); 
  endproperty : p_req_gnt_count
  
  property p_req_gnt_rose;
    @(posedge vif.clk) disable iff(!vif.reset) $rose(vif.req) ##1 $rose(vif.gnt) |-> (vif.req===0)[->1] ##1 $fell(vif.gnt);
  endproperty : p_req_gnt_rose
  
  property p_gnt_one_h;
    @(posedge vif.clk) disable iff(!vif.reset) $rose(vif.req) |=> $onehot(vif.gnt);
  endproperty : p_gnt_one_h
  
  p_one_h_chk : assert property(p_gnt_one_h);
  
  
    p_req_gnt_chk_r : assert property(p_req_gnt_rose)
  $display("time:%t The assertion passed!!!",$time);
  else 
    $error("time :%t It failed req=%d,gnt=%d",$time,vif.req,vif.gnt);
      
      p_req_gnt_cnt_chk: assert property (p_req_gnt_count)
        $display("REQ_GNT_CHK: passed");
        else
          $error("Count assert failed...");
   
endmodule : my_dut

// Additional properties
//data integrity check
/*property p_data_a;
  logic[31:0] data_in;
  @(posedge vif.clk) disable iff(!vif.reset) ($rose(a),data_in=vif.datain) |-> ##3 (vif.dataout=data_in);
endproperty : p_data_a*/




// Code your design here
// Code your design here
interface my_intf(input bit clk);
  logic reset;
  logic req;
  logic gnt;
  
  //modport dut(input reset,input req,output gnt);
  //modport tb(input gnt,output req, output reset);
endinterface : my_intf

module my_dut(my_intf vif);
  
  always_ff@(posedge vif.clk or negedge vif.reset)begin
    if(!vif.reset)begin
      vif.gnt <=0;
    end
    else begin
      if(vif.req===1'b1)begin
        vif.gnt <= vif.req;
        $strobe("1.time:%t, gnt=%d,req=%d",$time,vif.gnt,vif.req);
      end
      else begin
        vif.gnt <=0;
        $strobe("2.time:%t, gnt=%d,req=%d",$time,vif.gnt,vif.req);
      end
    end
  end
 
 
  
  property p_req_gnt_count;
   int req_cnt=0;
   int gnt_cnt=0;
    @(posedge vif.clk) disable 
    iff(!vif.reset) ($rose(vif.req),req_cnt++,$display("r_time:%t req_cnt=%d",$time,req_cnt)) ##1 
    ($rose(vif.gnt),gnt_cnt++,$display("g_time :%t gnt_cnt=%d",$time,gnt_cnt)) |-> (req_cnt===gnt_cnt); 
  endproperty : p_req_gnt_count
  
  property p_req_gnt_rose;
    @(posedge vif.clk) disable iff(!vif.reset) $rose(vif.req) |-> ##1 $rose(vif.gnt);
  endproperty : p_req_gnt_rose
  
  property p_req_gnt_fell;
    @(posedge vif.clk) disable iff(!vif.reset) $fell(vif.req) |-> ##1 $fell(vif.gnt);
  endproperty : p_req_gnt_fell
  
  property p_gnt_one_h;
    @(posedge vif.clk) disable iff(!vif.reset) $rose(vif.req) |=> $onehot(vif.gnt);
  endproperty : p_gnt_one_h
  
  p_one_h_chk : assert property(p_gnt_one_h);
  
  p_req_gnt_chk_f : assert property(p_req_gnt_fell)
    $display("time:%tThe fell assertion passed!!!",$time);
    else
      $error("The fell one failed:%t req:%d, gnt:%d",$time,vif.req,vif.gnt);
  
    p_req_gnt_chk_r : assert property(p_req_gnt_rose)
  $display("time:%t The assertion passed!!!",$time);
  else 
    $error("time :%t It failed req=%d,gnt=%d",$time,vif.req,vif.gnt);
      
      p_req_gnt_cnt_chk: assert property (p_req_gnt_count)
        $display("REQ_GNT_CHK: passed");
        else
          $error("Count assert failed...");
   
endmodule : my_dut

// Additional properties
        //data integrity check
/*property p_data_a;
  logic[31:0] data_in;
  @(posedge vif.clk) disable iff(!vif.reset) ($rose(a),data_in=vif.datain) |-> ##3 (vif.dataout=data_in);
endproperty : p_data_a*/
        
