import art
from replit import clear
#HINT: You can call clear() to clear the output in the console.

print(f"{art.logo}")
my_silent_dict = {}
bid_continue = "yes"

## First request user to enter the name of the person
## This will become a key of your dictionary
while (bid_continue != "no"):
    usr_name = input("Please enter the bidders name:\n")

    ##Second request user to eneter the bid value and store it as the value
    value = input("Please enter the bidding value:\n")
    my_silent_dict[usr_name] = value
    bid_continue = input("Do you want to continue bidding???\n")
    if (bid_continue == "yes"):
        clear()

max_value = 0
key_val = ""
for key in my_silent_dict:
    if (int(my_silent_dict[key]) > int(max_value)):
        max_value = int(my_silent_dict[key])
        key_val = key

print(f"The winner is : {key_val} & value is ${max_value}")

## Keep accumulating the dictionary and then keep asking the user if bid is to continue or not
### if continue clear the screen before next bid
### else part will just declare the winner for dictionary
