subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)
gender <- factor(c("MALE", "FEMALE", "MALE"))
blood <- factor(c("O", "AB", "A"), levels = c("O", "AB", "A", "B"))

pt_data <- data.frame(subject_name, temperature, flu_status, gender, blood, stringsAsFactors=FALSE)

save(subject_name, temperature, flu_status, gender, blood, pt_data, file="managingdata.RData")

# recreates all objects
load("managingdata.RData")
