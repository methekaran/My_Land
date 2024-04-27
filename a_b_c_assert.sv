//write an assertion if a is high b should be high unless c is not high.  
i. if a is high  b should be high when c is low
ii. if a is high b should be low when c  is high

property p_a_b_c;
  @(posedge clk) disable iff(!rst) $rose(a) |-> b throughout c[->1];
endproperty : p_a_b_c
