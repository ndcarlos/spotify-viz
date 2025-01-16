
library(shiny)

ui <- fluidPage(
  
  # Application title
  titlePanel("Vizify - Spotify Listener Insights"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("artist", "Select Artist(s):", choices = NULL, multiple = TRUE),
      selectInput("genre", "Select Genre(s):", choices = NULL, multiple = TRUE),
      numericInput("plays", "Number of Recent Plays:", value = 10, min = 1, step = 1),
      selectInput("location", "Select Artist Location(s):", choices = NULL, multiple = TRUE),
      dateRangeInput("timeframe", "Select Time Frame:"),
      numericInput("rows", "Number of Rows Returned:", value = 10, min = 1, step = 1)
    ),
    
    # Show a plot of the generated distribution
    tabsetPanel(
      tabPanel("Summary", textOutput("summary")),
      tabPanel("Visualizations", plotOutput("plot1"), plotOutput("plot2"))
    )
  )
)
