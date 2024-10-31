
//1. The size of the pixel is 24 bits
//2. The size of the array is in the range of 10,100
//3. The squares row and col are same size
//4. The value of the each and every pixel has to be unique or incrementing
//5. The array values can be sorted

class a_2d_pix;
  rand bit[23:0] my_arr[$][$];
  rand int unsigned my_size;
  
  rand bit[23:0] my_1d_arr[$];
  
  constraint my_arr_c {
    my_size inside {[10:20]};
    my_arr.size()==my_size;
    foreach(my_arr[i]){
      my_arr[i].size()==my_size;// inside {[10:20]};
    }
    
      my_1d_arr.size()==my_size*my_size;
   
    unique{my_1d_arr};
  }
  
  function void post_randomize();
    my_1d_arr.sort();
    foreach(my_arr[i,j])begin
      my_arr[i][j] = my_1d_arr[i*my_size+j];
    end
  endfunction : post_randomize
endclass : a_2d_pix
