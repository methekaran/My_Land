//Valid should be low until ready is asserted

property p_valid_ready;
   $rose(valid) |-> valid throughout ready[->1] ##1 !(valid);
endproperty : p_valid_ready
                                    
