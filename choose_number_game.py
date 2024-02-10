import random

win_or_lose = 0


def start_game():
    print(f"The number guessing Game!!! Are you ready??? :) \n")
    easy_or_hard = input(
        "Please choose a level for the game Type : easy or hard???\n")
    total_chances = 0
    user_guess_number = 0
    random_number = random.randint(1, 100)
    if (easy_or_hard == "easy"):
        total_chances = 10
    else:
        total_chances = 5

    while (total_chances != 0):
        user_guess_number = int(
            input("Please guess a number between 1 and 100\n"))
        if (user_guess_number == random_number):
            print(f"You guessed a right number: {random_number}\n")
            print(f"Your remaining chances are {total_chances} :)")
            return 1
        else:
            if (user_guess_number > random_number):
                print(f"Too High!!!")
                if (total_chances == 1):
                    print(f"The correct number was {random_number}\n")
            elif (user_guess_number < random_number):
                print(f"Too Low!!!")
                if (total_chances == 1):
                    print(f"The correct number was {random_number}\n")
        total_chances -= 1
        if (total_chances == 1):
            print(
                f"########## Your remaining chance to play is only 1 so choose wisely            ##########\n"
            )


win_or_lose = start_game()
if (win_or_lose == 1):
    print("You won!!!\n")
else:
    print("You lossed a game!!!\n")
