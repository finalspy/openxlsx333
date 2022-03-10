library("openxlsx")
wb <- createWorkbook()
cars <- mtcars[1:6, ]
addWorksheet(wb, "Cars")
writeData(wb, "Cars", cars, startCol = 2, startRow = 3, rowNames = TRUE)
saveWorkbook(wb, "/target_folder/openxlsx.xlsx", overwrite = TRUE)
