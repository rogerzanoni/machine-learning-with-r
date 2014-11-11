launch <- read.csv("challenger.csv")

str(launch)

# optimal parameters for the linear equation y = a + bx

b <- cov(launch$temperature, launch$distress_ct) / var(launch$temperature)
b

a <- mean(launch$distress_ct) - b * mean(launch$temperature)
a

# compute the correlation
r <- cov(launch$temperature, launch$distress_ct) / (sd(launch$temperature) * sd(launch$distress_ct))
r

# or, use the builtin function
r <- cor(launch$temperature, launch$distress_ct)
r
