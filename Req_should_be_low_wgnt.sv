//If REQ happen GNT should happen in the next clock cycle.    REQ |->##1 GNT .    If REQ should never happen while GNT is asserted

//i) once req is asserted gnt should be asserted in next clock cycle
//ii) if gnt is high req should never be asserted

property req_gnt_not_happen;
  @(posedge clk) disable iff(!rstn) $rose(REQ) |=> (REQ) throughout GNT[->1]; 
endproperty : req_gnt_not_happen
