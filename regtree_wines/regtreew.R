wine <- read.csv("whitewines.csv")

str(wine)

hist(wine$quality)

wine_train <- wine[1:3750,]
wine_test <- wine[3751:4898,]

library(rpart)

m.rpart <- rpart(quality ~ ., data=wine_train)
m.rpart

summary(m.rpart)

library(rpart.plot)

rpart.plot(m.rpart, digits=3)

rpart.plot(m.rpart, digits=4, fallen.leaves=TRUE, extra=101)

p.rpart <- predict(m.rpart, wine_test)

summary(p.rpart)
summary(wine_test$quality)

cor(p.rpart, wine_test$quality)

# mean absolute error
MAE <- function(actual, predicted) {
    mean(abs(actual - predicted))
}

MAE(p.rpart, wine_test$quality)

library(RWeka)

m.m5p <- M5P(quality ~ ., data=wine_train)

m.m5p

summary(m.m5p)
