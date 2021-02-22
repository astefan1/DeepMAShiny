#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    # Read in data
    toytrain <- read.csv("toyTrainX.csv")
    toytrain <- as.matrix(toytrain[,-1])
    colnames(toytrain) <- NULL
    
    # Read in model fit
    library(reticulate)
    use_python("/Users/angelika/.pyenv/versions/3.8.6/bin/python3", required=TRUE)
    #use_virtualenv("../DeepMAenv", required=T)
    library(keras)
    DeepMAModel <- keras::load_model_hdf5("deepMA_SMN_PIVEN_EstOnly_TrnOnly.h5")
    
    # Plot estimates
    output$estimates <- renderTable({
        preds <- predict(DeepMAModel, toytrain)
        preds <- matrix(unlist(preds), ncol=length(preds))
        colnames(preds) <- c("Delta", "Tau")
        preds
    })

})
