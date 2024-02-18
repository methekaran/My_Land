import random
#Step 1 Write comments on what steps needs to be done for a problem statement

#create an input array or list

#define the target/output variable

#step 2 once understood the comments then categorize as smaller tasks

#step 3 write smaller and simpler tasks into code

#step 4 read your code and find any typos or errors if any

#step 5 run the code

#1. Prompt user by asking “What would you like? (espresso/latte/cappuccino):”
#a. Check the user’s input to decide what to do next.
#b. The prompt should show every time action has completed, e.g. once the drink is
#dispensed. The prompt should show again to serve the next customer.

user_input = input("what would you like? espresso/latte/cappucino\n")
flag = 0
rem_water = 300
rem_coffee = 100
rem_milk = 200
rem_money = 0

#2. Turn off the Coffee Machine by entering “off” to the prompt.
#a. For maintainers of the coffee machine, they can use “off” as the secret word to turn off
#the machine. Your code should end execution when this happens.
on_or_off = "on"


def check_resource(min_water, min_coffee, min_milk, rem_water, rem_coffee,
                   rem_milk):
    if (rem_water < min_water):
        print(f"Not sufficient water\n")
        return 0
    elif (rem_coffee < min_coffee):
        print(f"Not sufficient coffee\n")
        return 0
    elif (rem_milk < min_milk):
        print(f"not sufficient milk\n")
        return 0
    else:
        return 1


def print_report(rem_water, rem_milk, rem_coffee, rem_money):
    print(
        f"Water: {rem_water}ml, Milk:  {rem_milk}ml,Coffee: {rem_coffee}g,Money:  {rem_money}\n"
    )


#3. Print report.
#a. When the user enters “report” to the prompt, a report should be generated that shows
#the current resource values. e.g.
#Water: 100ml
#Milk: 50ml
#Coffee: 76g
#Money: $2.5
if (user_input == "report"):
    print_report(rem_water, rem_milk, rem_coffee, rem_money)
elif (user_input == "espresso"):
    flag = check_resource(50, 18, 0, rem_water, rem_coffee, rem_milk)
elif (user_input == "latte"):
    flag = check_resource(200, 24, 150, rem_water, rem_coffee, rem_milk)
elif (user_input == "cappucino"):
    flag = check_resource(250, 24, 100, rem_water, rem_coffee, rem_milk)

if (flag == 1 and on_or_off == "on"):
    print(f"please insert coins\n")
    num_of_quaters = int(input("Please insert num_of_quaters\n"))
    num_of_dimes = int(input("please insert num_of_dimes\n"))
    num_of_nickels = int(input("please insert num_of_nickels\n"))
    num_of_pennis = int(input("please insert num_of_pennies\n"))
    total_money = (num_of_quaters * 0.25) + (num_of_dimes * .10) + (
        num_of_nickels * 0.05) + (num_of_pennis * 0.01)
    if (total_money >= 3.00 and user_input == "cappucino"):
        rem_coffee -= 24
        rem_milk -= 100
        rem_water -= 250
        if (total_money > 3.00):
            rem_money = total_money - 3.00
        else:
            rem_money = total_money
        print(
            f"Thanks here is your change {total_money-3.00} and your coffee!!!\n"
        )
        print_report(rem_water, rem_milk, rem_coffee, rem_money)
    elif (total_money >= 2.50 and user_input == "latte"):
        print(
            f"Thanks here is your change {total_money-2.50} and your coffee!!!\n"
        )
        rem_coffee -= 24
        rem_milk -= 150
        rem_water -= 200
        if (total_money > 2.50):
            rem_money = total_money - 2.50
        else:
            rem_money = total_money
        print_report(rem_water, rem_milk, rem_coffee, rem_money)
    elif (total_money >= 1.5 and user_input == "espresso"):
        print(
            f"Thanks here is your change {total_money-1.5} and your coffee!!!\n"
        )
        rem_coffee -= 18
        rem_water -= 50
        if (total_money > 1.50):
            rem_money = total_money - 1.50
        else:
            rem_money = total_money
        print_report(rem_water, rem_milk, rem_coffee, rem_money)
    elif (user_input == "report"):
        print_report(rem_water, rem_milk, rem_coffee, rem_money)
    else:
        print("Sorry that's not enough money money refunded!!!\n")
elif (flag == 1 or on_or_off == "off"):  ## on_or_off
    rem_coffee = 100
    rem_milk = 200
    rem_water = 300
    #make_coffee

#4. Check resources sufficient?
#a. When the user chooses a drink, the program should check if there are enough
#resources to make that drink.
#b. E.g. if Latte requires 200ml water but there is only 100ml left in the machine. It should
#not continue to make the drink but print: “Sorry there is not enough water.”
#c. The same should happen if another resource is depleted, e.g. milk or coffee.

#5. Process coins.
#a. If there are sufficient resources to make the drink selected, then the program should
#prompt the user to insert coins.
#b. Remember that quarters = $0.25, dimes = $0.10, nickles = $0.05, pennies = $0.01
#c. Calculate the monetary value of the coins inserted. E.g. 1 quarter, 2 dimes, 1 nickel, 2
#pennies = 0.25 + 0.1 x 2 + 0.05 + 0.01 x 2 = $0.52

#6. Check transaction successful?
#a. Check that the user has inserted enough money to purchase the drink they selected.
#E.g Latte cost $2.50, but they only inserted $0.52 then after counting the coins the
#program should say “Sorry that's not enough money. Money refunded.”.
#b. But if the user has inserted enough money, then the cost of the drink gets added to the
#machine as the profit and this will be reflected the next time “report” is triggered. E.g.
#Water: 100ml
#Milk: 50ml
#Coffee: 76g
#Money: $2.5
#c. If the user has inserted too much money, the machine should offer change.
#E.g. “Here is $2.45 dollars in change.” The change should be rounded to 2 decimal
#places.

#7. Make Coffee.
#a. If the transaction is successful and there are enough resources to make the drink the
#user selected, then the ingredients to make the drink should be deducted from the
#coffee machine resources.
#E.g. report before purchasing latte:
#Water: 300ml
#Milk: 200ml
#Coffee: 100g
#Money: $0
#Report after purchasing latte:
#Water: 100ml
#Milk: 50ml
#Coffee: 76g
#Money: $2.5
#b. Once all resources have been deducted, tell the user “Here is your latte. Enjoy!”. If
#latte was their choice of drink
