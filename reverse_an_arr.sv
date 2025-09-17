

  
  //Reverse an array
  typedef int my_ret[6];

//two pointer problem where you will use left and right pointer
//To swap the elements

   function my_ret reverse_an_array(input int arr[6]);
  int left=0;
  int right;
     
   right=$size(arr)-1;

   while(left < right)begin
     arr[left] = arr[right] + arr[left];
     arr[right]= arr[left] - arr[right];
     arr[left] = arr[left] - arr[right];
     left++;
     right--;
   end
   return arr;
endfunction : reverse_an_array
  
  my_ret output_arr;
  initial begin
    output_arr=reverse_an_array(my_arr_inp);
    foreach(output_arr[j])begin
      $display("The output of the array=%d",output_arr[j]);
    end
  end
