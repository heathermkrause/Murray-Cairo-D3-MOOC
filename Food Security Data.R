##Food Security Data Visualization

rm(list = ls())
library(nlme)
library(lattice)
library(car)
library(spida)

data <- read.csv("/Users/heatherkrause/Documents/Murray-Cairo-D3-MOOC/FoodDataFinal.csv")
names(data)

data$Driver1 <- with(data,ifelse(data$Enough.to.Eat.Score.Reversed > data$Afford.Score.Reversed, 
                                 data$Enough.to.Eat.Score.Reversed, data$Afford.Score.Reversed))



data$Driver2 <- with(data,ifelse(data$Driver1 > Food.Quality.Score.Reversed, 
                                 data$Driver1, Food.Quality.Score.Reversed))

data$Driver3 <- with(data,ifelse(data$Driver2 > data$Unhealthy.Eating.Score.Reversed, 
                                 data$Driver2, data$Unhealthy.Eating.Score.Reversed))


data$DriverBest <- data$Driver3




data$DriverBestF[data$DriverBest==data$Enough.to.Eat.Score.Reversed ] <- "Enough to Eat" #average people have enough access to food = high number
data$DriverBestF[data$DriverBest==data$Food.Quality.Score.Reversed ] <- "Food Quality" #food is of good quality = high number
data$DriverBestF[data$DriverBest==data$Unhealthy.Eating.Score.Reversed ] <- "Unhealthy Eating" # a high unhealhty eating score reversed means less unhealthy eating  
data$DriverBestF[data$DriverBest==data$Afford.Score.Reversed ] <- "Food Affordability" #food prices are stable and affordable = high number

data$Driver1a <- with(data,ifelse(data$Enough.to.Eat.Score > data$Afford.Score, 
                                  data$Enough.to.Eat.Score,  data$Afford.Score))



data$Driver2a <- with(data,ifelse(data$Driver1a > Food.Quality.Score, 
                                 data$Driver1a, Food.Quality.Score))

data$Driver3a <- with(data,ifelse(data$Driver2a > data$Unhealthy.Eating.Score, 
                                 data$Driver2a, data$Unhealthy.Eating.Score))


data$DriverWorst <- data$Driver3a




data$DriverWorstF[data$DriverWorst==data$Enough.to.Eat.Score] <- "Enough to Eat" #average people have enough access to food = high number
data$DriverWorstF[data$DriverWorst==data$Food.Quality.Score] <- "Food Quality" #food is of good quality = high number
data$DriverWorstF[data$DriverWorst==data$Unhealthy.Eating.Score] <- "Unhealthy Eating" # a high unhealhty eating score reversed means less unhealthy eating  
data$DriverWorstF[data$DriverWorst==data$Afford.Score] <- "Food Affordability" #food prices are stable and affordable = high number

write.csv(data,"/Users/heatherkrause/Documents/Murray-Cairo-D3-MOOC/FoodDataFinal.csv")



