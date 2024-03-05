
class my_pure_vc;
  pure virtual function void display();
endclass : my_pure_vc

class my_ext_class extends my_pure_vc;
  virtual function void display();
    $display("This is defined under child class");
  endfunction : display
endclass : my_ext_class
