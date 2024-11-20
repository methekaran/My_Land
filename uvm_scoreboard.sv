Export port
Fifo port
Connect the fifo ports
Comparison & process exp transaction
Virtual interface
Data structure
Place holder txn
OOO scoreboard
Class my_ooo_scb extends uvm_scoreboard#(my_seq_item);
  `uvm_component_utils(my_ooo_scb)

//export port
Uvm_analysis_export#(my_seq_item)inp_export;
Uvm_analysis_export#(my_seq_item)out_export;

//tlm fifo
Uvm_analysis_tlm_fifo#(my_seq_item)inp_fifo;
Uvm_analysis_tlm_fifo#(my_seq_item)out_fifo;

//data structure 
My_seq_item inp_assoc[int];
My_seq_item out_assoc[int];

//place holder txn
My_seq_item inp_item;
My_seq_item out_item;

Int exp_item_id_q[$];
Int out_item_id_q[$];

Function new(string name=“my_ooo_scb”,uvm_component component);
   Super.new(name,component);
End function : new

Virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  If(!uvm_config_db#(virtual my_intf)::get(this,””,”my_intf”,vif))begin
    `uvm_fatal()
  end
  Inp_fifo = new(“inp_fifo”,this);
  Out_fifo = new(“out_fifo”,this);
   Inp_export=new(“inp_export”,this);
   Out_export=new(“out_export”,this);
End function : build_phase

Virtual function void connect_phase(uvm_phase phase);
  Super.connect_phase(phase);
  Inp_export.connect(inp_fifo.analysis_export);
  Out_export.connect(out_fifo.analysis_export);
End function : connect_phase

Virtual task run_phase(uvm_phase phase);
  Forever begin
    Fork
     Begin
       In_fifo.get(inp_item);
       process_item(inp_item);
     end
     Begin
        Out_fifo.get(out_item);
        out_assoc[out_item.id]=out_item;
        Out_item_id_q.push_back(out_item.id);
      end
    join
    Compare_data();
  end
End task : run_phase

Virtual task process_item(my_seq_item in_item);
  //ref model update 
  Inp_assoc[in_item.id]=in_item;
  Exp_item_id_q.push_back(in_item.id);
End task : process_item

Virtual task compare_data();
Int idx;
Wait(exp_item_id_q.size()>0 && out_item_id_q.size()>0);
   idx=Exp_item_id_q.pop_front();
   If(out_assoc.exists(idx))begin
      Inp_item=inp_assoc[idx];
      Out_item=out_assoc[idx];
      If(!inp_item.compare(out_item))begin
      
      end
      Else begin

       End
       Inp_assoc.delete(idx);
       Out_assoc.delete(idx);
    end
    Else begin
     Exp_item_id_q.push_back(idx);
     end
End task : compare_data
Endless : my_oo_scb
	
/*`uvm_analysis_imp_decl(_exp)
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
  
Endless : my_scb*/
