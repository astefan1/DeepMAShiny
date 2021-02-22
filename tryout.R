# Set up Python and Reticulate
library(reticulate)
use_python("/Users/angelika/.pyenv/versions/3.8.6/bin/python3", required=TRUE)
py_discover_config()
reticulate::use_virtualenv("./DeepMAenv", required=T)

# Read in model fit (h5 file)
library(keras)
DeepMAModel = keras::load_model_hdf5("deepMA_SMN_PIVEN_EstOnly_TrnOnly.h5")
summary(DeepMAModel)

# Read in training data
toytrain <- read.csv("toyTrainX.csv")
toytrain <- as.matrix(toytrain[,-1])
colnames(toytrain) <- NULL
head(toytrain)

# Get predictions
predictions <- predict(DeepMAModel, toytrain)
