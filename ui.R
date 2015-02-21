library(shiny)
library(ggplot2)
data(mtcars)
shinyUI(pageWithSidebar(
  headerPanel("Comparison of MPG of cars"),
  sidebarPanel(
    helpText("This app shows a comparison of mpg of selected car models based on the type of Transmission and Number of Cylinders selected. Select the options from the drop down menus and hit Submit to see a display of BarPlot."),
    selectInput("cyl","Cylinders", c(4,6,8)),
    selectInput("am","Transmission", c("Automatic", "Manual","Either")),
    submitButton("Submit")
  ),
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("mpgPlot")
    )
))

                                  
                        