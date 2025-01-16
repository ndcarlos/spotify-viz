library(shiny)

server <- function(input, output, session) {
  # Reactive dataset filtered by user inputs
  filtered_data <- reactive({
    # Assume `spotify_data` is your dataset
    spotify_data %>%
      filter(
        (is.null(input$artist) || artist %in% input$artist),
        (is.null(input$genre) || genre %in% input$genre),
        plays >= input$plays,
        (is.null(input$location) || location %in% input$location),
        date >= input$timeframe[1] & date <= input$timeframe[2]
      ) %>%
      head(input$rows)
  })
  
  
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white',
         xlab = 'Waiting time to next eruption (in mins)',
         main = 'Histogram of waiting times')
  })
}