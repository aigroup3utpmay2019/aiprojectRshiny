# function(input, output) {
#   output$plot <- renderPlot({
#     hist(rnorm(input$n), col = 'darkgray', border = 'white')
#   })
# }
source('plot.R')
source('calculate.R')
library(neuralnet)
library(ggplot2)
library(plotly)
function(input, output, session) {

    observeEvent(input$button_calculate,{
            updateTextInput(
                session = session,
                inputId = 'text_result',
                value = calculate_strength(
                    input$text_cement,
                    input$text_slag,
                    input$text_ash,
                    input$text_water,
                    input$text_superplastic,
                    input$text_coarseagg,
                    input$text_fineagg,
                    input$text_age
                )
            ) # updateSliderInput        
    })

    output$total_ratio <- renderText({ 
        sum(
            as.numeric(input$text_cement),
            as.numeric(input$text_slag), 
            as.numeric(input$text_ash), 
            as.numeric(input$text_water), 
            as.numeric(input$text_superplastic), 
            as.numeric(input$text_coarseagg), 
            as.numeric(input$text_fineagg),
            as.numeric(input$text_age)
        )
    })
    
    output$gplot <- renderPlotly({
        plot_ly(concrete, x = ~cement, y = ~strength, type="scatter", mode="line")
        #estimatestrength(z, 70)
    })
    
    
    output$csvtable <- renderDataTable(concrete_norm)
    output$tsttable <- renderDataTable(concrete_test)
    output$prdtable <- renderDataTable(concrete_train)
    
    observeEvent(input$text_cement,{
        if(as.numeric(input$text_cement) != input$slider_cement)
        {
            updateSliderInput(
                session = session,
                inputId = 'slider_cement',
                value = input$text_cement
            ) # updateSliderInput
        }#if
        
        
    })
    
    observeEvent(input$slider_cement,{
        if(as.numeric(input$text_cement) != input$slider_cement)
        {
            updateTextInput(
                session = session,
                inputId = 'text_cement',
                value = input$slider_cement
            ) # updateTextInput
            
        }#if
        
    })
    
    # ================================================================
    
    observeEvent(input$text_slag,{
        if(as.numeric(input$text_slag) != input$slider_slag)
        {
            updateSliderInput(
                session = session,
                inputId = 'slider_slag',
                value = input$text_slag
            ) # updateSliderInput
        }#if
        
        
    })
    
    observeEvent(input$slider_slag,{
        if(as.numeric(input$text_slag) != input$slider_slag)
        {
            updateTextInput(
                session = session,
                inputId = 'text_slag',
                value = input$slider_slag
            ) # updateTextInput
            
        }#if
        
    })
    
    #==============================================================
    
    observeEvent(input$text_ash,{
        if(as.numeric(input$text_ash) != input$slider_ash)
        {
            updateSliderInput(
                session = session,
                inputId = 'slider_ash',
                value = input$text_ash
            ) # updateSliderInput
        }#if
        
        
    })
    
    observeEvent(input$slider_ash,{
        if(as.numeric(input$text_ash) != input$slider_ash)
        {
            updateTextInput(
                session = session,
                inputId = 'text_ash',
                value = input$slider_ash
            ) # updateTextInput
            
        }#if
        
    })
    
    #=============================================================
    
    observeEvent(input$text_water,{
        if(as.numeric(input$text_water) != input$slider_water)
        {
            updateSliderInput(
                session = session,
                inputId = 'slider_water',
                value = input$text_water
            ) # updateSliderInput
        }#if
        
        
    })
    
    observeEvent(input$slider_water,{
        if(as.numeric(input$text_water) != input$slider_water)
        {
            updateTextInput(
                session = session,
                inputId = 'text_water',
                value = input$slider_water
            ) # updateTextInput
            
        }#if
        
    })
    
    #============================================================
    
    observeEvent(input$text_superplastic,{
        if(as.numeric(input$text_superplastic) != input$slider_superplastic)
        {
            updateSliderInput(
                session = session,
                inputId = 'slider_superplastic',
                value = input$text_superplastic
            ) # updateSliderInput
        }#if
        
        
    })
    
    observeEvent(input$slider_superplastic,{
        if(as.numeric(input$text_superplastic) != input$slider_superplastic)
        {
            updateTextInput(
                session = session,
                inputId = 'text_superplastic',
                value = input$slider_superplastic
            ) # updateTextInput
            
        }#if
        
    })
    
    #==========================================================
    
    observeEvent(input$text_coarseagg,{
        if(as.numeric(input$text_coarseagg) != input$slider_coarseagg)
        {
            updateSliderInput(
                session = session,
                inputId = 'slider_coarseagg',
                value = input$text_coarseagg
            ) # updateSliderInput
        }#if
        
        
    })
    
    observeEvent(input$slider_coarseagg,{
        if(as.numeric(input$text_coarseagg) != input$slider_coarseagg)
        {
            updateTextInput(
                session = session,
                inputId = 'text_coarseagg',
                value = input$slider_coarseagg
            ) # updateTextInput
            
        }#if
        
    })
    
    #==========================================================
    
    observeEvent(input$text_fineagg,{
        if(as.numeric(input$text_fineagg) != input$slider_fineagg)
        {
            updateSliderInput(
                session = session,
                inputId = 'slider_fineagg',
                value = input$text_fineagg
            ) # updateSliderInput
        }#if
        
        
    })
    
    observeEvent(input$slider_fineagg,{
        if(as.numeric(input$text_fineagg) != input$slider_fineagg)
        {
            updateTextInput(
                session = session,
                inputId = 'text_fineagg',
                value = input$slider_fineagg
            ) # updateTextInput
            
        }#if
        
    })
    
    #=========================================================
    
    observeEvent(input$text_age,{
        if(as.numeric(input$text_age) != input$slider_age)
        {
            updateSliderInput(
                session = session,
                inputId = 'slider_age',
                value = input$text_age
            ) # updateSliderInput
        }#if
        
        
    })
    
    observeEvent(input$slider_age,{
        if(as.numeric(input$text_age) != input$slider_age)
        {
            updateTextInput(
                session = session,
                inputId = 'text_age',
                value = input$slider_age
            ) # updateTextInput
            
        }#if
        
    })
    
}