from recommendation import recommendation
from db_connect import connection
from db_functions import *
import numpy as np
import math

#test = [[4.394000053405762, 4.004000186920166, 0.3869999945163727, 2.0, 2.234999895095825, 1.6100000143051147, 3.578000068664551, 3.500999927520752, 2.2320001125335693, 1.6440000534057617, 3.503999948501587, 1.6449999809265137, 3.8529999256134033, 4.349999904632568, 4.691999912261963, 3.565000057220459, 3.313999891281128, 3.052000045776367, 3.125999927520752, 4.184999942779541],
# [5.354000091552734, 3.2090001106262207, 1.7029999494552612, 1.4859999418258667, 2.5820000171661377, 0.7149999737739563, 2.885999917984009, 3.3980000019073486, 2.305000066757202, 0.38100001215934753, 4.348999977111816, 1.8140000104904175, 3.188999891281128, 3.4609999656677246, 4.297999858856201, 3.4100000858306885, 4.057000160217285, 4.078999996185303, 2.36299991607666, 3.561000108718872]]


def leastmissery(group):
    mins = [min(x) for x in zip(*group)]
    # sortieren der mins
    minlist = list(enumerate(mins))
    sortmins = sorted(minlist, key=lambda x: x[1])
    # sortet list of tupels (restaurant_id, rating)
    res = []
    res.append(sortmins[-1])
    res.append(sortmins[-2])
    return res
    # return max(enumerate(mins), key=lambda x: x[1])


def mostpleasure(group):
    maxi = [max(x) for x in zip(*group)]
    maxilist = list(enumerate(maxi))
    sortmaxi = sorted(maxilist, key=lambda x: x[1])
    res = []
    res.append(sortmaxi[-1])
    res.append(sortmaxi[-2])
    print(res)
    return res


def average(group):
    avglist = list(sum(x)/len(group) for x in zip(*group))
    sortavglist = sorted(list(enumerate(avglist)), key=lambda x: x[1])
    res = []
    res.append(sortavglist[-1])
    res.append(sortavglist[-2])
    return res

def multiplicative(group):
    #multipliziere bewertung miteinander
    mullist = list(math.prod(x) for x in zip(*group))
    #sortiere liste mit restaurant_ids
    sortlist = sorted(list(enumerate(mullist)), key=lambda x: x[1])
    res = []
    res.append(sortlist[-1])
    res.append(sortlist[-2])
    print(res)
    return res