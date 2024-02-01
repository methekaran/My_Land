import random
import art
### A calculator app code

print(f"{art.logo}")


def addition(inp_1, inp_2):
    return (inp_1 + inp_2)


def subtraction(inp_1, inp_2):
    return (inp_1 - inp_2)


def multiplication(inp_1, inp_2):
    return (inp_1 * inp_2)


def division(inp_1, inp_2):
    return (inp_1 / inp_2)


## continue_op variable
continue_op = ""

#create a dictionary with key as operation and value is the function names
my_dict = {"+": addition, "-": subtraction, "*": multiplication, "/": division}

def calculator():
    inp_1 = float(input(f"Please enter the first number="))
    while (continue_op != "n"):
        op = input(f"Please enter the operation type:")
        inp_2 = float(input(f"Please enter the second number="))
        function_op = my_dict[op]
        print(f"{inp_1} {op} {inp_2}={function_op(inp_1,inp_2)}\n")
        result = function_op(inp_1, inp_2)
        continue_op = input("Do you want to continue on the previous result type y or n:")
        if (continue_op == "y"):
            inp_1 = result
        else :
            print("Start a new operation!!!")
            calculator() ## recursive operation

calculator()
