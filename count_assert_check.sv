//Check if count variable increments everytime signal valid is set
property p_count_based_valid(count);
  logic[31:0] local_count;
  @(posedge clk) disable iff(!rstn) ($rose(valid),local_count=0,local_count=local_count+1) |=> (count===local_count);
endproperty : p_count_based_valid

//write_data should be stable until write_ack arrives
property p_write_data_chk;
  @(posedge clk) disable iff(!rstn) $stable(write_data) throughout write_ack[->1];  
endproperty : p_write_data_chk
  
//If valid is asserted, it should remain high until ready is received
property p_ready_valid_chk;
  @(posedge clk) disable iff(!rstn) $rose(valid) && (!ready) |-> (valid===1) throughout ready[->1] ##1 (valid===0);
endproperty : p_ready_valid_chk

