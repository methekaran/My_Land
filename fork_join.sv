
//In order to start all the threads parallely in a for loop
//we need to use fork join_none with an automatic variable otherwise
//all the threads will see the value of 5 of idx if we just use non-automatic variable
//Also, if we use fork join/join_any it will execute the threads sequentially.
initial begin
            evt1= new();
            for(int idx=0;idx<5;idx++)begin
              automatic int t_idx=idx;//The automatic statement has to be here because the fork is threading the id's and hence id's would be distinct 0,1,2,3,4 if it's inside below begin statement then the values would be 5,5,5,5,5 for all the threads
              fork
                begin
                  $display ("%t ns, start thread %d", $time, t_idx);
                  #t_idx;
                  $display("%t ns, end of thread %d", $time,t_idx);
                end
              join_none
            end
            $display("Before_trigger:$time=%t",$time);
            wait fork;//if you have to wait for all the spawned processes to complete
            //if you have to just wait for one of the thread to complete use a uvm_event mechanism to 
            // 
            #1;
            $display("AFTER WAIT FORK!!!");
          end

//Below fork join_none block tries to start all 5 threads at the same time
//But as it has a disable statement after the wait_trigger 
//it will disable all the remaining descendents/threads
initial begin      
    finish_event = new();
    for_loop_block_1: for(int i=0; i < 5; i++ )  begin
      fork
        automatic int j = i;
        begin
          $display ("%t ps, start thread %d", $time, j);
          #(1*j);
          $display("%t ps, end of thread %d", $time,j);
          finish_event.trigger(); //
        end
      join_none
    end

    finish_event.wait_trigger();
    disable for_loop_block_1; //
    #1;
    $display("the NEXT Statement ...time=%t ",$time);
    
  end

  //Process P1,P2,P3 subprocesses are coming from the library std
              //which provides the different methods self,suspend,resume,kill etc
  std::process p1,p2,p3;
  
  initial begin
        fork
          begin
            $display("%t ps, start of thread %d", $time,1);
            p1 = std::process::self();
            #1 
            $display("%t ps, end of thread %d", $time,1);
          end
          begin
            $display("%t ps, start of thread %d", $time,2);
            p2 = std::process::self();
             #3 
            $display("%t ps, end of thread %d", $time,2);
          end
          begin
            $display("%t ps, start of thread %d", $time,3);
            p3 = std::process::self();
             #2 
            $display("%t ps, end of thread %d", $time,3);
          end
    join_any

    $display("the first process has finished");
    $display("thread 1 process status: %s", p1.status().name());
    $display("thread 2 process status: %s", p2.status().name());
    $display("thread 3 process status: %s", p3.status().name());

    wait fork; // wait for all the processes inside fork/join_any to finished

    $display("the NEXT Statement ... ");
  end 
