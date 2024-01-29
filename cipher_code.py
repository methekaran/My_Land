import art

alphabet = [
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'a', 'b', 'c', 'd',
    'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's',
    't', 'u', 'v', 'w', 'x', 'y', 'z'
]


#TODO-3: What happens if the user enters a number/symbol/space?
#Can you fix the code to keep the number/symbol/space when the text is encoded/decoded?
#e.g. start_text = "meet me at 3"
#end_text = "•••• •• •• 3"
def cipher(usr_text, usr_shift, direct):
    out_text = ""
    alpha_len = len(alphabet)
    if (direct == "encode"):
        for a_text in usr_text:
            if (a_text in alphabet):
                if (alphabet.index(a_text) + usr_shift % 26 >= alpha_len):
                    #print(
                    #    f"Length:{alpha_len},a_text:{a_text},index:{alphabet.index(a_text)}"
                    #)
                    out_text += alphabet[alphabet.index(a_text) +
                                         usr_shift % 26 - alpha_len]
                else:
                    out_text += alphabet[alphabet.index(a_text) +
                                         usr_shift % 26]
                    #print(
                    #    f"Length:{alpha_len},a_text:{a_text},index:{alphabet.index(a_text)}"
                    #)
            else:
                out_text += a_text
        print(f"Final encrypted message is {out_text}")
    else:
        for a_text in usr_text:
            if (a_text in alphabet):
                if (alphabet.index(a_text) - (usr_shift % 26) < 0):
                    out_text += alphabet[alpha_len - (usr_shift % 26) +
                                         alphabet.index(a_text)]
                # print(
                #    f"Length:{alpha_len},a_text:{a_text},index:{alphabet.index(a_text)}"
                #)
                else:
                    out_text += alphabet[alphabet.index(a_text) -
                                         (usr_shift % 26)]
                    #print(
                    #    f"Length:{alpha_len},a_text:{a_text},index:{alphabet.index(a_text)}"
            else:
                out_text += a_text
        print(f"The decrypted message is {out_text}")


#TODO-1: Import and print the logo from art.py when the program starts.
print(f"{art.logo}")
#TODO-4: Can you figure out a way to ask the user if they want to restart the cipher program?
#e.g. Type 'yes' if you want to go again. Otherwise type 'no'.
#If they type 'yes' then ask them for the direction/text/shift again and call the caesar() function again?
#Hint: Try creating a while loop that continues to execute the program if the user types 'yes'.

#TODO-2: What if the user enters a shift that is greater than the number of letters in the alphabet?
#Try running the program and entering a shift number of 45.
#Add some code so that the program continues to work even if the user enters a shift number greater than 26.
#Hint: Think about how you can use the modulus (%).
user_inp = ""
while (user_inp != "no"):
    direction = input("Type 'encode' to encrypt, type 'decode' to decrypt:\n")
    text = input("Type your message:\n").lower()
    shift = int(input("Type the shift number:\n"))
    cipher(text, shift, direction)
    user_inp = input("Do you want to continue???\n")
print("GoodBye...")
