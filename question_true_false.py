
import random
from data import question_data
from question_model import Question
from quiz_brain import Quiz_brain

Question_Bank = []
for idx in range(len(question_data)):
    Question_Bank.append(
        Question(question_data[idx]["text"], question_data[idx]["answer"]))

#print(f"{Question_Bank}\n")
qz = Quiz_brain(Question_Bank)
while qz.still_has_questions():
    qz.next_question()

print(f"Your quiz is complete now :)\n")
print(f"Your final score is {qz.score}/{qz.question_number}\n")
