# load the "shiny" library
library(shiny)

# Define a new `ui` variable. This variable should be assigned a `fluidPage` layout
my.ui <- fluidPage(
  titlePanel("Cost Calculator"),
  
  numericInput("cost", label = "Price (in dollars)", value = 0, min = 0),
  
  numericInput("quantity", label = "Quantity", value = 1, min = 1),
  
  p(strong("Cost")),
  
  textOutput("cost")
  
)



# Define a `server` function (with appropriate arguments)
my.server <- function(input, output) {
  output$cost <- renderText({
    pq <- paste0("$", (input$cost * input$quantity))
    return(pq)
  })
}



shinyApp(ui = my.ui, server = my.server)
