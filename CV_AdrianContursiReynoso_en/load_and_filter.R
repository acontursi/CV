
# Function to read the file

# install.packages("readxl") uncomment this if you need to install the package
library(readxl)
readExcelSheets <- function(filename){
  # read all sheets in .xlsx 
  all <- readxl::excel_sheets(filename)
  # import each sheet into a list using readxl::read_excel
  list <- lapply(all, function(x) readxl::read_excel(filename, sheet = x))
  # save sheet name for each sheet (list)
  names(list) <- all
  # breaks up list and creates a dataframe for each sheet with df names matching sheet names
  list2env(list, envir = .GlobalEnv)
}

library(here)

# Load the file and read it.
filename <- here::here("CV_AdrianContursiReynoso_en/CV_AdrianContursiReynoso_en.xlsx")
readExcelSheets(filename)
