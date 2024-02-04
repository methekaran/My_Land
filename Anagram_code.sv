module tb_top;
  string inp_array_s = "meeran";//a,n,g,r,m
  string inp_array_t = "ranmee";
  
  int assoc_1[string];
  int assoc_2[string];
  bit flag=1;
  
  initial begin
    if(inp_array_s.len()!=inp_array_t.len())begin
      flag=0;
    end
    else begin
      for(int i=0;i< inp_array_s.len();i++)begin
        assoc_1[inp_array_s[i]]+=1;
      end
    
      for(int j=0;j< inp_array_t.len();j++)begin
        assoc_2[inp_array_t[j]]+=1;
      end
    
      foreach(assoc_1[k])begin
        if(assoc_1[k]!=assoc_2[k])begin
          flag=0;
        end
      end
    end
    
    if(flag==1)begin
      $display("True");
    end
    else begin
      $display("false");
    end
  end
endmodule : tb_top
