Read and write should not be asserted together

Property p_read_write;
 @(posedge clk) disable iff(!rst) !(read && write); 
Endproperty : p_read_write
