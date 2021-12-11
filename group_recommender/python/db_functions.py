from db_connect import connection
import json

import pickle

######################Caching der persoenlichen Recommendations#####################
# check if reco allready exists for user x und wenn ja hole diese


def db_checkReco(user_id):
    conn = connection()
    cur = conn.cursor()
    psql_query = 'SELECT EXISTS(SELECT * FROM recommendations WHERE user_id = %s)'
    cur.execute(psql_query, (user_id, ))
    res = cur.fetchone()[0]
    return res
# if exists get reco


def db_getReco(user_id):
    conn = connection()
    curr = conn.cursor()
    psql_select = 'SELECT reco FROM recommendations WHERE user_id = %s'
    curr.execute(psql_select, (user_id,))
    reco = curr.fetchone()[0]
    return(json.loads(reco))
# insert reco into recommendation fuer user i


def db_insertReco(user_id, reco):
    conn = connection()
    cur = conn.cursor()
    psql_query = 'INSERT INTO recommendations (user_id, reco) VALUES(%s,%s)'
    cur.execute(psql_query, (user_id, reco))
    conn.commit()
    return

def db_updateReco(user_id, reco):
    conn = connection()
    cur = conn.cursor()
    psql_query = 'UPDATE recommendations SET reco = %s WHERE user_id = %s'
    cur.execute(psql_query, (reco, user_id))
    conn.commit()
    return
#####################################################################################


################################# TABLE restaurants #################################
def db_getRestaurantName(restaurant_id):
    conn = connection()
    curr = conn.cursor()
    psql_select = 'SELECT name FROM restaurants WHERE restaurant_id = %s'
    curr.execute(psql_select, (restaurant_id,))
    name = curr.fetchall()
    return(name)

def db_getRestaurantId(name):
    conn = connection()
    curr = conn.cursor()
    psql_select = 'SELECT restaurant_id FROM restaurants WHERE name = %s'
    curr.execute(psql_select, (name,))
    id = curr.fetchall()
    return(id)


def db_countRestaurants():
    conn = connection()
    curr = conn.cursor()
    psql_select = 'SELECT COUNT (restaurant_id) FROM restaurants'
    curr.execute(psql_select)
    name = curr.fetchone()
    # print(name[0])
    return(name[0])

def db_getlink(restaurant_id):
    conn = connection()
    curr = conn.cursor()
    psql_select = 'SELECT links FROM restaurants WHERE restaurant_id=%s'
    curr.execute(psql_select,(restaurant_id,))
    links = curr.fetchone()
    return links

def db_getdescription(restaurant_id):
    conn = connection()
    curr = conn.cursor()
    psql_select = 'SELECT description FROM restaurants WHERE restaurant_id=%s'
    curr.execute(psql_select,(restaurant_id,))
    description = curr.fetchone()
    return description   


################################### TABLE users #########################################

# User_ID aus email
def db_GetUserID(email):
    conn = connection()
    curr = conn.cursor()
    psql_select = 'SELECT user_id FROM users WHERE email = %s'
    # email hier sonst security technisch schlecht!
    curr.execute(psql_select, (email,))
    user = curr.fetchall()
    return(user)


def db_checkUser(email):
    conn = connection()
    cur = conn.cursor()
    psql_query = 'SELECT EXISTS(SELECT * FROM users WHERE email = %s)'
    cur.execute(psql_query, (email, ))
    res = cur.fetchone()[0]
    return res

def db_update_initial_login(user_id):
    conn = connection()
    curr = conn.cursor()
    psql_update = "UPDATE users SET initiallogin = 'false' WHERE user_id=%s"
    curr.execute(psql_update, (user_id,))
    conn.commit()
    return
################################################3#########################################
#################################reviews#####################################
# Datenbank lesen reviews
def db_select1():

    conn = connection()
    curr = conn.cursor()
    psql_select = "SELECT stars FROM reviews"
    curr.execute(psql_select)
    rev = curr.fetchall()
    # for row in users:       # Muss noch in einer Variable gespeichert werden
    #     print("Id = ", row[0])
    #     print("Name = ", row[1])

    return rev


def db_insertGrading(user_id,restaurant_id):
    conn = connection()
    curr = conn.cursor()
    psql_select = "INSERT INTO reviews (user_id, restaurant_id, stars) VALUES (%s, %s, 0)"
    curr.execute(psql_select,(user_id,restaurant_id))
    conn.commit()
    return

# Liste von USER ID`s die geupdatet werden muessen mit neuer errechneten bewerung
def db_update(user_ID, restaurant_ID, bewertung):
    conn = connection()
    curr = conn.cursor()

    reviews = curr.fetchall
    for row in reviews:
        psql_update = "UPDATE reviews SET stars = %s WHERE user_id = %s AND restaurant_id = %s " % (
            bewertung, user_ID[reviews], restaurant_ID[reviews])

    curr.execute(psql_update)
    conn.commit()
    return
# Selektion


def db_selection(user_ID):  # alle bewertungen eines Users finden und in eine Datai schreiben
    conn = connection()
    curr = conn.cursor()
    psql_select = "SELECT * FROM reviews WHERE user_id = %s"
    # In variable speichern
    curr.execute(psql_select, (user_ID,))
    user = curr.fetchall()
    return user


def db_selectReco(user_ID):
    conn = connection()
    curr = conn.cursor()
    psql_select = "SELECT * FROM recommendations WHERE user_id = %s"
    # In variable speichern
    curr.execute(psql_select, (user_ID,))
    reco = curr.fetchall()
    return reco


def db_update_reviews(userid, restaurantid, stars):
    conn = connection()
    cur = conn.cursor()
    psql_query = "UPDATE reviews SET stars = %s WHERE user_id = %s AND restaurant_id = %s"
    cur.execute(psql_query, (stars, userid, restaurantid))
    conn.commit()
    return

def db_selectStars(user_ID, restaurant_ID):
    conn = connection()
    curr = conn.cursor()
    psql_select = "SELECT stars FROM reviews WHERE user_id = %s AND restaurant_id= %s"
    curr.execute(psql_select, (user_ID,restaurant_ID))
    stars = curr.fetchall()
    return stars



############################################ matrix$_mul #####################################

def db_set_matrix(some_matrix_id, matrix):
    print("HERE !")
    print(some_matrix_id)
    print("\n")
    print(matrix)
    conn = connection()
    curr = conn.cursor()
    psql_insert = "INSERT INTO q_matrix(matrix_id, np_array_bytes) VALUES (%s, %s)"
    curr.execute(psql_insert, (some_matrix_id, pickle.dumps(matrix)))
    conn.commit()
    return

def db_get_matrix_k(matrix_id):
    print("HERE!")
    print(matrix_id)
    conn = connection()
    curr = conn.cursor()
    psql_select = "SELECT np_array_bytes,k_value FROM q_matrix WHERE matrix_id = %s"
    curr.execute(psql_select, (matrix_id,))
    selection = curr.fetchall()[0]
    q_matrix = pickle.loads(selection[0])
    k_value = selection[1]
    return q_matrix,k_value

def db_num_of_trainings_users():
    conn = connection()
    curr = conn.cursor()
    psql_select = "SELECT COUNT(*) FROM users WHERE training_data='true'"
    curr.execute(psql_select)
    num_of_trainings_users = curr.fetchone()[0]
    return num_of_trainings_users

def db_add_to_trainings_users(user_id):
    conn = connection()
    curr = conn.cursor()
    psql_select = "UPDATE users SET training_data='true' WHERE user_id=%s"
    curr.execute(psql_insert, (user_id,))
    conn.commit()
    return

def db_get20Userratings(user_id):
    conn = connection()
    curr = conn.cursor()
    psql_query = "SELECT stars FROM reviews WHERE user_id=%s"
    curr.execute(psql_query, (user_id,))
    res = curr.fetchall()
    return res

def db_set_update_check_true():
    conn = connection()
    curr = conn.cursor()
    psql_query = "UPDATE q_matrix SET update_check='true'"
    curr.execute(psql_query)
    conn.commit()
    return

def db_set_update_check_false():
    conn = connection()
    curr = conn.cursor()
    psql_query = "UPDATE q_matrix SET update_check='false'"
    curr.execute(psql_query)
    conn.commit()
    return

def db_update_check():
    conn = connection()
    curr = conn.cursor()
    psql_query = "SELECT update_check FROM q_matrix"
    curr.execute(psql_query)
    res = curr.fetchone()[0]
    return res

def db_update_matrix(matrix):
    conn = connection()
    curr = conn.cursor()
    psql_insert = "UPDATE q_matrix SET np_array_bytes=%s"
    curr.execute(psql_insert, (pickle.dumps(matrix),))
    conn.commit()
    return

def db_set_train(user_id):
    conn = connection()
    curr = conn.cursor()
    psql_insert = "UPDATE users SET training_data='true' WHERE user_id=%s"
    curr.execute(psql_insert, (user_id,))
    conn.commit()
    return

def db_check_update_reco(user_id):
    conn = connection()
    curr = conn.cursor()
    psql_query = "SELECT update_reco FROM users WHERE user_id=%s"
    curr.execute(psql_query)
    res = curr.fetchone()[0]
    return res

def db_update_reco_false(user_id):
    conn = connection()
    curr = conn.cursor()
    psql_insert = "UPDATE users SET update_reco='false' WHERE user_id=%s"
    curr.execute(psql_insert, (user_id,))
    conn.commit()
    return

def db_updateReco(reco, user_id):
    conn = connection()
    curr = conn.cursor()
    psql_insert = "UPDATE recommendations SET reco=%s WHERE user_id=%s"
    curr.execute(psql_insert, (reco, user_id))
    conn.commit()
    return