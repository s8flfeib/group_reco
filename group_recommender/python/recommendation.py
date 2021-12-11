import numpy as np
import tensorflow.compat.v1 as tf
from matrix_mul_copy import tfmatrix
from db_functions import *



def recommendation(new_user_indices, new_user_ratings):

    final_Q_matrix, K = db_get_matrix_k("initial_matrix")

    tf.disable_v2_behavior()

    new_user_P_row_initial = np.random.rand(1, K)
    new_user_P_row = tf.Variable(new_user_P_row_initial, dtype=tf.float32)
    new_user_P_row_times_Q = tf.matmul(new_user_P_row, final_Q_matrix)

    res = tf.gather(new_user_P_row_times_Q, new_user_indices, axis=1)
    squared_error = tf.square(new_user_ratings - res)
    loss = tf.reduce_sum(squared_error)
    optimizer = tf.train.GradientDescentOptimizer(0.01)
    predict = optimizer.minimize(loss)

    sess = tf.Session()
    init = tf.global_variables_initializer()
    sess.run(init)

    for i in range(50000):
        sess.run(predict)

    final_new_user_P_row_times_Q = np.around(
        sess.run(new_user_P_row_times_Q), 3)

    return final_new_user_P_row_times_Q

