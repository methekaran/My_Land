/*Can anyone help with this ?, 
Create an assertion that checks that is a READ command is issued to a SDRAM – the data output is never X after the CAS latency 
i) read is asserted
ii) out data should never be X
iii) tCAS_Lat=5ns*/

property p_cas_lat_check(tCAS_LAT);
  @(posedge clk) disable iff(!rst_n) (read===1) |-> ##tCAS_LAT !($isunknown(out_data));
endproperty : p_cas_lat_check
