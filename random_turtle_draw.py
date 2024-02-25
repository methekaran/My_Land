#Day 16 start
import random
import turtle

my_turt = turtle.Turtle()
print(f"{my_turt}\n")
#my_turt.shape("turtle")
my_turt.color("red")

my_c_list =["red","green","blue","yellow","orange","black","purple","pink"]
dir_dict = [0,90,180,270]

def draw_dotted_lines():
    for _ in range(50):
        my_turt.pendown()
        my_turt.forward(10)
        my_turt.penup()
        my_turt.forward(10)

def draw_shapes(inp_sides,inp_color):
    my_turt.color(inp_color)
    for i in range(inp_sides):
        my_turt.right(int(360 /inp_sides))
        my_turt.forward(100)

def draw_complex_shape(inp_list):
    for i in range(3,11):
        a_c = random.choice(inp_list)
        draw_shapes(i,a_c)


def draw_random_walk(inp_c_list,dir_dict):
    angle=0
    for i in range(50):
        c_l = random.choice(inp_c_list)
        angle = random.choice(dir_dict)
        my_turt.color(c_l)
        my_turt.pensize(20)
        my_turt.forward(100)
        my_turt.seth(angle)


#draw_complex_shape(my_c_list)
draw_random_walk(my_c_list,dir_dict)

#draw_dotted_lines()
#draw_square()
my_screen = turtle.Screen()
my_screen.exitonclick()
