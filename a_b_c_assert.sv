//write an assertion if a is high b should be high unless c is not high.  
i. if a is high  b should be high when c is low
ii. if a is high b should be low when c  is high

//Whenever in doubt for the use of throughout refer to this link:
//https://www.design-reuse.com/articles/44987/system-verilog-assertions-simplified.html

//This should work I think  
property p_a_b_c;
  @(posedge clk) disable iff(!rst) $rose(a) |-> b throughout (!c[->1]);
endproperty : p_a_b_c
