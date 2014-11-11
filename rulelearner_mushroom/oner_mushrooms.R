mushrooms <- read.csv("mushrooms.csv", stringsAsFactors=TRUE)

str(mushrooms)

# veil type has only one level, remove it
mushrooms$veil_type <- NULL

mushrooms$type <- factor(mushrooms$type, levels=c("e", "p"), labels=c("edible", "poisonous"))

table(mushrooms$type)

library(RWeka)

mushroom_1R <- OneR(type ~ ., data=mushrooms)

mushroom_1R

summary(mushroom_1R)
