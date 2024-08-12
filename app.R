library(shiny)

# Define the UI
ui <- fluidPage(
  titlePanel("Mad Libs Story Generator"),

  sidebarLayout(
    sidebarPanel(
      textInput("noun1", "Enter a noun:"),
      textInput("adj1", "Enter an adjective:"),
      textInput("verb1", "Enter a verb (past tense):"),
      textInput("adverb1", "Enter an adverb:"),
      textInput("noun2", "Enter another noun:"),
      textInput("adj2", "Enter another adjective:"),
      textInput("verb2", "Enter another verb:"),
      actionButton("generate", "Generate Story!")
    ),

    mainPanel(
      h3("Your Mad Libs Story:"),
      textOutput("story")
    )
  )
)

# Define the server logic
server <- function(input, output) {

  story <- eventReactive(input$generate, {
    paste0("Once upon a time, there was a ", input$adj1, " ", input$noun1, " who ",
           input$verb1, " ", input$adverb1, " through the enchanted forest. ",
           "Suddenly, a magical ", input$noun2, " appeared! ",
           "The ", input$noun1, " was so surprised that they immediately ",
           input$verb2, ". ",
           "In the end, everyone lived happily ever after in a ",
           input$adj2, " castle.")
  })

  output$story <- renderText({
    story()
  })
}

# Run the app
shinyApp(ui = ui, server = server)
