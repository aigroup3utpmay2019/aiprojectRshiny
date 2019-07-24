source('calculate.R')
library(neuralnet)
library(ggplot2)
library(plotly)


# read csv =====================================================
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

concrete <- read.csv("concrete.csv", header = TRUE)
concrete_norm <- as.data.frame(lapply(concrete, normalize))
concrete_train <- concrete_norm[1:824, ] #773 = 75% 824 = 80 %
concrete_valid <- concrete_norm[825:1030, ] # 206 = 20 %

n_model <- ""
n_layer <- ""

# model ========================================================

trainneural <- function(hl_num) {
  showNotification(sprintf("Training neural network model, hidden layers = %d", hl_num), duration = 10)
  n_model <- neuralnet(strength ~ 
             cement + slag + ash + water + 
             superplastic + coarseagg + fineagg + age,
             data = concrete_train,
             hidden = hl_num)
  n_layer <- hl_num
  return(n_model)
}

plotneural <- function(hl_num){
  if (n_layer != hl_num){
    n_model <- trainneural(hl_num)
  }
  return(plot(n_model))
}

# https://datascienceplus.com/neuralnet-train-and-test-neural-networks-using-r/

tabulate_matrix <- function (){
    return(as.data.frame( as.table(n_model$result.matrix)))
}

# calculate ==================================================================

calculate_strength <- function(a, b, c, d, e, f, g, h) {
  if (n_model == "") {
    n_model <- trainneural(5)
  }

  cement <- as.numeric(a)
  slag <-  as.numeric(b)
  ash <-  as.numeric(c)
  water <- as.numeric(d)
  superplastic <- as.numeric(e)
  coarseagg <-as.numeric(f)
  fineagg <- as.numeric(g)
  age <- as.numeric(h)
  
  sdf <- data.frame(cement,slag,ash,water,superplastic,coarseagg,fineagg,age)
  
  pred_sdf <-compute(n_model, sdf)$net.result
  showNotification(paste("Getting result..."), duration = 3)
  print(pred_sdf[[1]])
}

# plot =======================================================================
plot_real_vs_pred <- function(){
  if (n_model == "") {
    n_model <- trainneural(5)
  }
  showNotification(paste("Computing predicted strength"), duration = 3)
  rvp_graph <-concrete_valid
  rvp_graph$index <- seq.int(nrow(rvp_graph))
  rvp_graph$predicted_strength <- compute(n_model, concrete_valid[1:8])$net.result
  plot_ly(rvp_graph, x = ~index, y = ~strength, name = 'real strength', type="scatter", mode="lines") %>%
    add_trace(y = ~predicted_strength, name = 'predicted_strength', mode = 'lines+markers') 
}

# trace_0 <- rnorm(100, mean = 5)
# trace_1 <- rnorm(100, mean = 0)
# trace_2 <- rnorm(100, mean = -5)
# x <- c(1:100)
# 
# data <- data.frame(x, trace_0, trace_1, trace_2)
# 
# p <- plot_ly(data, x = ~x) %>%
#   add_trace(y = ~trace_0, name = 'trace 0',mode = 'lines') %>%
#   add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers') %>%
#   add_trace(y = ~trace_2, name = 'trace 2', mode = 'markers')

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
        plot_real_vs_pred()

    })
    
    
    output$csvtable <- renderDataTable(concrete_norm)
    output$tsttable <- renderDataTable(concrete_valid)
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
