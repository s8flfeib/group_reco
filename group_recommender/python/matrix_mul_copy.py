import numpy as np
import pandas as pd
# import tensorflow as tf
import tensorflow.compat.v1 as tf
from db_functions import *
from db_connect import connection
import json



def tfmatrix():
    # 20colums == Number of Restaurants used in our system
    # 30rows == Number of Users used to train the model
    colums = db_countRestaurants()
    rows = db_num_of_trainings_users()
    #Create Matrix(np.array) of the Size (Colums = num of restaurants, rows = users used for training)
    #And fill with ratings 
    #Create np.array of size (rows,colums) bzw (user, reviews/num_restaurants) filled with 0s
    ratings = np.zeros((rows, colums))

    #Fill the "empty" np.array with ratings from the 30 user
    for k in range(rows):
        revs = []
        for i in db_get20Userratings(k+1):
            revs.append(i[0])
        ratings = np.delete(ratings, k, 0)
        ratings = np.insert(ratings, k, revs, axis=0)

    #create p, q matrix and train the model
    tf.disable_v2_behavior()
    
    #K entspricht der size der q_matrix
    K = 2
    R = ratings

    N = len(ratings)            # Anzahl der Nutzer
    M = len(ratings[0])         # Anzahl der Restaurants
    P = np.random.rand(N, K)    # Matrx mit latent Factoren für User 1
    Q = np.random.rand(M, K)    # Matrix mit Latent Faktoren 2 für Restaurants

    N = len(ratings)  # Anzahl der Nutzer
    M = len(ratings[0])  # Anzahl der Restaurants
    P = np.random.rand(N, K)  # Matrx mit latent Factoren fuer User 1
    Q = np.random.rand(M, K)  # Matrix mit Latent Faktoren 2 fuer Restaurants

    ratings = tf.placeholder(tf.float32, name="ratings")
    P_matrix = tf.Variable(P, dtype=tf.float32)
    Q_matrix = tf.Variable(Q, dtype=tf.float32)
    P_times_Q = tf.matmul(P_matrix, Q_matrix, transpose_b=True)
    squared_error = tf.square(P_times_Q - ratings)  
    loss = tf.reduce_sum(squared_error)

    optimizer = tf.train.GradientDescentOptimizer(0.01)
    train = optimizer.minimize(loss)

    sess = tf.Session()
    init = tf.global_variables_initializer()
    sess.run(init)

    for i in range(5000):
        sess.run(train, {ratings: R})

    final_P_times_Q = np.around(sess.run(P_times_Q), 1)
    final_P_matrix = np.around(sess.run(P_matrix), 3)
    final_Q_matrix = np.transpose(np.around(sess.run(Q_matrix), 3))
    return final_Q_matrix, K


