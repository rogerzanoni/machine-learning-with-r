# extract levels from data
gender <- factor(c("MALE", "FEMALE", "MALE"))
gender

# we can manually specify levels that aren't in the data
blood <- factor(c("O", "AB", "A"), levels = c("O", "AB", "A", "B"))
blood
