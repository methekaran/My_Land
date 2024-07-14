//constraint generation for consecutive 5 bits randomly between a 32-bit variable
//first define a 32-bit variable being random
//second decide the starting point of the 5 bit's being 1 as an index
//third assign those 5 bits and leave rest of the bits to 0

class consecutive_c;
  rand bit[31:0] con_data;
  rand int index;
  bit[4:0] value=5'h1f;//1_1111

  constraint con_data_c {
    index inside {[4:31]};
    foreach(con_data[i]){
      if(i<=index){
        con_data == value <<5;
      }
      else {
        con_data==0;
      }
    }
  }
endclass : consecutive_c
