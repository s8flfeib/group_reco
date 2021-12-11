from db_functions import *
from recommendation import *
from aggregation_strategies import *
from psycopg2.extensions import register_adapter, AsIs
import sys
import json
import numpy as np

# Connection DB
# Berechnumg Matrix plus speichern in DB
# Recommendation Group Ausgabe
tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)

input = json.loads(sys.argv[1])
# input = {"email": "jan@gmail.com",
#  "email1": "jan1@gmail.com", "email2": "jan3@gmail.com"}

print(input)

restaurants = db_countRestaurants
# create a user_ID array
user_IDs = []
# liefer user_IDs als liste: [2,1,3]
#!!!!  Bricht ab, wenn zum Beispiel email_3 nicht existiert!!!
# print("TESt")
# print(input)
for n in input:
    if(not db_checkUser(input[n])):
        print("User not Registered")
        exit()
    # print(db_GetUserID(input[n]))
    user_IDs.append(db_GetUserID(input[n])[0][0])


matrix = []
# liefer list von [(reviewID,userID,RestaurantID,Stars),..]
# print(db_selection(user_IDs[2]))
for i in range(len(user_IDs)):
    revs = []
    user = db_selection(user_IDs[i])
    for a in user:
        revs.append(a[3])
    matrix.append(revs)

# print(matrix)


# Anazhl der REstaurants for recommendation()
numOfrestaurants = []
for i in range(db_countRestaurants()):
    numOfrestaurants.append(i)

recomatrix = []
# IDs starten bei 1 und for bei 0 !

for i in range(len(user_IDs)):
    if(db_checkReco(user_IDs[i])):
        # print("TEST_TRUE")
        reco = db_getReco(user_IDs[i])
        recomatrix.append(reco)
    else:
        # print("TEST_FALSE")
        # continue #Nur zum Testen
        reco = recommendation(numOfrestaurants, matrix[i])
        db_insertReco(user_IDs[i], json.dumps(reco.tolist()[0]))
        recomatrix.append(reco.tolist()[0])


# Aggregation Strategies
print(recomatrix)
#lm = leastmissery(recomatrix)
#lm = average(recomatrix)
lm = multiplicative(recomatrix)

result0 = {
    "restaurant_id": lm[0][0]+1,
    "wert": lm[0][1],
    "restaurant_name": "",
    "link": "",
    "description": ""
}
result1 = {
    "restaurant_id": lm[1][0]+1,
    "wert": lm[1][1],
    "restaurant_name": "",
    "link": "",
    "description": ""
}
name = db_getRestaurantName(int(json.dumps(result0["restaurant_id"])))[0][0]
result0["restaurant_name"] = name
name = db_getRestaurantName(int(json.dumps(result1["restaurant_id"])))[0][0]
result1["restaurant_name"] = name
# dict result = { restaurant = id, wert = int, name = restaurant_name}
####
link1 = db_getlink(result0["restaurant_id"])[0]
result0["link"] = link1
descp1 = db_getdescription(result0["restaurant_id"])[0]
result0["description"] = descp1
link2 = db_getlink(result1["restaurant_id"])[0]
result1["link"] = link2
descp2 = db_getdescription(result1["restaurant_id"])[0]
result1["description"] = descp2

print("\n")
print(json.dumps([result0,result1]))
# print(json.dumps(result1))
