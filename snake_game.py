from time import sleep
from turtle import Screen
from turtle import Turtle
from food import Food
from scoreboard import Scoreboard

UP = 90
DOWN = 270
LEFT = 180
RIGHT = 0
STARTING_POS = [(0,0),(-20,0),(-40,0)]

class Snake:
    def __init__(self):
        self.snake_l = []
        self.create_snake()
        self.head = self.snake_l[0]

    def create_snake(self):
        for i in STARTING_POS:
            self.add_position(i)

    def add_position(self,position):
            snake = Turtle("square")
            snake.color("white")
            snake.penup()
            snake.goto(position)
            self.snake_l.append(snake)

    def extend(self):
        self.add_position(self.snake_l[-1].position())

    def move(self):
        for step in range(len(self.snake_l)-1,0,-1):
            new_x=self.snake_l[step - 1].xcor()
            new_y=self.snake_l[step - 1].ycor()
            self.snake_l[step].goto(new_x,new_y)
        self.head.forward(20)

    def up(self):
        if(self.head.heading()!=DOWN):
            self.head.setheading(UP)

    def down(self):
        if(self.head.heading()!=UP):
            self.head.setheading(DOWN)

    def left(self):
        if(self.head.heading()!=RIGHT):
            self.head.setheading(LEFT)

    def right(self):
        if(self.head.heading()!=LEFT):
            self.head.setheading(RIGHT)

screen = Screen()
screen.setup(width=600,height=600)
screen.bgcolor("black")
screen.title("Snake Game!!!")
screen.tracer(0)

snake_obj =Snake()
screen.listen()
screen.onkey(snake_obj.up,"Up")
screen.onkey(snake_obj.down,"Down")
screen.onkey(snake_obj.left,"Left")
screen.onkey(snake_obj.right,"Right")

fd =Food()
scb = Scoreboard()

game_is_on=True
while game_is_on:
    screen.update()
    sleep(0.1)
    snake_obj.move()
    if(snake_obj.head.distance(fd) <15):
        snake_obj.extend()
        fd.refresh()
        scb.incr_score()

    #detect collision
    if(snake_obj.head.xcor() > 290 or snake_obj.head.xcor() < -290 or snake_obj.head.ycor() > 290 or snake_obj.head.ycor() < -290):
        game_is_on=False
        scb.game_over()

    #detect collision with tail
    for a_val in snake_obj.snake_l[1:]:
        if snake_obj.head.distance(a_val) < 10:
            game_is_on = False
            scb.game_over()


screen.exitonclick()


from turtle import Turtle

class Scoreboard(Turtle):
    def __init__(self):
        super().__init__()
        self.score = 0
        self.color("white")
        self.penup()
        self.goto(0, 275)
        self.update_scb()
        self.hideturtle()

    def update_scb(self):
        self.write(f"Score : {self.score}", align="center", font=('Arial', 24, 'normal'))

    def game_over(self):
        self.goto(0,0)
        self.write(f"GAME OVER!", align="center", font=('Arial', 24, 'normal'))

    def incr_score(self):
        self.clear()
        self.score += 1
        self.update_scb()



import random
from turtle import Turtle

class Food(Turtle):

    def __init__(self):
        super().__init__()
        self.penup()
        self.shape("circle")
        self.color("blue")
        self.shapesize(stretch_len=0.5,stretch_wid=0.5)
        self.speed("fastest")
        self.refresh()

    def refresh(self):
        rand_x = random.randint(-280,280)
        rand_y = random.randint(-280,280)
        self.goto(rand_x,rand_y)

