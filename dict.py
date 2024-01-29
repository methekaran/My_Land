import random

my_dict = {}
my_list = [1, 2, 4, 6, 7]

for i in range(len(my_list)):
  my_dict[i] = my_list[i]

print(f"{my_dict}")

for key, val in enumerate(my_dict.items()):
  print(f"The key is :{key} && The value in dictionary:{val}")
