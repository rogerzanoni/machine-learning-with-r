subject_name <- c("John Doe", "Jane Doe", "Steve Graves")
temperature <- c(98.1, 98.6, 101.4)
flu_status <- c(FALSE, FALSE, TRUE)
gender <- factor(c("MALE", "FEMALE"))
blood <- factor(c("O", "AB", "A"), levels = c("O", "AB", "A", "B"))

subject1 <- list(fullname = subject_name[1],
                 temperature = temperature[1],
                 flu_status = flu_status[1],
                 gender = gender[1],
                 blood = blood[1])

# ways to access the data
subject1

subject1[2]

subject1$temperature

subject1[c("temperature", "flu_status")]
