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

#Changing names
refine$company[1:6] <- "Phillips"

refine$company[14:16] <- "Phillips"

refine$company[7:13] <- "Akzo"

refine$company[17:21] <- "Van Houten"

refine$company[22:25] <- "Unilever"

#Separate product code and number
refine_new <- refine %>% separate("Product code / number", c("Product_Code", "Number"), sep = "-")

#Adding Product Name
refine_new <- refine_new %>% mutate(Product_Category = recode(Product_Code, "p" = "Smartphone", "v" = "TV", "x" = "Laptop", "q" = "Tablet"))
View(refine_new)

#Concatenating Address into one column
refine_new$full_address <- paste(refine_new$address, refine_new$city, refine_new$country, sep=", ")

install.packages("fastDummies")
library(fastDummies)
#Creating dummy variables for the company names
refine_new <- refine_new %>% dummy_cols(select_columns = "company")
refine_new <- refine_new %>% dummy_cols(select_columns = "Product_Category")
