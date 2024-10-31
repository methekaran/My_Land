//2D sum methods for row == 100 & col==100
          
class my_2d_sum;
  
  rand bit [4:0] a [3][3];
  
  rand int unsigned b[5][5];
 
  constraint c1 {
        foreach(a[i]) {
          a[i].sum() with (int'(item))==10; // a[0].sum ==10, a[1].sum==10
          a.sum() with (int'(a[item.index][i]))==10;// a[0][i]
        }
        //unique {a};
  }
          
          constraint c2{
            foreach(b[i]){
              b[i].sum() with (int'(item))==100;
              b.sum() with (int'(b[item.index][i]))==100;
            }
          }
  
 
  

endclass : my_2d_sum
