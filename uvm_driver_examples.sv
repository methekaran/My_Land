/* Example from Chip dev channel
Build a router circuit which forwards data from the input (din) to one of four outputs (dout0, dout1, dout2, or dout3), specified by the address input (addr).

The address is a two bit value whose decimal representation determines which output value to use. Append to dout the decimal representation of addr to get the output signal name dout{address decimal value}. For example, if addr=b11 then the decimal representation of addr is 3, so the output signal name is dout3.

The input has an enable signal (din_en), which allows the input to be forwarded to an output when enabled. If an output is not currently being driven to, then it should be set to 0.

Input and Output Signals
din - Input data.
din_en - Enable signal for din. Forwards data from input to an output if 1, does not forward data otherwise.
addr - Two bit destination address. For example addr = b11 = 3 indicates din should be forwarded to output value 3 (dout3).
dout0 - Output 0. Corresponds to addr = b00.
dout1 - Output 1. Corresponds to addr = b01.
dout2 - Output 2. Corresponds to addr = b10.
dout3 - Output 3. Corresponds to addr = b11.*/

//sequence item will have below info
//din, bit [31:0] dout_0to3 and din_en
class my_seq_item extends uvm_sequence_item;
  rand bit[31:0] din;
  rand bit din_en;
  bit[31:0] dout_0;
  bit[31:0] dout_1;
  bit[31:0] dout_2;
  bit[31:0] dout_3;

  `uvm_object_utils_begin(my_seq_item)
    `uvm_field_int(din,UVM_ALL_ON)
    `uvm_field_int(dout_0,UVM_ALL_ON)
    `uvm_field_int(dout_1,UVM_ALL_ON)
    `uvm_field_int(dout_2,UVM_ALL_ON)
    `uvm_field_int(dout_3,UVM_ALL_ON)
    `uvm_field_int(din_en,UVM_ALL_ON)
  `uvm_object_utils_end

  constraint din_c {
    din inside {[0:'hf0f0f0f0f0]};
    din_en dist {0:=10,1:=90};
  }
endclass : my_seq_item

class my_drv extends uvm_driver#(my_seq_item);
  
  //virtual interface
  virtual my_intf vif;

   //reset rst_cfg
   reset_cfg rst_cfg;
   
  //new method
  function new(string name="my_drv",uvm_component component);
    super.new(name,component);
  endfunction : new

//build method
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual my_intf)::get(this,"","my_intf",vif))begin
      `uvm_fatal(get_type_name(),$sformatf("Not able to get the intf"))
    end
  endfunction : build_phase

  //run_phase
  virtual task run_phase(uvm_phase phase);
   super.run_phase(phase);

   forever begin
    fork
      begin
        if(rst_cfg.rst==1)begin
          drive_rst();
        end
      end
      begin
        if(rst_cfg.rst==0)begin
          seq_item_port.get_next_item(req);
		@(posedge vif.clk);
            vif.resetn<=1'b1;
            vif.din <= req.din;
            vif.din_en <= req.din_en;
          seq_item_port.item_done(req);
        end
      end
    join_any
   end
  endtask : run_phase

  virtual task drive_rst();
    vif.resetn <=1'b0;
  endtask 
  `uvm_component_utils(my_drv)
endclass : my_drv



Class bir_non_pipe_drv extends uvm_driver#(my_seq_item);
   `uvm_component_utils(bir_non_pipe_drv)

//virtual interface handle
Virtual my_intf vif;

Function new(string name=“bir_non_pipe_drv”,uvm_component component);
  Super.new(name, component);
Endfunction : new

Virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  If(!uvm_config_db#(virtual my_intf)::get(this,,”my_intf”,vif))begin
    `uvm_fatal(get_type_name(),$sformatf(“Unable to get the interface!!!"))
  end
End function : build_phase

Virtual task run_phase(uvm_phase phase);
   Fork
       drive_signals();
    join
End task : run_phase

Virtual task drive_signals();
   Forever begin
     seq_item_port.get_next_item(req);
     @(posedge vif.clk);
       If(req.rst_active==1)begin
          vif.reset <= 1’b1;
	end
        Else begin
           Vif.reset <= 1’b0;
         end 

      If(req.rst_active==0)begin
         //valid,RNW and write data
         Vif.valid <=1’b1;
          vif.RNW <=req.RNW;
          If(req.RNW==0)begin
            Vif.wdata <= req.wdata;
          end
          While(vif.ready!==1’b1)begin
             @(posedge vif.clk);
           end
          If(req.RNW==1’b1)begin
            While(vif.ready==1)begin
               req.data = vif.data;
               Req.error = vif.error;
            end
          end
        vif.valid <=0;
       end
      seq_item_port.item_done();
   end
Endless : bir_non_pipe_drv

Class my_pipe_driver extends uvm_driver#(my_seq_item);
   `uvm_component_utils(my_pipe_driver)

//virtual interface
Virtual my_intf vif;

//semaphore for pipeline stage
Semaphore sem;

Function new(string name=“my_pipe_driver”,uvm_component component);
  super.new(name, component);
End function : new

Virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);

   If(!uvm_config_db#(virtual my_intf)::get(this,”",”my_intf”,vif))begin
      `uvm_fatal(get_type_name(),$sformatf(“Unable to get the intf!!!")
   end
  Sem =new(1);
End function : build_phase

Virtual task run_phase(uvm_phase phase);
  Super.run_phase
  Fork
     Transfer_pipeline_txn;
     Transfer_pipeline_txn;
  Join
End task : run_phase

Virtual task automatic transfer_pipeline_txn;
   Forever begin
      Sem.get();
      seq_item_port.get(req);
      @(posedge vif.HCLK);
      Vif.haddr <= req.haddr;  
      vif.hburst <= req.hburst;
      vif.hwdata <= req.hwdata;
      While(vif.hready!==1)begin
        @(posedge vif.clk);
      end
     Sem.put();
     If(req.hwrite==1)begin
       Vif.hwdata <= req.hwdata;
       While(vif.hready!==1)begin
          @(posedge vif.clk);
       end
       req.hresp = vif.hresp;
     end
    Else begin
       While(vif.hready!==1)begin
         req.hrdata= vif.hrdata;
         req.hresp. = vif.hresp;
       end
    end
    seq_item_port.put(req);
   end
End task : transfer_pipeline_txn

Endless : my_pipe_driver
