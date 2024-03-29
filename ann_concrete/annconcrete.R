concrete <- read.csv("concrete.csv")

str(concrete)

normalize <- function(x) {
    return ((x - min(x)) / (max(x) - min(x)))
}

concrete_norm <- as.data.frame(lapply(concrete, normalize))

str(concrete_norm)

summary(concrete$strength)

concrete_train <- concrete_norm[1:773,]
concrete_test <- concrete_norm[774:1030,]

library(neuralnet)

concrete_model <- neuralnet(strength ~ cement + slag + ash + water + superplastic + coarseagg
                            + fineagg + age, data=concrete_train)

plot(concrete_model)

model_results <- compute(concrete_model, concrete_test[1:8])

predicted_strength <- model_results$net.result

cor(predicted_strength, concrete_test$strength)

# improving model performance

concrete_model <- neuralnet(strength ~ cement + slag + ash + water + superplastic + coarseagg
                            + fineagg + age, data=concrete_train, hidden=5)

plot(concrete_model)

model_results <- compute(concrete_model, concrete_test[1:8])

predicted_strength <- model_results$net.result

cor(predicted_strength, concrete_test$strength)
