# load packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)
library(DT)

# ui ----
ui <- fluidPage(
  
  # app title ----
  tags$h1("Single-file App Example"), # alternative: h1("...")
  
  # app subtitle ----
  tags$p(tags$strong("Exploring Antarctic Penguin Data")),
  
  # body mass slider input ----
  sliderInput(inputId = "body_mass_input", 
              label = "Select a range of body masses (g)",
              min = 2700, 
              max = 6300,
              value = c(3000, 4000)),
  
  # body mass plot output ----
  plotOutput(outputId = "bodyMass_scatterPlot"),
  
  # check box input ----
  checkboxGroupInput(inputId = "check_box_input",
                     label = "Select year(s)",
                     choices = c(2007, 2008, 2009), # OR unique(penguins$year)
                     selected = c(2007, 2008, 2009)),
  
  # check box output ----
  DT::dataTableOutput(outputId = "penguin_data")
  
) # END fluidPage


# server ----
server <- function(input, output) {
  
  # filter mass data ----
  body_mass_df <- reactive({
    
  penguins %>% 
    filter(body_mass_g %in% input$body_mass_input[1]:input$body_mass_input[2])
    
  }) # END filter data reactively
  
  # render scatter plot ----
  output$bodyMass_scatterPlot <- renderPlot({
    
    ggplot(na.omit(body_mass_df()), 
           aes(x = flipper_length_mm, 
               y = bill_length_mm,
               color = species,
               shape = species)) +
      geom_point() + 
      scale_color_manual(values = c("Adelie" = "#FEA346",
                                    "Chinstrap" = "#B251F1",
                                    "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19,
                                    "Chinstrap" = 17,
                                    "Gentoo" = 15))
    
  }) # END render scatter plot
  
  # filter year data ----
  penguins_interact <- reactive({
    penguins %>% 
      filter(year %in% c(input$check_box_input[1],
                         input$check_box_input[2],
                         input$check_box_input[3]))
  
  }) # END filter DT
 
  # render DT ----
  output$penguin_data <- DT::renderDataTable({penguins_interact()
    
  }) # END render DT
    
} # END server


# combine ui & server ---- 
shinyApp(ui = ui, server = server)

