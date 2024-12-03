class my_2d_arr;
   rand int unsigned my_2d[`ROW][`COL];
   rand int unsigned out_arr[`ROW][`COL];
   rand int unsigned out_arr_2[`ROW][`COL];
   
   constraint my_2d_arr_c {
     foreach(my_2d[i,j]){
       my_2d[i][j] inside {[0:100]};
     }
     foreach(out_arr[row,col]){
       out_arr[col][`ROW-row-1] == my_2d[row][col];  
     }
     foreach(out_arr_2[row,col]){
       out_arr_2[`COL-col-1][row]==my_2d[row][col];
     }
   }
       
       
 endclass : my_2d_arr
