int smallest=10000;
            int sec_smallest=10000;
            //int a_large_arr[5] = {5,20,25,21,9};
            initial begin
              for(int j=0;j<$size(a_large_arr);j++)begin
                if(smallest > a_large_arr[j])begin
                  sec_smallest = smallest;//9 
                  smallest = a_large_arr[j];// 8
                end
                else if(sec_smallest > a_large_arr[j])begin
                  sec_smallest = a_large_arr[j];
                end
              end
              $display("smallest=%d && sec_smallest=%d",smallest,sec_smallest);
            end
