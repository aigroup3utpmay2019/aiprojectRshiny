# https://datascienceplus.com/neuralnet-train-and-test-neural-networks-using-r/

concrete = read.csv("concrete.csv", header = TRUE)

normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

concrete_norm <- as.data.frame(lapply(concrete, normalize))

concrete_train <- concrete_norm[1:824, ] #773 = 75% 824 = 80 %
concrete_valid <- concrete_norm[825:1030, ] # 206 = 20 %

library(neuralnet)


n_model <- ""

trainneural <- function(cc_data, items, hl_num) {
  n_model <- neuralnet(items, data = cc_data, hidden = hl_num)
  return(n_model)
}

#n_model$result.matrix
#plot(n_model)
#
#concrete_pred <- compute(n_model, concrete_test[1:8])
#
#head(concrete_pred$net.result[[1]])
#
#head(n_model$net.result[[1]])