library(writexl)
cars <- mtcars[1:6, ]
write_xlsx(x = cars, path = "/target_folder/writexl.xlsx", col_names = TRUE)
