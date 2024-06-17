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
