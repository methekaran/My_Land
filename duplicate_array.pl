import random

my_list = [0,1,2,3]

### check each and every number for duplicate
flag="False"
my_len = len(my_list)

for i in range(my_len-1):## i will go till 3
  j=i+1
  for a in range(j,my_len):
    if(my_list[i]==my_list[a]):
      flag="True"
      break

if(flag=="True"):
  print("Duplicate List")
else:
  print("Not a Duplicate list")
