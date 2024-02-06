module tb_top;
  int inp_arr[5] = {1,7,3,2,4};
  
  //Algorithm : set a buy price as a flag and sell price as a flag and then compare the each day's difference to see which is largest profit
  int buy_price=100000;
  int my_assoc_arr[int];
  int idx;
  int max_q[$];
 
 initial begin
  for( int i=0;i<$size(inp_arr);i++)begin
    if(inp_arr[i] < buy_price)begin
      buy_price=inp_arr[i];
      idx=i;
    end
  end
   
  foreach(inp_arr[i])begin
    if((inp_arr[i]-buy_price)<0 && i>idx)begin
      my_assoc_arr[i] = -1*(inp_arr[i]-buy_price);
      $display("1.Inp_arr value:%d,i=%d",inp_arr[i],i);
    end
    else if((inp_arr[i]-buy_price)>0 && i>idx)begin
      my_assoc_arr[i] = inp_arr[i]-buy_price;
      $display("2.Inp_arr value:%d,i=%d",inp_arr[i],i);
    end
  end
    
  max_q = my_assoc_arr.max();
  $display("The best profit would be:%d ",max_q[0]);
 end
endmodule : tb_top
