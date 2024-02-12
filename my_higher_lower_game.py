import game_data
import art
import random

print(f"{art.logo}")

#take the random two entries from the list
#From the data list get two entries


def my_higher_or_lower_game():
  num_of_followers_a = 0
  num_of_followers_b = 0
  fail_game = 0
  score_count = 0
  user_a_or_b_is_winner = 0

  #Fetch the dictionary data for comparison from the list for item A and item B

  #Compare who has most followers or taking a #If user entered correct answer then continue with the previous option as A and B a new entry from the list
  option_A = random.choice(game_data.data)
  option_B = random.choice(game_data.data)

  ## we need to repeat the loopfor continuation if game is won
  while (fail_game != 1):
    info_a = []
    info_b = []

    for key_a in option_A:
      if (key_a == 'follower_count'):
        num_of_followers_a = option_A[key_a]
      else:
        info_a.append(option_A[key_a])

    for key_b in option_B:
      if (key_b == 'follower_count'):
        num_of_followers_b = option_B[key_b]
      else:
        info_b.append(option_B[key_b])

    print(f"Compare A: {info_a}\n")
    print(f"{art.vs}\n")
    print(f"Agnaist B: {info_b}\n")

    user_inp = input("Please select a winner : Type A or B\n")

    if (user_inp == "A"):
      if (num_of_followers_a > num_of_followers_b):
        score_count += 1
        user_a_or_b_is_winner = 0
        print(f"Your current score is {score_count}\n")
        ### continue the game
      else:
        fail_game = 1
        print(f"You Lost!!! :(  Your final score is {score_count}\n")
    elif (user_inp == "B"):
      if (num_of_followers_a < num_of_followers_b):
        score_count += 1
        user_a_or_b_is_winner = 1
        print(f"Your current score is {score_count}\n")
        ### continue the game
      else:
        fail_game = 1
        print(f"You Lost!!! :(  Your final score is {score_count}\n")
    else:
      fail_game = 1
      print(
        f"Incorrect option enetered by the user! Your score is {score_count}\n"
      )
    if (user_a_or_b_is_winner == 0):
      temp = option_A
      option_A ={}
      option_A = random.choice(game_data.data)
      option_B = {}
      option_B = temp
    else:
      temp = option_B
      option_B = {}
      option_B = random.choice(game_data.data)
      option_A = {}
      option_A = temp

my_higher_or_lower_game()

# If user fails to guess end the game and display the final score

#I should always get a new entry from the list and not the same otherwise game might not work
