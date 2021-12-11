import json
import sys
from db_functions import *


Input = json.loads(sys.argv[1])
user = json.loads(sys.argv[2])
user_id = user["user_id"]
restaurant_id =  db_getRestaurantId(Input["Restaurant"])[0][0]

print(restaurant_id)
print(type(restaurant_id))

newrating = int(Input["Input"])
oldrating = db_selectStars(user_id, restaurant_id)[0][0]

print("newRating:")
print(newrating)

if(newrating == oldrating):
    print("Ratings did not change")
else:
    print("new Rating")
    db_update_reviews(user_id, restaurant_id, Input["Input"])
