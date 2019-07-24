# function(input, output) {
#   output$plot <- renderPlot({
#     hist(rnorm(input$n), col = 'darkgray', border = 'white')
#   })
# }
source('plot.R')
library(neuralnet)

function(input, output) {

    output$gplot <- renderPlot({
        if (input$goButton == 0)
            return()
        
        z <- isolate({input$n})
        estimatestrength(z)
    })

    output$nplot <- renderPlot({
        if (input$goButton == 0)
            return()
        
        z <- isolate({input$n})
        plot(n_model)
    })

    output$csvtable <- renderDataTable(concrete_norm)
    output$tsttable <- renderDataTable(concrete_test)
    output$prdtable <- renderDataTable(concrete_train)
    
}