//Valid should be high until ready is asserted
//valid must be held high until ready is asserted high
property p_valid_ready;
  @(posedge clk) disable iff(!rstn) $rose(valid) |-> (valid===1) throughout ready[->1] ##1 (!valid);
endproperty : p_valid_ready
                                    
