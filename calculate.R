source("model.R")
calculate_strength <- function(a, b, c, d, e, f, g, h) {
  if (n_model == "") {
    n_model <- trainneural(concrete_train, strength ~ 
                             cement + slag + ash + water + 
                             superplastic + coarseagg + fineagg + age,
                           5)
  }
  
  # cement
  # slag
  # ash
  # water
  # superplastic
  # coarseagg
  # fineagg
  # age
  
  cement <- as.numeric(a)
  slag <-  as.numeric(b)
  ash <-  as.numeric(c)
  water <- as.numeric(d)
  superplastic <- as.numeric(e)
  coarseagg <-as.numeric(f)
  fineagg <- as.numeric(g)
  age <- as.numeric(h)
  
  # cement <- 0.25
  # slag <- 0.25
  # ash <- 0.25
  # water <- 0.25
  #   
  # superplastic <- 0.25
  # coarseagg <- 0.25
  # fineagg <- 0.25
  # age <- 0.25
  
  sdf <- data.frame(cement,slag,ash,water,superplastic,coarseagg,fineagg,age)
  
  pred_sdf <-compute(n_model, sdf)$net.result
  
  print(pred_sdf[[1]])
}