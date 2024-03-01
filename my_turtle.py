#Day 16 start
import random
import turtle

my_turt = turtle.Turtle()
print(f"{my_turt}\n")
#my_turt.shape("turtle")
#my_turt.color("red")
turtle.colormode(255)

#my_c_list =["red","green","blue","yellow","orange","black","purple","pink"]
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


def draw_random_walk(dir_dict):
    angle=0
    my_turt.speed(10)
    my_turt.pensize(20)
    for i in range(100):
        #c_l = random.choice(inp_c_list)
        angle = random.choice(dir_dict)
        ret_tup = random_color()
        my_turt.color(ret_tup)
        my_turt.forward(50)
        my_turt.seth(angle)

def random_color():
    r = random.randint(0,255)
    g = random.randint(0,255)
    b = random.randint(0,255)
    my_tup = (r,g,b)
    return my_tup

def draw_spirograph():
    for i in range(200):
        ret_tup = random_color()
        my_turt.color(ret_tup)
        my_turt.circle(100)
        my_turt.seth(my_turt.heading()+10)


#draw_complex_shape(my_c_list)
#draw_random_walk(dir_dict)
#draw_spirograph()
# random color
colors_list = [(202, 164, 109), (238, 240, 245), (150, 75, 49), (223, 201, 135), (52, 93, 124), (172, 154, 40),
               (140, 30, 19), (133, 163, 185), (198, 91, 71), (46, 122, 86), (72, 43, 35), (145, 178, 148),
               (13, 99, 71), (233, 175, 164), (161, 142, 158), (105, 74, 77), (55, 46, 50), (183, 205, 171),
               (36, 60, 74), (18, 86, 90), (81, 148, 129), (148, 17, 20), (14, 70, 64), (30, 68, 100),
               (107, 127, 153), (174, 94, 97), (176, 192, 209)]

def draw_dotted_colors():
    my_turt.speed(10)
    my_turt.pensize(20)
    for i in range(10):
        for j in range(10):
            my_turt.pendown()
            tup = random.choice(colors_list)
            my_turt.color(tup)
            #if(j%2!=0):
            #    my_turt.backward(1)
            #else:
            my_turt.forward(1)
            my_turt.penup()
            my_turt.forward(50)
        if(j==9):
            my_turt.seth(90)
        if(i%2!=0):
            my_turt.seth(180)

draw_dotted_colors()

#draw_dotted_lines()
#draw_square()
my_screen = turtle.Screen()
my_screen.exitonclick()
