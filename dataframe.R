subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)
gender <- factor(c("MALE", "FEMALE", "MALE"))
blood <- factor(c("O", "AB", "A"), levels = c("O", "AB", "A", "B"))

pt_data <- data.frame(subject_name, temperature, flu_status, gender, blood, stringsAsFactors=FALSE)
pt_data

pt_data$subject_name

pt_data[c("gender", "blood")]

pt_data[1, 2]

pt_data[1, ]

pt_data[, 2]

pt_data[c(1, 3), c(2, 3, 4)]

pt_data[ , ]

pt_data[c(1, 3), c("flu_status", "blood")]
