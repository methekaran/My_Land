//Write an assertion: A is high for 5 cycles and B is high after 4 non-contiguous highs of A and finally both A and B are high

property p_a_and_b_cycles;
  @(posedge clk) disable iff(!rstn) A[=4] |-> B ##1 A[->1];
endproperty : p_a_and_b_cycles
