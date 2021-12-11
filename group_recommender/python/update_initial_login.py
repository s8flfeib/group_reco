import sys
import json
from db_functions import *

input = json.loads(sys.argv[1]) 
print("we are here")
print(input)

#set initial login to flase
db_update_initial_login(input["user_id"])
db_set_train(input["user_id"])

print("updated")