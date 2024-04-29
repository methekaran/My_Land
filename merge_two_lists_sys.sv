
module tb;

 int a_1[] = {1,3,5,7,9};
  int a_2[] = {2,4,6};
  int a_3[$] = {};
  int max_size;

initial begin
    max_size = a_1.size()>a_2.size() ? a_1.size() : a_2.size();
    
    for (int i=0; i< max_size; i++)begin//0,1,2,3,4
      if(i <= a_1.size()-1)begin
        a_3.push_back(a_1[i]);
      end
      if(i <= a_2.size()-1)begin
        a_3.push_back(a_2[i]);
      end
    end
    foreach(a_3[j])begin
      $display("A_3 value:%d",a_3[j]);
    end
  end

endmodule : tb
