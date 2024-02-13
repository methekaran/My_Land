import random
#### Code to access a list which contains dictionaries
coffee_list = [{
    'coffee_name': 'latte',
    'coffee_price': 5.9,
    'milk': '100ml',
    'water': '120ml',
    'coffee': '50g'
}, {
    'coffee_name': 'espresso',
    'coffee_price': 6.4,
    'milk': '200ml',
    'water': '120ml',
    'coffee': '100g'
}]

#for idx in coffee_list:
for idx in range(len(coffee_list)):
    for key in coffee_list[idx]:
        print(f"key is :{key} && value:{coffee_list[idx][key]}\n")

### Code for a dictionary containing a list
my_dict = {'one_key': [1, 2, 3, 4], 'two_key': [9, 8, 7, 6], 'three_key': [5]}

for index in my_dict:
    for key in range(len(my_dict[index])):
        #for lst_idx in range(len(my_dict[index][key])):
        print(
            f"The index of dict:{index}  && values are {my_dict[index][key]}\n"
        )
