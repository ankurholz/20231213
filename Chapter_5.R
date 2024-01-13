## Chapter 5 Data Tidying

install.packages("tidyverse")
library(tidyverse)

#A tidy dataset has the following rules:
#Each variable is a column; each column is a variable
#Each observation is a row; each row is an observation
#Each value is a cell; each cell is a single value


#Exercise 5.2.1.2

setwd("/Users/dogcatfrogspider/Documents/GitHub/20231213")
table2 <- read.csv("Chapter5_table2.csv")

#The values for cases and population for a given country and year would need to be in a single row.

#5.3 Lengthening data

pivot_wider()
pivot_longer()

billboard #billboard data set from tidyverse

billboard_pl <- billboard %>%
  pivot_longer(starts_with("wk"),
               names_to = "week",
               values_to = "rank")

print(billboard_pl,n=20)
