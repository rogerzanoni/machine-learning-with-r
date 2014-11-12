insurance <- read.csv("insurance.csv", stringsAsFactors=TRUE)

str(insurance)

summary(insurance$charges)

hist(insurance$charges)

table(insurance$region)

# correlation matrix
cor(insurance[c("age", "bmi", "children", "charges")])

# scatter plot matrix
pairs(insurance[c("age", "bmi", "children", "charges")])

# enhanced scatter plot matrix
library(psych)
pairs.panels(insurance[c("age", "bmi", "children", "charges")])

ins_model <- lm(charges ~ age + children + bmi + sex + smoker + region, data=insurance)
# this is equivalent ins_model <- lm(charges ~ ., data=insurance)

ins_model

summary(ins_model)

# improving model performance
insurance$age2 <- insurance$age^2

insurance$bmi30 <- ifelse(insurance$bmi >= 30, 1, 0)

ins_model2 <- lm(charges ~ age + age2 + children + bmi + sex + bmi30*smoker + region, data=insurance)

ins_model2

summary(ins_model2)
