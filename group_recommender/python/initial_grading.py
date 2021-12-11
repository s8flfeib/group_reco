import sys
import json
from db_functions import *

#input = {"email":"test@test1.de","Input":["","","","","","","","","","","","","","","","","","","","5"]}
print("This is a Test")

input = json.loads(sys.argv[1]) 
print(input)
#liefert die user_id, argv[2] ist der aktuelle user mit name, password,.. (req.user in server)
user = json.loads(sys.argv[2])
user_id = int(user["user_id"])
#input.pop("email", None)

count1 = 0
for i in input["Input"]:
    count1 = count1+1
    db_insertGrading(user_id,count1)


count = 0
for i in input["Input"]:
    count = count + 1
    if(i == ""):
        # db_update_reviews(userid, count, 0)
        # Wir wollen nicht auf 0 setzen wenn schon bewertet wurde 
        # Eigentlich brauchen wir eine Seite wo wir gezielt restaurants bewerten lassen koennen
        continue
    else:
        print(user_id, count, i)
        db_update_reviews(user_id, count, i)

    