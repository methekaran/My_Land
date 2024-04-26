//data/address shouldnt change while en is high
//Data should be stable while en is high
//Address should be stable while en is high

property p_data_stable;
  @(posedge clk) disable iff(!rst) $rose(en) |-> $stable(data) throughout !en[->1]; 
endproperty : p_data_stable
