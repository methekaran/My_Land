Check if the input number or a given number is a prime number?
1,2,3,4,5,6,7
A prime number is a number which is should be divisible by only itself remainder after dividing by 2 is not 0.
Only valid numbers are given positive or negative? Can be anything
Return true if it’s a prime number not if not a prime number
Function should convert a negative number to positive if required-No
Function should check for valid prime number     

//pseudo code
// loop until it is divisible by less than 1 then break the loop otherwise return true
Function bit check_prime_num(int my_num=0);
 
  If(my_num<2)begin
    Return 0;
  end
  If(my_num==2)begin
    Return 1;
  end
  
   For(int I=2;i<my_num;i++)begin // 2,3,4,5,6,7
      If(my_num%i==0)begin
        Return 0;
      end
   end
  Return 1;
End function : check_prime_num O(n)

 /* for(int i=2;i<=sqrt(my_num);i++)begin
    if(my_num%i==0)
       return 0;
  end
  return 1;*/
  

