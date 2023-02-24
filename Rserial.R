#load required packages
library(tidyverse)

#Goal: Is height a significant linear predictor of weight?

#download data in R
#university_ht_wt<-read_csv(file = "https://figshare.com/ndownloader/files/30850678")

#Or read data from local file system:
university_ht_wt <- read_csv("university_ht_wt")

#remove rows with NAs
university_ht_wt<-university_ht_wt %>% 
  drop_na() 

#Fit a simple linear regression model, with wt a funtion of ht
fit <- lm(weight ~ height, data = university_ht_wt)

sink('regression-output.txt')
summary(fit)
sink()
