class a_complex_num;
  rand bit sign;
  rand bit[6:0] exponent;
  rand bit[55:0] mantissa;//56+7+1=64
  real a_real_num;
 
  function void post_randomize();
    $display("sign=%b,exponent=%d,mantissa=%d",sign,exponent,mantissa);
    a_real_num = $bitstoreal({sign,mantissa,exponent});
    $display("A real num is =%f",a_real_num);
  endfunction : post_randomize
 
endclass : a_complex_num
