module tb_top;
  int inp_arr[5] = {1,7,3,2,4};

   int inp_arr[6] = {7,1,5,3,2,4};
  
  //Algorithm : set a buy price as a flag and sell price as a flag and then compare the each day's difference to see which is largest profit
  int buy_price=1000;
  int my_assoc_arr[int];
  int idx;
  int max_q[$];
  
  int left_ptr=0;
  int right_ptr=1;
  int max_value[$];

  //Time complexity O(n)
  initial begin
    while (right_ptr!=$size(inp_arr))begin
      if(inp_arr[left_ptr] < inp_arr[right_ptr])begin
        max_q.push_back(inp_arr[right_ptr] - inp_arr[left_ptr]);
      end
      else begin
        left_ptr = right_ptr;
      end
      right_ptr++;
    end
    max_value = max_q.max();
    $display("Max value is :%d",max_value[0]);
  end
  
 
  //Below is the O(n^2)
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
