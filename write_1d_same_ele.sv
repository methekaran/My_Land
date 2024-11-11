 
                          class my_sum;
                            rand bit[7:0] my_var[20];
                            
                            constraint my_var_c {
                              my_var.sum() with (int'(item==1))==10;
                              //my_var.sum() with (int'(item inside {1}))==10;
                            }
                          endclass : my_sum
