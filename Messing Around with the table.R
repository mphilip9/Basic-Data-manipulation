install.packages("dplyr")
install.packages("tidyr")
install.packages("stringr")
library(dplyr)
library(tidyr)
library(stringr)

tbl_df(refine)
# checking pattern for Phillips
str_count(refine$company, "phi")
str_count(refine$company, "lip")

#checking patterns for Akzo
str_count(refine$company, "AK")
str_count(refine$company, "zo")
str_count(refine$company, "z0")

refine$company_test <- refine$company