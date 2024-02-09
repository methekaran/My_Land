import random

enemies = 1
friends = 5

def increase_enemies():
    # This will throw an error because your trying to access the variable before defining it.
    # print(f"Before changing variable {enemies}\n")
    enemies = 2
    print(f"enemies inside function: {enemies}")

def decrease_enemies():
  return (friends-1)

increase_enemies()
print(f"enemies outside function: {enemies}")

friends=decrease_enemies()
print(f"After function call friends value is : {friends}\n")
