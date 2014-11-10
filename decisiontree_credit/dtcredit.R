credit <- read.csv("credit.csv")

str(credit)

table(credit$checking_balance)

table(credit$savings_balance)

summary(credit$months_loan_duration)

summary(credit$amount)

table(credit$default)

# set the random seed to an arbitrary value, to ensure we can reproduce the results
set.seed(12345)

credit_rand <- credit[order(runif(1000)),]

credit_train <- credit_rand[1:900,]
credit_test <- credit_rand[901:1000,]

library(C50)

credit_train$default = factor(credit_train$default)

credit_model <- C5.0(x=credit_train[-17], y=credit_train$default)

credit_model

summary(credit_model)

credit_pred <- predict(credit_model, credit_test)

library(gmodels)

CrossTable(credit_test$default, credit_pred, prop.chisq=FALSE, prop.c=FALSE, prop.r=FALSE)
