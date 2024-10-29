
//A Pipelined monitor

Virtual interface
Mon analysis port
A mon seq item
Write method
Reset mechanism
Class my_pipe_mon extends uvm_monitor;
  `uvm_component_utils(my_pipe_mon)

//virtual interface
Virtual my_intf vif;

//seq item
My_seq_item mon_seq_item;

//analysis port
Uvm_analysis_port#(my_seq_item)mon_ap;

   Function new(string name=“my_pipe_mon”,uvm_component component);
     super.new(name, component);
   Ednfunction : new

Virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);
    Mon_ap = new(“mon_ap”,this;
End function : build_phase

Virtual task run_phase(uvm_phase phase);
   super.run_phase(phase);
   
Forever begin
    @(posedge vif.clk);
    If(vif.valid===1 && vif.reset===1)begin
       Mon_seq_item = my_seq_item::type_id::create(“mon_seq_item”);
       Mon_seq_item.valid = vif.valid;
       Mon_seq_item.addr = vif.addr; 
       Fork
         Collect(mon_seq_item);
      Join_none
    end 
end
Endtask : run_phase

Virtual task collect(my_seq_item mon_seq_item);
   @(posedge vif.clk);
   Mon_seq_item.id = vif.id;
 @(posedge vif.clk);
   Mon_seq_item.data = vif.data;
@(posedge vif.clk);
  Mon_seq_item.resp = vif.resp;

Mon_ap.write(mon_seq_item);
End task : collect
Endclass : my_pipe_mon 
