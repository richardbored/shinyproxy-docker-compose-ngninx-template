library(shiny)
source("./server/server.R")
source("./ui/ui.R")

app <- shinyApp(
  ui = ui,
  server = server
)