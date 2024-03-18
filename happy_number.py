#Input: n = 19
#Output: true
#Explanation:
#1^2 + 9^2 = 82
#8^2 + 2^2 = 68
#6^2 + 8^2 = 100
#1^2 + 0^2 + 0^2 = 1

#steps: start diving the number and get remainder and divident
# once you get every digit keep adding the squared values
#assign the new n number
n = 19
numbers = {}
a_new_num = 0
given_num = n

while n != 1:
    for a_digit in str(n):
        a_new_num += int(a_digit)**2
    print(f"{a_new_num}\n")
    if (a_new_num in numbers):
        break
    n = a_new_num
    numbers[a_new_num] = 0
    a_new_num = 0

if (n == 1):
    print(f"{given_num} was a Happy Number!!!\n")
else:
    print(f"Not a Happy number:{given_num}")
