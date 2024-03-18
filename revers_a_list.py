#Reversing a list in python
#two approches one is where u can use list slicing technique to reverse a list and second approcah is just use one for loop and start from the end of the list

head = [1, 2, 3, 4, 5, 6]
#Output: [2,1]
#output = head[::-1]
output = []

for idx in range((len(head) - 1), 0, -1):
    output.append(head[idx])

print(f"{output}\n")
