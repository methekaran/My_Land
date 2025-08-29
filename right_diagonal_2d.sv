module m1;
  class c1;
    rand bit [3:0] array[5][5];
    constraint c1{
      foreach (array[a,b])
        if (a+b == $size(array)-1)
          array[a][b] == '0;
        else
          array[a][b] != '0;
    }
    function void post_randomize();
      $display("elements %0p", array);
      $display("dimension %0d", $dimensions(array));
    endfunction
  endclass
  c1 obj;
  initial begin
    obj = new;
    repeat (1) begin
      assert(obj.randomize);
    end
  end
endmodule
