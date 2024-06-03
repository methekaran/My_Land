
//Write an assertion for checking the duty cycle or frequency against given tolerance and frequency 
//Based on this link : https://verificationacademy.com/forums/t/sva-to-check-frequency-and-duty-cycle-with-5-error/38602/2
//This checks for half duty cycle
//e.g. a half_duty_cycle=5ns, tolerance is 2
//then based on below assertion, current_time=3ns and after negedge the time is 8ns
//the different is 5ns >= 5-(5*2/100)(4.90ns) to  && 
//5<=(5+(5*2/100)) (5.10ns)

property chk_duty_cycle(int tolerance,realtime half_duty_cycle);
  realtime current_time;
  @(posedge clk) (1,current_time=$realtime()) |-> 
  @(negedge clk) ($realtime-current_time) >= (half_duty_cycle - ((half_duty_cycle*tolerance)/100)) &&
                 ($realtime-current_time) <= (half_duty_cycle+((half_duty_cycle*tolerance)/100));                                    
endproperty : chk_duty_cycle

//Notice the change between above and below assertion
property chk_full_duty_cycle(int tolerance,realtime full_duty_cycle);
  realtime current_time;
  @(posedge clk) (1,current_time=$realtime()) |=> 
  ($realtime-current_time) >= (full_duty_cycle - ((full_duty_cycle*tolerance)/100)) &&
  ($realtime-current_time) <= (full_duty_cycle + ((full_duty_cycle*tolerance)/100));                                    
endproperty : chk_full_duty_cycle
