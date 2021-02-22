
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Meta-Analytic Estimation with DeepMA"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(h4("Settings")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h4("DeepMA Estimates"),
            tableOutput("estimates")
        )
    )
))
