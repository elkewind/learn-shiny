library(fresh)

create_theme(
  
  adminlte_color(
    light_blue = "#3D5E52"
  ),
  
  adminlte_global(
    content_bg = "#F0FFED"
  ),
  
  adminlte_sidebar(
    width = "400px",
    dark_bg = "#F0F0F0",
    dark_hover_bg = "#3D5E52",
    dark_color = "#3D5E52"
  ),
  
  output_file = "shiny-dashboard/www/fresh_theme.css"
  
)

