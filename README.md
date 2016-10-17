# Machine-Learning-with-H2O.ai
1.	Problem statement

The goal of this project is twofold.

1.	Evaluate the following different ways of using H2O.ai for Machine learning
  a.	H2O directly from Python
  b.	H2O directly from R
  c.	PySparkling from local standalone Spark cluster
  d.	H2O Flow on Desktop mode
2.	Demonstrate the use of following H2O algorithms on a lesser known Benchmark dataset used by academics and compare the performance metrics
  a.	Deep Learning
  b.	Gradient Boosting Machine
  c.	Generalized Linear Model
  d.	Distributed Random Forest
  e.	Ensembles stacking using R

2.	Dataset

The Protein Fold recognition is a posed as binary classification with a goal of identify proteins that have similar tertiary structure. The FOLDpro dataset is a comprehensive dataset used to benchmark multiple algorithms for this task.

The features corresponding to combinations of 976 proteins among which 555 proteins have at least one positive match with other proteins at the family level, 434 proteins at the super-family level, and 321 proteins at the fold level. The FOLDpro dataset was retrieved from UCI webpage at 
http://mine5.ics.uci.edu:1026/fold_help.html

The total number of records in the dataset is 951,600 ( i.e 976 x 975 ).  Each record consists of 84 features, description of the which may be found in the table below. The file is in LIBSVM format and the uncompressed file size is 1.5GB.

J.Cheng et al have demonstrated that RandomForests to be a suitable algorithm for this task. I shall try and replicate their results using H2O implementation of RandomForest and also  evaluate performance of other algorithms on this dataset.
