Q: Check to make sure that a signal is high for a minimum of 2 cycles and a maximum of 6 cycles.
Signal remains high for [2:6] 

property a_sig_chk;
@(posedge clk) disable iff(!rst) $rose(signal) |-> signal[*2:6] ##1 !signal;
endproperty : a_sig_chk
