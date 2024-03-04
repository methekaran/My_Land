
import random

from turtle import Turtle
from turtle import Screen

color_l = ["red","purple","green","yellow","pink","black","blue","orange"]


screen = Screen()
screen.setup(width=500,height=500)
user_color=screen.textinput("Ask something","Which turtle should win the race? Please enter color")
turt=[]
random_mv=[]
is_race_on=True

for a_c in range(len(color_l)):
    turt.append(Turtle("turtle"))
    turt[a_c].color(color_l[a_c])
    turt[a_c].penup()
    turt[a_c].goto(x=-230,y=-100+(a_c*50))

while is_race_on:
    for idx in range(len(turt)):
        random_mv.append(random.randint(1,20))
        turt[idx].forward(random_mv[idx])
        if(turt[idx].xcor()>230):
            is_race_on=False
            if(color_l[idx]==user_color):
                print(f"You Won :) the Race {color_l[idx]}\n")
            else:
                print(f"You Lost!!! :( The winner of the Race is {color_l[idx]} \n")

screen.exitonclick()

#W-> FORWAD, S-> BACKWARD, A-COUNTER CLK, D->CLOCK WISE, C-> CLEAR SCREEN
