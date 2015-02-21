library(shiny)
library(datasets)
data(mtcars)
mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))
mtcars$cars <- rownames(mtcars)
shinyServer(function(input, output) {
  mtcars1 <- reactive({
    if(input$am == "Either") {mtcars[mtcars$cyl == input$cyl,]} else
    {mtcars[mtcars$cyl==input$cyl & mtcars$am == input$am,]}
  })
  output$caption <- renderText({"Compare MPG of cars"})
  output$mpgPlot <- renderPlot({
     ggplot(mtcars1(), aes(x = cars, y = mpg )) + geom_bar(fill = "red", stat = "identity")
  })
})
  
