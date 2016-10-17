#!/home/anusha/anaconda2/bin/python

import sys
import pandas as pd
import csv
from sklearn.preprocessing import MinMaxScaler
import warnings
warnings.filterwarnings("ignore")

r = MinMaxScaler((0.01,1))



inputFile = open( sys.argv[1] , "r" )
id_list = []
data_list = []

for line in inputFile :
    tokens = line.split(" ")
    data_list.append ( float(tokens[-1]))
    id_list.append ( " ".join (tokens[:-1]))
    
c2 = r.fit_transform ( data_list)

outDf1 = pd.DataFrame( zip ( id_list , c2 ) , columns = ["PairId","Probability"])
outDf1.to_csv(sys.argv[2]  , 
              sep = " " , 
              header = False , 
              index = False , 
              quoting= csv.QUOTE_NONE , 
              quotechar='',
              escapechar=' ')