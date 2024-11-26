//When the positive edge of signal “a” is detected, check signal “b” has to be high continuously until signal “c” goes low.
//Whenever in doubt for the use of throughout refer to this link:
//https://www.design-reuse.com/articles/44987/system-verilog-assertions-simplified.html

//This should work I think  
property p_a_b_c;
  @(posedge clk) disable iff(!rst) $rose(a) |-> b throughout (!c[->1]);
endproperty : p_a_b_c

//write an assertion if a is high b & c should be high together.  
i. if a is high  b should be high when c is low
ii. if a is high b should be low when c  is high
  property p_a_b_c_chk;
    @(posedge clk) disable iff(!rstn) $rose(a) |-> !(b && c);
  endproperty : p_a_b_c_chk
