### Python slicing examples

piano_list = ["a", "b", "c", "d", "e", "f", "g"]
piano_tup = ("sa", "re", "ga", "ma", "dha", "ni", "sa")

print(f"{piano_list[2:5]}\n")  #c,d,e 2,3,4
print(f"{piano_list[:5]}\n")  #a,b,c,d,e anything until 5th element
print(f"{piano_list[2:]}\n")  #c,d,e,f,g anything after 2nd element
print(f"{piano_list[2:5:2]}\n"
      )  # anything between 2 and 5 with 1 skip c,e skipping d
print(f"{piano_list[::-1]}\n")  # reverse a list
print(f"{piano_list[-1:]}\n")  # g only last element
