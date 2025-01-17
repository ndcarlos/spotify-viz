library(shiny)

server <- function(input, output, session) {
  
  updateSelectizeInput(
    session,
    inputId = "my_input",
    choices = c("Option 1", "Option 2", "Option 3"),
    server = TRUE
  )
  # Reactive dataset filtered by user inputs
  filtered_data <- reactive({
    # Observe
    
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
  
  
  # Display summary of filtered data
  output$summary <- renderText({
    paste("Selected", nrow(filtered_data()), "rows from the dataset.")
  })
  
  # Create visualizations
  output$plot1 <- renderPlot({
    ggplot(filtered_data(), aes(x = artist, y = plays)) +
      geom_col() +
      theme_minimal() +
      labs(title = "Plays by Artist", x = "Artist", y = "Plays")
  })
  
  output$plot2 <- renderPlot({
    ggplot(filtered_data(), aes(x = date, y = plays, color = genre)) +
      geom_line() +
      theme_minimal() +
      labs(title = "Play Trends Over Time", x = "Date", y = "Plays")
  })
}