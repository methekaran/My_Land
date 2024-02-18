// Code your testbench here
// or browse Examples

virtual class A ;
virtual task disp ();
$display(" This is class A ");
endtask
endclass

class EA extends A ;
task disp ();
$display(" This is Extended class A ");
endtask
endclass

module tb_top;
  
EA my_ea;
A my_a;

initial
begin
my_ea = new();

  //  my_a =new(); This statement is not allowed for abstract or virtual classes because they can not be created they can only be inherited
my_a = my_ea;
my_ea.disp();
my_a.disp();
end
endmodule : tb_top
