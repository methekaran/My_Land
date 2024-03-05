
class my_pure_vc;
  pure virtual function void display();
endclass : my_pure_vc

class my_ext_class extends my_pure_vc;
  virtual function void display();
    $display("This is defined under child class");
  endfunction : display
endclass : my_ext_class

module my_mod;
  //creating pure virtual class object is not allowed
  // my_pure_vc pure_vc;
  //accessing the pur virtual method is only allowed through the child or subclass
  my_ext_class e_class;

  initial begin
    e_class = new();
    e_class.display();
  end
  
endmodule : my_mod
