module tb_top;
  
  int inp_arr[5] = {1,2,3,4,0};
  
  int my_assoc_arr[int];
  bit false =1;
  
  initial begin
    foreach(inp_arr[i])begin
      my_assoc_arr[inp_arr[i]]+=1;
      if(my_assoc_arr[inp_arr[i]]>1)begin
        $display("True!!!");
        false=0;
        break;
      end
    end
    if(false==1)begin
      $display("False!!!");
    end
  end

endmodule : tb_top
