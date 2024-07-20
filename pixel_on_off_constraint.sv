`define ROW 50
`define COL 50

class my_pixel;
  rand bit pixel_var[`ROW][`COL];

  constraint pixel_var_c {
    foreach(pixel_var[row,col]){
   if(pixel_var[row][col]==OFF){
      (row>0) -> pixel_var[row-1][col]==ON;
      (col>0) -> pixel_var[row][col-1]==ON;
     (row<`ROW-1) pixel_var[row+1][col]==ON;
     (col<`COL-1) pixel_var[row+1][col]==ON;
    }
  }
}
endclass : my_pixel
