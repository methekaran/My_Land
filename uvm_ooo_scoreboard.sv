//4 tlm analysis fifo
//4 uvm analysis exports
//2 associative arrays with port id as the key
//2 helper items
 
Class my_scb extends uvm_scoreboard#(my_scb);
  `uvm_component_utils(my_scb)

 //4 tlm analysis fifo
Uvm_tlm_analysis_fifo#(my_seq_item) in_fifo0,in_fifo1,in_fifo2,in_fifo_3;
Uvm_tlm_analysis_fifo#(my_seq_item) out_fifo0,out_fifo1,out_fifo2,out_fifo3;

//analysis export
Uvm_analysis_export#(my_seq_item)in_export0,in_export1,in_export2,in_export3;
Uvm_analysis_export#(my_seq_item)out_export0,out_export1,out_export2,out_export3;

//2 associative arrays
My_seq_item exp_assoc_arr[int][$];
My_seq_item act_assoc_arr[int][$];

  Function new(string name=“my_scb”,uvm_component parent);
    super.new(name, component);
  End function : new

 Virtual function void build_phase(uvm_phase phase);
  Super.build_phase(phase);
  If(!uvm_config_db#(virtual my_port0)::get(this,””,”my_intf”,vif))begin
    `uvm_fatal()
  end 
End function : build_phase

Virtual function void connect_phase(uvm_phase phase);
  super.connect_phase(uvm_phase phase);
In_export0.connect(in_fifo0.analysis_export);
In_export1.connect(in_fifo1.analysis_export);
End function : connect_phase

Virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);
  Int id;

  Forever begin
   fork
      Begin
         Fork
         Begin
          In_fifo0.get(in_item0);
          Exp_assoc_arr[in_item0.id].push_back(in_item0);   
          end
          Begin
          In_fifo1.get(in_item1);
         
          In_fifo2.get(in_item2);
          In_fifo3.get(in_item3);
          join
      End
      Begin
      end
      Begin
          Wait(exp_assoc_arr.size()>0 && act_assoc_arr.size()>0);
          Foreach(exp_assoc_arr[I])begin
            If(act_assoc_arr.exists(i))begin
               Exp_seq_q= exp_assoc_arr[I];
               Act_seq_q= act_assoc_arr[I];
               Foreach(exp_seq_q[j])begin
                  Act_item= act_seq_q.pop_front();
                 Exp_item=exp_seq_q.pop_front();
                 If(act_item.compare(exp_item))begin
                   `uvm_info
                 end
                 Else begin
                  `uvm_error
                 end
                end
                Exp_assoc_arr.delete(i);
                Act_assoc_arr.delete(i);
            end
           end
      end
      begin
         @(negedge vif.rstn);
         Flush_all();
       end
   Join_any
 end
End task : run_phase

Virtual task flush_all();
   Foreach(exp_assoc_arr[j])begin
    Exp_assoc_arr.delete(j);
  end
  Foreach(act_assoc_arr[j])begin
   act_assoc_arr.delete(j);
  end
End task : flush_all
Endless : my_scb
