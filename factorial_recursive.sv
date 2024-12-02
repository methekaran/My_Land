      int fact=0;
      
      function automatic int factorial(input int inp=1);
        if(inp>1)begin
          return inp * factorial(inp-1);
        end
        else begin
          return 1;
        end
      endfunction : factorial
      
      initial begin
        fact=factorial(6);
        $display("The fact value is=%d",fact);
      end
