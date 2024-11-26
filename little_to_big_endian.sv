module m;

  int a = 'h12345678;
  int b;
  
initial   begin
  b ={<< 8{a}};
  
  $display ("a = %0h, b = %0h", a,b);
  
  
  end
endmodule
