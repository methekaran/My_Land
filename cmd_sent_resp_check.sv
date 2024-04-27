//Can you write an assertion for cmd_sent with ack_resp0,resp1 & resp2 goes high only once until cmd_send goes high again
//discord question : Rozario Prince — 06/19/2023 3:37 AM
property p_ack_check;
  @(posedge clk) disable iff(!rstn) $fell(cmd_sent) |-> ((ack_resp0[->1]) and (ack_resp1[->1]) and (ack_resp2[->1]))[*1] until cmd_send[->1]; 
endproperty : p_ack_check
