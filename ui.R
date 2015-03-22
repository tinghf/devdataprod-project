shinyUI(pageWithSidebar(
  headerPanel("RPart prp plot"),
  sidebarPanel(
    checkboxInput("nn", p("Display the node numbers?", value = TRUE)),
    checkboxInput("fallen.leaves", p("Put the leaves on the bottom of the page?", value = TRUE)),
    checkboxInput("trace", p("Print the automatically calculated cex?", value = TRUE)),
    selectInput('shadow.col', 'Color of the shadow', c("", "gray", "darkgray"), selected="gray"),
    # selectInput('branch.lty', 'Line type ', c(1,2,3,4,5), selected = 1),
    textInput('split.prefix', 'Text before Split=', value="is "),
    textInput('split.suffix', 'Text after Split=', value="?"),
    selectInput('survive.col', 'Survive col', colors(), selected="green4"),
    selectInput('died.col', 'Died col', colors(), selected="darkred"),
    numericInput('split.round', 'Controls the rounding of the corners of the split boxes', value=0)
                  
  ),

  mainPanel(
    h3('rpart model plot output'),
    plotOutput('plot1')
  )  
))