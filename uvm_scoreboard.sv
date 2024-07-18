
`uvm_analysis_imp_decl(_exp)
`uvm_analysis_imp_decl(_act)

class my_scb extends uvm_scoreboard#(my_seq_item);
  `uvm_component_utils(my_scb)

//virtual interface
virtual interface vif;

//analysis_imports
uvm_analysis_imp_exp#(my_seq_item,my_scb)exp_ap;
uvm_analysis_imp_act#(my_seq_item,my_scb)act_ap;

//sequence item data structure
My_seq_item exp_seq_item[int][$];
My_seq_item act_seq_item[int][$];
My_seq_item exp_item;
My_seq_item act_item;

Function new(string name=“my_scb”,uvm_component component);
  super.new(name, component);
End function : new

Virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  If(!uvm_config_db#(virtual my_intf)::get(this,””,”my_intf”,vif))begin
  `uvm_fatal()
end
Exp_ap = new(“exp_ap”,this);
Act_ap = new(“act_ap”,this);
Exp_item=create();
Act_item=create();
Endfunction : build_phase

Virtual function void write_exp(my_seq_item exp_item);
  Exp_seq_item[exp_item.id].push_back(exp_item);
End function : write_exp

Virtual function void write_act(my_seq_item act_item);
  Act_seq_item[act_item.id].push_back(act_item);
End function : write_act

Virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);

Forever begin
  Fork
      Begin
         Wait(exp_seq_item.size() >0 && act_seq_item.size()>0);
         Foreach(exp_seq_item[I,j])begin
           If(act_seq_item.exists(i))begin
              exp_item = exp_seq_item[I].pop_front();
              Act_item = act_seq_item[I].pop_front();
              If(exp_item.compare(act_item))begin
                `uvm_info()
 		end
               Else begin
                  `uvm_error()
               end
               Exp_seq_item.delete(i);
               Act_seq_item.delete(i);
            end
	 end
      end
     Begin
         @(negedge vif.rstn)begin
           Clear_queue();
	end
      end
   Join_any
   Disable fork;
end
End task : run_phase

   virtual function clear_queue();
          foreach(exp_seq_item_assoc[i])begin
            exp_seq_item_assoc.delete(i);
          end
          
          foreach(act_seq_item_assoc[j])begin
            act_seq_item_assoc.delete(j);
          end
        endfunction : clear_queue
  
Endless : my_scb
