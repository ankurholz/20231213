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

#pivot_longer(data, cols, names_to, values_to)

billboard #billboard data set from tidyverse

billboard_pl <- billboard %>%
  pivot_longer(starts_with("wk"),
               names_to = "week",
               values_to = "rank")

billboard_pl <- billboard %>%
  pivot_longer(!c(artist, track, date.entered),
               names_to = "week",
               values_to = "rank",
               values_drop_na = TRUE) %>%
  mutate(
    week = parse_number(week)
  )

billboard_pl %>%
  ggplot(aes(x = week, y = rank, group = track)) +
  geom_line(alpha = 0.25) +
  scale_y_reverse()
  
bp <- tribble(
  ~id,  ~bp1, ~bp2,
  "A",  100,  120,
  "B",  140,  115,
  "C",  120,  125
)

bp_p <- bp %>%
  pivot_longer(cols = !c(id),
               names_to = "measurement",
               values_to = "value"
               )
#5.3.2 Many variables in column names, using names_sep

#names_sep =
#names_pattern

table3 <- who2

table3_p <- table3 %>%
  pivot_longer(cols = !(country:year),
               names_to = c("method", "sex", "age group"), 
               names_sep = "_",
               values_to = "cases",
               values_drop_na = TRUE)
