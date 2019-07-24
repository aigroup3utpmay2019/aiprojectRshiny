# normalise data from csv =====================================================
concrete = read.csv("concrete.csv", header = TRUE)

normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

concrete_norm <- as.data.frame(lapply(concrete, normalize))
concrete_train <- concrete_norm[1:773, ]
concrete_test <- concrete_norm[774:1030, ]

# neuralnet ===================================================================
library(neuralnet)
library(ggplot2)
library(plotly)
n_model <- ""
trainneural <- function(cc_data, items, hl_num) {
    n_model <- neuralnet(items, data = cc_data, hidden = hl_num)
    return(n_model)
}

# plot =======================================================================

estimatestrength <- function(hl_num, limit_x) {
    withProgress(message = 'Generating graph ...',
                detail = 'This may take a while...', value = 0, {

        incProgress(1/5)
        showNotification(paste("Training neural network model"), duration = 3)
        n_model <- trainneural(concrete_train,
            strength ~ cement + slag + ash + water + 
            superplastic + coarseagg + fineagg + age,
            hl_num)
        incProgress(1/5)
        Sys.sleep(.5)
        
        showNotification(paste("Computing predicted strength"), duration = 3)
        predicted_strength <- compute(n_model, concrete_test[1:8])$net.result
        incProgress(1/5)
        Sys.sleep(.5)
        
        showNotification(paste("Plotting graph for test strength data"), duration = 3)
        # p <- p + plot(concrete_test$strength, type="l", col="blue", bg = "gray")
        df <- concrete_test$strength
        df <- data.frame(matrix(unlist(df), nrow=length(df), byrow=T))
        plot_ly(concrete_test, x = ~cement, y = ~strength)
        #return(qplot(data = df, x = value,y = N,color=N)+geom_point())
        # # df$idu <- as.numeric(row.names(df))
        # p <- qplot(data = df, x = value,y = N,color=N) + geom_line()
        incProgress(1/5)
        Sys.sleep(.5)
        #p <- p + lines(predicted_strength, type="l", col="red", main=NULL)
        showNotification(paste("Plotting graph for predicted strength data"), duration = 3)
        incProgress(1/5)
        Sys.sleep(.5)
        
        #print(p)
        showNotification(paste("Graph has been plotted successfully!"), duration = 3)
    })
}

plotall <- function(){
  
  p <- plot(concrete_test$strength[c(1:limit_x)], type="l", col="blue")
  p <- p + lines(predicted_strength[c(1:limit_x)], type="l", col="red")
}

