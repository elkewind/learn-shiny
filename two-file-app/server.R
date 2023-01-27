# server ----
server <- function(input, output) {
  
  # trout df ----
  trout_filtered_df <- reactive({
    
    validate(
      need(length(input$channel_type_input) > 0, 
           "Please select at least one channel type."),
      need(length(input$section_input) >0,
           "Please select at least one section")
    )
    
    clean_trout %>% 
      filter(channel_type %in% c(input$channel_type_input)) %>% 
      filter(section %in% c(input$section_input))
    
  })
  
  # plot trout ----
  output$trout_scatterplot <- renderPlot({
    
    ggplot(trout_filtered_df(), aes(x = length_mm, y = weight_g,
                            color = channel_type)) +
      geom_point(alpha = 0.4, size = 5) +
      scale_color_manual(values = c("R" = "blue",
                                    "C" = "purple",
                                    "S" = "black",
                                    "P" = "yellow",
                                    "SC" = "pink",
                                    "I" = "orange",
                                    "IP" = "red"))
    
  }, alt = "some alt text will live here"
  
  )
}