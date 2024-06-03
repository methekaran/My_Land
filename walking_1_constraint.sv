//write a constraint for walking 1's pattern
//i) an 8-bit variable 
//ii) initial value is 1 e.g.
//iii) then left shift every time to generate the walking 1's pattern

class my_cls;
  rand bit[7:0] walk_1;
  bit[7:0] a_walk_1_val=1;


constraint c_walk_1{
  walk_1 == a_walk_1_val;//1,2,4,8,
}

function void post_randomize();
  a_walk_1_val= a_walk_1_val << 1;
endfunction : post_randomize
endclass : my_cls

//Another way would be you use $onehot(var)==1 constraint and store the generated values in a queue
// sort the queue at the end and pop the entries whenever required

//For generating numbers which are power of 2 should be same logic except the starting value should be equal to 2.

//Write a constraint for 32-bit var where only 2 bits should differ from previous randomization
e.g. 0010
e.g. 0001
e.g. 0010
e.g. 00
//decide which 2 bits to shuffle from previous randomization
//then next one will always depend on those 2 bits for randomization
class my_2bit_change;
  rand bit[31:0] a_val;
  bit[31:0] a_local_val;
  rand int an_start_idx;
  rand int an_other_idx;
  bit flag=0;

  function void pre_randomize();
    if(flag==0)begin
      a_local_val = $urandom_range();
      flag=1;
    end
  endfunction : pre_randomize
  
  constraint a_val_c {
    an_start_idx inside {[0:31}];
    an_other_idx != an_start_idx;
    an_other_idx inside {[0:31]};                     
    a_val==a_local_val;
  }

    function void post_randomize();
      foreach(a_local_val[i])begin
        if(i==an_start_idx || i==an_other_idx)begin
          a_local_val[i]=!a_local_val[i];
        end
      end
    endfunction : post_randomize
endclass : my_2bit_change
