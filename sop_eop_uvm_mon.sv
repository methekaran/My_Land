
class my_mon extends uvm_monitor;
  `uvm_component_utils(my_mon)

//virtual interface
virtual my_intf vif;

//monitor seq item
my_seq_item mon_seq_item;

function new(string name="my_mon",uvm_component component);
  super.new(name,component);
endfunction : new

//build phase
virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db#(virtual my_intf)::get(this,"","my_intf",vif))begin
     `uvm_fatal(get_full_name(),$sformatf("Unable to get the interface!!!"))
  end
endfunction : build_phase

virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);

  forever begin
    fork
      begin
        @(posedge vif.clk);
        wait(vif.valid===1 && vif.sop===1);
        mon_seq_item = my_seq_item::type_id::create("mon_seq_item");
        mon_seq_item.sop=vif.sop;
        mon_seq_item.sop=vif.valid;
        do begin
          mon_seq_item.data.push_back(vif.data);
          @(posedge vif.clk);
        end while(vif.eop!==1 && vif.valid===1);
        if(vif.eop===1)begin
          mon_ap.write(mon_seq_item);
        end
      end
      begin
        @(negedge vif.rstn);
      end
    join_any
    disable fork;
  end
endtask : run_phase

endclass : my_mon
