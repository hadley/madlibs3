library(shiny)

# Define the UI
ui <- fluidPage(
  titlePanel("Mad Libs Story Generator"),

  sidebarLayout(
    sidebarPanel(
      textInput("noun1", "Enter a noun:", value = "cat"),
      textInput("adj1", "Enter an adjective:", value = "fluffy"),
      textInput("verb1", "Enter a verb (past tense):", value = "jumped"),
      textInput("adverb1", "Enter an adverb:", value = "quickly"),
      textInput("noun2", "Enter another noun:", value = "tree"),
      textInput("adj2", "Enter another adjective:", value = "tall"),
      textInput("verb2", "Enter another verb:", value = "climb"),
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
    generateStory(
      input$noun1,
      input$adj1,
      input$verb1,
      input$adverb1,
      input$noun2,
      input$adj2,
      input$verb2
    )
  })
  output$story <- renderText({
    story()
  })
}

generateStory <- function(noun1, adj1, verb1, adverb1, noun2, adj2, verb2) {
  paste0("Once upon a time, there was a ", adj1, " ", noun1, " who ",
         verb1, " ", adverb1, " through the enchanted forest. ",
         "Suddenly, a magical ", noun2, " appeared! ",
         "The ", noun1, " was so surprised that they immediately ",
         verb2, ". ",
         "In the end, everyone lived happily ever after in a ",
         adj2, " castle.")
}

# Run the app
shinyApp(ui = ui, server = server)
