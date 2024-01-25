## find a missing number
my_list = [9,6,4,2,3,5,7,0,1]

my_list.sort()

for i in range(len(my_list)):
  if(i in my_list):
    continue 
    #print("The index is found\n")
  else:
    print(f"The missing number is {i}\n")
