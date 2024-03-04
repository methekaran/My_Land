
import random

from turtle import Turtle
from turtle import Screen

turt = Turtle()
screen = Screen()

def move_fd():
    turt.forward(10)

def move_bk():
    turt.backward(10)

def move_cntr_clk():
    turt.right(10)

def move_clk():
    turt.left(10)

def clear():
    turt.clear()
    turt.penup()
    turt.home()

def move_turt():
    #the_key = input()
    if(the_key.lower()=="w"):
        inp_f=move_fd
    elif(the_key.lower()=="s"):
        inp_f=move_bk
    elif(the_key.lower()=="a"):
        inp_f=move_cntr_clk
    elif(inp_key.lower()=="d"):
        inp_f=move_clk
    elif(inp_key.lower()=="c"):
        clear()
        exit()
    else:
        print(f"Wrong input good bye...\n")
    screen.onkey(inp_key,inp_f)

screen.listen()
#move_turt()
screen.onkey(key="w",fun=move_fd)
screen.onkey(key="s",fun=move_bk)
screen.onkey(key="a",fun=move_cntr_clk)
screen.onkey(key="d",fun=move_clk)
screen.onkey(key="c",fun=clear)

screen.exitonclick()
