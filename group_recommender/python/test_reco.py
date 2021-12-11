from db_functions import *
import math

user_reco=db_selectReco(1)[0][1]
user2_reco=db_selectReco(2)[0][1]
user_review = []
user2_review = []
user1 = db_selection(1)
user2 = db_selection(2)


for i in user1:
    user_review.append(i[3])
for i in user2:
    user2_review.append(i[3])

user_reco=user_reco.split("[")
user_reco=user_reco[1].split("]")
user_reco=user_reco[0]
user_reco=user_reco.split(",")

user2_reco=user2_reco.split("[")
user2_reco=user2_reco[1].split("]")
user2_reco=user2_reco[0]
user2_reco=user2_reco.split(",")
#list of "floatstrings" => when get value get float(user_reco[x])

#print(type(user_reco))
print(user_reco)
print(user2_reco)
# print("\n")



# print(recolist)

# print(user_reco)
# print(type(user_reco))


# print(user1[0][1])
print(user_review)
print(user2_review)

dif = []
dif2 = []

count=0

for i in user_review:
    dif.append(round(i-float(user_reco[count]),2))
    count = count +1

count2=0
for i in user2_review:
    dif2.append(round(i-float(user2_reco[count2]),2))
    count2 = count2 +1


print(dif)
print(dif2)

