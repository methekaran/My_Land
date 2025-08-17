
module tb;

 int a_1[] = {1,3,5,7,9};
  int a_2[] = {2,4,6};
  int a_3[$] = {};
  int max_size;


Function int merge_sort_array(int ary1[$],int ary2[$]);
  

   Int I,j;

   //while loop to take all elements from 2 Ary
   While(I<ary1.size() && j<ary2.size())begin
       If(ary1[I]<=ary2[j]) begin
          Ary3.push_back(ary1[I++];
       end
       Else begin
          Ary3.push_back(ary2[j++];
       end
   end
   while(I < ary1.size())begin
     Ary3.push_back(Ary[I++];
   End
  While(j <ary2.size())begin
     Ary3.push_back(ary2[j++];
  end

  Return ary3;
End function : merge_sort_array

 initial begin
  a_3 = merge_sort_array(a_1,a_2);
 end

endmodule : tb
