options(stringsAsFactors = FALSE)

read_excel_allsheets <- function(filename, tibble = FALSE) {
  # I prefer straight data.frames
  # but if you like tidyverse tibbles (the default with read_excel)
  # then just pass tibble = TRUE
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  x_Stacked <- do.call(rbind.fill, x)
  x_Stacked
}



file_names <- dir() 

list_bh_all_sd_1 <- do.call(rbind.fill,lapply(file_names,read_excel_allsheets))