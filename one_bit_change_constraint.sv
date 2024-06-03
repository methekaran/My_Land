
//Constraint to generate a number such that each time only 1 bit is changed and that  the bit that changed in the previous iteration should not change. For example
//·       First number 000
//·       Second number 001 is valid
//·       Now, third number 000 is not valid; but 101 or 011 are valid at this stage

class my_1bit_chg;
  
  rand bit[7:0] one_bit_chg;
  bit[7:0] prev_chg;
  int prev_idx;
  rand int curr_idx;
  
  constraint c_one_bit_chg{
    curr_idx inside {[0:7]};
    curr_idx != prev_idx;
    foreach(one_bit_chg[i]){
      if(i==curr_idx){
        one_bit_chg[i]==!prev_chg[i];  
      }
      else{
        one_bit_chg[i]==prev_chg[i];  
      }
    }
  }
  function void post_randomize();
    prev_idx=curr_idx;    
    prev_chg=one_bit_chg;
  endfunction : post_randomize
endclass : my_1bit_chg
