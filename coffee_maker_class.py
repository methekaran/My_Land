import random

from menu import Menu, MenuItem
from coffee_maker import CoffeeMaker
from money_machine import MoneyMachine

user_input = "on"

while (user_input != "off"):
    user_input = input("What would you like? (espresso/cappuccino/latte)\n")
    report_c = CoffeeMaker()
    menu = Menu()
    money_m = MoneyMachine()
    if (user_input == "off"):
        report_c.__init__()
    elif (user_input == "report"):
        report_c.report()
        money_m.report()
    else:
        my_order = menu.find_drink(user_input)
        if (report_c.is_resource_sufficient(my_order)):
            if (money_m.make_payment(my_order.cost)):
                report_c.make_coffee(my_order)
                report_c.report()
                money_m.report()
