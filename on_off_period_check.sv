//Also, can anyone please help me with writing a checker for ON period and OFF period of the clock generated 

//1. Consider there is a ref_clk
//2. Measure the on_period using $rose on the clock signal with $fell on the edge
//3. Measure the off_period using $fell on the clock to next $rose


property chk_on_time_p(on_time);
realtime on_period;
  @(posedge ref_clk) disable iff(!rstn) ($rose(clk),on_period=$realtime()) |-> ($fell(clk),$realtime-on_period==on_time);
endproperty : chk_on_time_p
