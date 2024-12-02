    //For recursive calls and the stack operations 
//The function has to be automatic
   function automatic int fib_series(input int inp);
       if(inp==0)
	     return 0;
        else if(inp==1 || inp==2)
         return 1;        
       else 
         return (fib_series(inp-1) + fib_series(inp-2));
      endfunction : fib_series
      
      int fib_val=0;
      initial begin
        fib_val=fib_series(10);
        $display("The fib value=%d",fib_val);
      end
      //0,1,1,2,3,5,8,13,21,34,55
