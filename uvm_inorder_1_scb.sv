//declare the analysis imports
`uvm_analysis_imp_decl(_exp)
`uvm_analysis_imp_decl(_act)

class my_scb extends uvm_scoreboard#(my_seq_item);

//virtual interface
Virtual my_intf vif;

//analysis import
uvm_analysis_imp#(my_seq_item,my_scb)ap_exp;
uvm_analysis_imp#(my_seq_item,my_scb)ap_act;

//seq item declarations
My_seq_item exp_item;
My_seq_item act_item;

//seq_item q 
My_seq_item exp_item_q[$];
My_seq_item act_item_q[$];

Function new(string name=“my_scb”,uvm_component component);
  super.new(name, component);
endfunction : new

Virtual function void build_phase(uvm_phase phase);
  Super.build_phase(phase);
  Ap_exp = new(“ap_exp”,this);
  Ap_act  = new(“ap_act”,this);
  Exp_item = my_seq_item::type_id::create(“exp_item”);
  Act_item  = my_seq_item::type_id::create(“act_item”);
 If(!uvm_config_db#(virtual my_intf)::get(this,””,”my_intf”,vif))begin
  `uvm_fatal(get_type_name(),$sformatf(“Unable to get the intf"))
end
End function : build_phase

Virtual function void write_exp(my_seq_item exp_item);
  Exp_item_q.push_back(exp_item);
End function : write_exp

Virtual function void write_act(my_seq_item act_item);
  Act_item_q.push_back(act_item);
End function : write_act

Virtual task run_phase(uvm_phase phase);
  Super.run_phase(phase);

Fork
  Forever begin
    Wait(exp_item_q.size()>0 && act_item_q.size()>0);
    Exp_item = exp_item_q.pop_front();
    Act_item  = act_item_q.pop_front();
    If(exp_item.compare(act_item))begin
      `uvm_info(get_type_name(),$sformatf(“Txn matched!!!”),UVM_LOW)
    end
    Else begin
      `uvm_error(get_type_name(),$sformatf(“Txn didn’t match!!!”))
    end
  end
  Forever begin
    @(negedge vif.rst);
      Clear();
  end
Join_any
Disable fork;

End task : run_phase

Virtual task clear();
  If(vif.rst===0)begin
   Exp_item_q = {};
   Act_item_q = {};
  end
End task : clear

Virtual function void check_phase(uvm_phase phase);
  super.check_phase(phase);
  If(exp_item_q.size==0 && act_item_q.size==0)begin
    `uvm_info(get_type_name(),$sformatf(“Size is empty!!!"),UVM_LOW)
  end
  Else begin
    `uvm_error(get_type_name(),$sformatf(“Sizes are not empty!!!”))
  end
End function : check_phase
endclass : my_scb
