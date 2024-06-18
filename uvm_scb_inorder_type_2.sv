class my_scb extends uvm_scoreboard#(my_seq_item);
  `uvm_component_utils(my_scb)
  
  //virtual intf
  virtual my_intf vif;
  
  //my_seq_item
  my_seq_item exp_seq_item,act_seq_item;
  
  //tlm analysis fifo
  uvm_analysis_export#(my_seq_item)exp_export;
  uvm_analysis_export#(my_seq_item)act_export;
  uvm_tlm_analysis_fifo#(my_seq_item,my_scb)exp_fifo;
  uvm_tlm_analysis_fifo#(my_seq_item,my_scb)act_fifo;
  
  function new(string name="my_scb",uvm_component component);
    super.new(name,component);
  endfunction : new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    exp_fifo = new("exp_fifo",this);
    act_fifo = new("act_fifo",this);
    exp_export=new("exp_export",this);
    act_export=new("act_export",this);
    exp_seq_item = my_seq_item::type_id::create("exp_seq_item");
    act_seq_item = my_seq_item::type_id::create("act_seq_item");
  endfunction : build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    exp_export.connect(exp_fifo.analysis_export);
    act_export.connect(act_fifo.analysis_export);
  endfunction : connect_phase
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_type_name(),$sformatf("SCB's RUN phase...!!!"),UVM_LOW)
    forever begin
      exp_fifo.get(exp_seq_item);
      act_fifo.get(act_seq_item);
      if(exp_seq_item.compare(act_seq_item))begin
        `uvm_info(get_type_name(),$sformatf("Txn Matched...!!!"),UVM_LOW)
      end
      else begin
        `uvm_error(get_type_name(),$sformatf("Txn didn't match...!!!"))
      end
    end
  endtask : run_phase
endclass : my_scb
