# Find all primary numbers between 1 to 20.

# first step is using a for loop between 1,20 to see which numbers are among the prime numbers
# second step is populating an array or list to add the prime numbers

## 2
### 7 %2==0 else , 7%3==0 else, 7%4==0 else, 7%5==0else, 7%6==0 else , 7 %7==0 yes
#19
output = []

#To detect primary numbers within a range you need to for loops because the 1st for loop runs between the range of values e.g. 2,21 
#and the second for loop runs between 2 which is first prime number and a_num-1 from the first loop and checks if that number is complete divisible except that number

for a_num in range(2, 21):
    for j in range(2, a_num):
        if (a_num % j == 0):
            break
    #print(f"outside {j}=\n")
    else:
        print(f"inside the else and {a_num}\n")
        output.append(a_num)

print(f"{output}\n")

input = 16
output = []
flag = 0

#to detect a particular number is prime or not you need only 1 for loop
#where you check that number if it's only divisible by itself
#Note below input =15 as python for loop runs between (2,16-1=15)

for j in range(2, input):
    if (input % j == 0):
        flag = 0
        break
    #print(f"outside {j}=\n")
    else:
        flag = 1
        #print(f"inside the else and {a_num}\n")
        #output.append(a_num)

if (flag == 1):
    print(f"This is a prime number {input}\n")
else:
    print(f"Not a prime number {input}\n")
