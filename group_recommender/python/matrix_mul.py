import numpy as np
import pandas as pd
import tensorflow.compat.v1 as tf
from db_functions import *


def tfmatrix():
    ratings = np.zeros((29, 20))
    reviews = np.zeros(20)
    # liefer list von [(reviewID,userID,RestaurantID,Stars),..]
    # print(db_selection(user_IDs[2]))
    for i in range(29):
        # zwischenspeichern eines Arrays fuer Revies eines user um dann in matrix zu setzen
        revs = []
        user = db_selection(i+1)
        for a in user:
            revs.append(a[3])

        ratings = np.delete(ratings, i, 0)
        ratings = np.insert(ratings, i, revs, axis=0)

    tf.disable_v2_behavior()

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
    squared_error = tf.square(P_times_Q - ratings)  # normalisieren ?
    loss = tf.reduce_sum(squared_error)

    optimizer = tf.train.GradientDescentOptimizer(0.01)
    train = optimizer.minimize(loss)

    sess = tf.Session()
    init = tf.global_variables_initializer()
    sess.run(init)

    for i in range(5000):
        sess.run(train, {ratings: R})

    final_P_times_Q = np.around(sess.run(P_times_Q), 3)
    final_P_matrix = np.around(sess.run(P_matrix), 3)
    final_Q_matrix = np.transpose(np.around(sess.run(Q_matrix), 3))

    return final_Q_matrix, K
