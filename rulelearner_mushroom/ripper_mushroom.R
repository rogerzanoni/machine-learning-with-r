mushrooms <- read.csv("mushrooms.csv", stringsAsFactors=TRUE)

str(mushrooms)

# veil type has only one level, remove it
mushrooms$veil_type <- NULL

mushrooms$type <- factor(mushrooms$type, levels=c("e", "p"), labels=c("edible", "poisonous"))

table(mushrooms$type)

library(RWeka)

mushroom_JRip <- JRip(type ~ ., data=mushrooms)

mushroom_JRip

summary(mushroom_JRip)
