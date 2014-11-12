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

# create a regression function
reg <- function(y, x) {
    x <- as.matrix(x)
    x <- cbind(Intercept=1, x)
    solve(t(x) %*% x) %*% t(x) %*% y
}

# the Intercept and temperature values match a and b values
reg(y=launch$distress_ct, x=launch[3])[,1]

reg(y=launch$distress_ct, x=launch[3:5])[,1]
