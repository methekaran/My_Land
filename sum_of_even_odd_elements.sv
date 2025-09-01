
//sum of even and odd elements of an array in systemverilog
//1d array with 
 
     constraint my_1d_arr_c {
       //foreach(my_1d_arr[i])
       my_1d_arr.sum() with (int'(item.index%2 ? item : 0))==30;//odd elements sum
       my_1d_arr.sum() with (int'(item.index%2 ?  0   : item))==50;//even elements sum
     }
