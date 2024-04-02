#Fibonnaci series
#0,1,1,2,3,5,8,13,21,34,55

#Take a variable whose value is 1
# The addition makes it a value equal to prev_val + next_num=next_num

#below code is for printing the fibonacci series
inp_num1 = 0
inp_num2 = 1
n = 8
while (n > 0):
    output = inp_num1 + inp_num2
    print(f"{output}\n")
    inp_num1 = inp_num2
    inp_num2 = output
    n = n - 1


### Below function is for finding the nth Number of the fibonnaci series
def fib_series(n):
    if (n == 0):
        return 0
    elif (n == 1 or n == 2):
        return 1
    else:
        return (fib_series(n - 1) + fib_series(n - 2))


print(f"Fibonacci number from the series is:{fib_series(10)}\n")
