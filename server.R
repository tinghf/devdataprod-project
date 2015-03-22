# http://cran.r-project.org/web/packages/rpart.plot/rpart.plot.pdf
# http://www.milbo.org/rpart-plot/prp.pdf
library(shiny)
library(rpart)
library(rpart.plot)
data(ptitanic) 
tree <- rpart(survived ~ ., data=ptitanic, cp=.02) # cp=.02 because want small tree for demo


shinyServer(function(input, output, session) {

  output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    
    cols <- ifelse(tree$frame$yval == 1, input$survive.col, input$died.col)
    # green if survived
    prp(tree, main="assorted arguments",
    extra=106, # display prob of survival and percent of obs
    nn=input$nn, # display the node numbers
    fallen.leaves=input$fallen.leaves, # put the leaves on the bottom of the page
    branch=.5, # change angle of branch lines
    faclen=0, # do not abbreviate factor levels
    trace=input$trace, # print the automatically calculated cex
    shadow.col=input$shadow.col, # shadows under the leaves
    branch.lty=3, # draw branches using dotted lines
    split.cex=1.2, # make the split text larger than the node text
    split.prefix=input$split.prefix,  # put "is " before split text
    split.suffix=input$split.suffix, # put "?" after split text
    col=cols, border.col=cols, # green if survived
    split.box.col="lightgray", # lightgray split boxes (default is white)
    split.border.col="darkgray", # darkgray border on split boxes
    split.round=input$split.round) # round the split box corners a tad

  })

})