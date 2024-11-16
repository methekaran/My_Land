initial begin
              fork
                begin : thrd_1
                  $display("My 1st thread!!!");
                  #5;
                  $display("My 1st thread is ended!!!");
                end
                begin : thrd_2
                  $display("My 2nd thread!!!");
                  #10;
                  $display("My 2nd thread is ended!!!");
                end
              join_any
              disable thrd_2;// disable by label
              #40 $finish;
            end
            
            bit clk;
            initial begin
              forever begin
                #5 clk = ~clk;
              end
            end
            
