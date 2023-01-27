# ui ----
ui <- navbarPage( # create a nav bar
  
  title = "LTER Animal Data Explorer", # give it a title
  
  # page 1: intro tabPanel ----
  tabPanel(title = "About this App",
           
           "background info here"
           
           ), # END page 1 tabPanel
  
  #page 2: data tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel ----
           tabsetPanel(
          
             # trout tab ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebar panel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s)",
                                      choices = unique(clean_trout$channel_type),
                                      options = pickerOptions(actionsBox = TRUE),
                                      selected = unique(clean_trout$channel_type),
                                      multiple = TRUE
                                      ), # END channel type pickerInput
                          
                          # checkboxGroupButtonInput
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s):",
                                               choices = unique(clean_trout$section),
                                               selected = c("clear cut forest"),
                                               individual = FALSE,
                                               justified = TRUE,
                                               checkIcon = list(yes = icon("ok",
                                                                           lib = "glyphicon"),
                                                                no = icon("remove",
                                                                          lib = "glyphicon")))
                          
                        ), # END trout sidebar Panel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          plotOutput(outputId = "trout_scatterplot") %>% 
                            withSpinner(type = 4, color = "black")
                          
                        ) # END trout mainPanel
                        
                      ) # END sidebarLayout
               
                      ), # END trout tab
             
             # penguin tab ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebar panel ----
                        sidebarPanel(
                          
                          "penguin inputs here"
                          
                        ), # END penguin sidebar Panel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          "penguin output here"
                          
                        ) # END penguin mainPanel
                        
                      ) # END sidebarLayout
                      
                      ) # END penguins tab
             
           ) # ND tabsetPanel
           
           ) # END page 2 tabPanel
  
) # END navbar




