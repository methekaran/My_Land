Class my_mon extends uvm_monitor;
  `uvm_component_utils(my_mon)

// virtual if
Virtual my_intf vif;

//seq item handle
My_seq_item seq_item;

//analysis port
uvm_analysis_port#(my_seq_item)inp_port;

Function new(string name=“my_mon”,uvm_component component);
  super.new(name, component);
End function : new

Virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
 
  If(!uvm_config_db#(virtual my_inft)::get(this,””,”vif”,vif))begin
     `uvm_fatal(get_type_name(),$sformatf(“unable to get the intf!!!"))
  end
 Inp_port=new(“inp_port”,this);
endfunction : build_phase

Virtual task run_phase(uvm_phase phase);
 super.run_phase(phase);

Forever begin
   Fork
     Begin
       @(posedge clk);
        If(vif.en===1 && vif.rst===1)begin
        //create the seq_item
        seq_item = my_seq_item::type_id::create(“seq_item"); 
        seq_item.in1 = vif.in1;
        seq_item.in2 = vif.in2;
        Inp_port.write(seq_item);
     end
    Begin
      @(negedge !rstn);
       //create the seq_item
        seq_item = my_seq_item::type_id::create(“seq_item"); 
      seq_item.rst=vif.rstn;
      seq_item.en=0;
      Seq_item.in1=0;
      seq_item.in2=0;
      Inp_port.write(seq_item);
   end
  Join_any
  Disable fork;
end
End task : run_phase

Endclass : my_mon


//AXI BUS Capture the AWADDR, AWDATA, WSTRB, AID,
I) awvalid, awready

Forever begin
  Fork 
    Begin
      @(posedge axi_if.ACLK);
      If(axi_if.awvalid===1)begin
       Axi_mon_seq_item = axi_seq_item::type_id::create(“axi_mon_seq_item”);
       Axi_mon_seq_item.awaddr = axi_if.awaddr;
       Axi_mon_seq_item.awid        = axi_if.aid;
      end
    end
  Join_none
end


  class my_monitor extends uvm_monitor;
 
  virtual intf vif;
 
// ...
 
  task run_phase();
    forever begin
       txn = seq_item::type_id::create(“txn”);
        if(vid.valid) begin
            @(posedge vif.monitor_cb);
            // addr
            txn.addr = vif.addr;
            txn.valid = vif.valid;
                fork
                  collect(txn)
                join_none
        end
        else begin
          @(posedge vi.monitor_cb);
        end
    end
  endtask 
endclass
 
task automatic collect(seq_item txn);
            @(posedge vif.monitor_cb);
            txn.op = vif.op;
            @(posedge vi.monitor_cb);
            txn.data = vif.data;
            @(posedge vi.monitor_cb);
            txn.resp = vif.resp;
            ap.write(txn);     
endtask


Class my_drv
