//$isunknown: Checks if a signal is X or Z.
property p_check_inp_out_sig(sig_name);
  @(posedge clk) disable iff(!rstn) !($isunknown(sig_name));
endproperty : p_check_inp_out_sig

//check if the signal reaches to a default value after reset is asserted
property p_check_sig_after_reset(sig_name,value);
  @(posedge clk) $changed(sig_name) |-> (reset) throughout !reset[->1] ##1 (sig_name===value);
endproperty : p_check_sig_after_reset

//Glitch assertion: 
property glitch_p;
    realtime first_change;
    // realtime duration = 10;
   @(signal)  // pos and neg edge 
      // detecting every 2 changes duration
     (1, first_change = $realtime) |=> (($realtime - first_change) >= duration); // [*1:$];
Endproperty   ap_glitch_p: assert property(glitch_p); 

//clock gating assertion
property p_clk_gate_chk;
  @(posedge ref_clk) disable iff(!rstn) $fell(clk_en) |-> !clk throughout clk_en[->1];
endproperty : p_clk_gate_chk

//reset must remain high if this is a must/strict requirement then only application for assertion check
property p_rst_low_check;
  @(posedge clk) $rose(rstn) |-> (rstn===1) throughout !rstn[->1];
endproperty : p_rst_low_check

//assumption for every data inp there is a data out change it comes after 1 clock cycle
Property p_data_integrity_check;
bit[31:0] local_datain;
@(posedge clk) disable iff(!rstn) (1,local_datain=datain) |=> (dataout===local_datain);
Endproperty : p_data_integrity_check

//https://verificationacademy.com/forums/t/sv-assertion-for-clock-gating-reset-check/32495/2
  //clock gating assertion
//take a reference clock and write an assertion based on clock
property p_clk_gate();
  @(posedge ref_clk) disable iff(!rstn) $fell(clk_gate_en) |-> !clk throughout (!clk_gate_en)[->1];
endproperty : p_clk_gate

p_assert : assert(p_clk_gate);

//reset assertion 
property p_reset_assert();
  @(posedge clk) $fell(rst_en) |-> !rst throughout (rst_en)[->1];
endproperty : p_reset_assert
