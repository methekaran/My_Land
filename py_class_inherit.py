class Animal():

    def __init__(self):
        self.num_of_eyes = 2

    def print_this(self):
        print(f"I have these many eyes: {self.num_of_eyes}\n")


class Fish(Animal):

    def __init__(self):
        super().__init__()

    def swim(self):
        print(f"I can swim\n")


f = Fish()
f.swim()
f.print_this()
