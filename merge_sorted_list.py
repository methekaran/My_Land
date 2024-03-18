list1 = [1, 2, 4]
list2 = [1, 3, 4, 5, 6]
output = []

if (len(list1) > len(list2)):
    list_1 = 1
elif (len(list1) < len(list2)):
    list_1 = 0
else:
    list_1 = 2

if (list_1 == 2):
    for i in range(len(list1)):
        output.append(list1[i])
        output.append(list2[i])
elif (list_1 == 0):
    for i in range(len(list2)):
        if (i < len(list1)):
            output.append(list1[i])
        output.append(list2[i])
elif (list_1 == 1):
    for i in range(len(list1)):
        output.append(list1[i])
        print(f" value of i :{i} and value of list2:{i in list2}\n")
        if (i < len(list2)):
            output.append(list2[i])

print(f"{output}\n")
