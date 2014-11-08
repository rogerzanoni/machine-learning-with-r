wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors=FALSE)

str(wbcd)

# drop the ID
wbcd <- wbcd[-1]

# convert diagnosis column to factor
wbcd$diagnosis <- factor(wbcd$diagnosis, levels=c("B","M"), labels=c("Benign", "Malignant"))

round(prop.table(table(wbcd$diagnosis)) * 100, digits=1)

# a function to normalize dataset values
normalize <- function(x) {
    ((x - min(x)) / (max(x) - min(x)))
}


wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

summary(wbcd_n$area_mean)

# creating data for training


wbcd_train <- wbcd_n[1:469,]
wbcd_test <- wbcd_n[470:569,]

wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]

# training

library(class)

wbcd_test_pred <- knn(train=wbcd_train, test=wbcd_test, cl=wbcd_train_labels, k=21)

# evaluating results

library(gmodels)

CrossTable(x=wbcd_test_labels, y=wbcd_test_pred, prop.chisq=FALSE)
