###h2oEnsemble is an R package which can used for building ensemble models and this package is currently available in R only. 
###Hence the code for the following section was written in R instead of Python



###### One time install of h20 ensemble package & data.table package from GitHub.
# library(devtools)
# install_github("h2oai/h2o-3/h2o-r/ensemble/h2oEnsemble-package")
# install_github("Rdatatable/data.table")


### Start H2O Cluster
library(h2oEnsemble)  # This will load the `h2o` R package as well
h2o.init(nthreads = -1 , max_mem_size = "32g")  # Start an H2O cluster with nthreads = num cores on your machine
h2o.removeAll() # Clean slate - just in case the cluster was already running


### Loading data into H2O Cluster

setwd("/home/anusha/cscie-63/project")
cv_train <- h2o.importFile(path = normalizePath("./foldpro_final.csv"))
y <- "LABEL"
x <- setdiff(names(cv_train), y)

### Converting response column to enum type

cv_train[,y] <- as.factor(cv_train[,y])  

### Specify Base Learners & Metalearner

learner <- c("h2o.glm.wrapper", "h2o.randomForest.wrapper", 
             "h2o.gbm.wrapper", "h2o.deeplearning.wrapper")
metalearner <- "h2o.glm.wrapper"

### Training + Cross-validation of Ensemble ; Folds = 10
foldCount = 10

ens <- h2o.ensemble(x = x, y = y, 
                    training_frame = cv_train, 
                    family = "binomial", 
                    learner = learner, 
                    metalearner = metalearner,
                    cvControl = list(V = foldCount))

leveloneDf = ens$levelone
folds = ens$folds

### Level2 Cross validation prediction results are necessary to benchmark the h2o ensemble method against original paper.
# h2o Ensemble Object seems to provide no method to access internal Level2 cross validation predictions.
# Creating Level2 cross-validation predictions external to ensemble object for algorithm Benchmarking purposes.
# Ref1 : http://mlwave.com/kaggle-ensembling-guide/
# Ref2 : https://github.com/emanuele/kaggle_pbr/blob/master/blend.py

cv_probabilties = as.data.frame( rep( 0 , NROW(cv_train) ) )

for (i in  1:foldCount){
  print(paste("Fold Begin:", i))
  
  train_records = which(!( folds %in% i))
  val_records = which( folds %in% i)
  
  glm_cv = h2o.glm(training_frame = leveloneDf[train_records,] ,
                   #validation_frame = leveloneDf[val_records,],
                   x = learner, 
                   y = "y", 
                   family='binomial')

  cv_probabilties[val_records,1] = as.data.frame( h2o.predict(object = glm_cv, newdata = leveloneDf[val_records,])[,3] )
  print(paste("Fold Completed:", i))
}

### AUC Scores : Comparison
library(cvAUC)

# 10 Fold - Ensemble AUC
cvAUC::AUC(predictions = cv_probabilties, labels = as.data.frame(leveloneDf)[,"y"])
print ("10 Fold - Ensemble AUC")
print( cvAUC::AUC(predictions = cv_probabilties, labels = as.data.frame(leveloneDf)[,"y"]) )
# 0.951009

# 10 Fold - Base learners AUC
L <- length(learner)
auc <- sapply(seq(L), function(l) cvAUC::AUC(predictions = as.data.frame(leveloneDf)[,l], labels = as.data.frame(leveloneDf)[,"y"] ))
print ( data.frame(learner, auc) )

#                    learner       auc
#1           h2o.glm.wrapper 0.9372006
#2  h2o.randomForest.wrapper 0.9500034
#3           h2o.gbm.wrapper 0.9397503
#4  h2o.deeplearning.wrapper 0.9048005

# Creating a predictions output file to Compute Top1/Top5 sensitivity score for Benchmarking purpose
# Ref for package: data.table : http://stackoverflow.com/questions/9703068/most-efficient-way-of-exporting-large-3-9-mill-obs-data-frames-to-text-file

Id = read.csv("IdFile.txt" , header =FALSE)
Id$Pred = as.array( cv_probabilties )
fwrite( Id , "ensemble_prediction.csv" , sep=" ",  col.names=FALSE , quote = FALSE)

#### All done, shutdown H2O
h2o.shutdown(prompt=FALSE)
