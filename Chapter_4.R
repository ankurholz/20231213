###Chapter 4: Workflow code style###

install.packages("styler")
install.packages("tidyverse")
install.packages("nycflights13")
library(styler)
library(tidyverse)
library(nycflights13)

##4.1 Names 
# Use only lowercase letters, numbers, and underscores.
# Better to have long descriptive names with common prefixes than short names

##4.2 Spaces
# Put spaces on either side of mathematical operators except for ^
# Put spaces around the assignment operator
# Put a space after a comma. Don't put spaces in or out of parenthesis
# Adding spaces for alignment purposes is alright

##4.3 Pipes
# A pipe should be the last thing in a line.
# Avoid long pipes, i.e. ones with more than 15 lines. Create new data frames instead.
# Utilize indentations for actions within a pipe

##4.4 ggplot2
# Same conventions as pipes, watch for transition between + and %>%.

flights |> 
  group_by(dest) |> 
  summarize(
    distance = mean(distance),
    speed = mean(distance / air_time, na.rm = TRUE)
  ) |> 
  ggplot(aes(x = distance, y = speed)) +
  geom_smooth(
    method = "loess",
    span = 0.5,
    se = FALSE, 
    color = "white", 
    linewidth = 4
  ) +
  geom_point()

##4.5 Sectioning comments
# Cmd/Ctrl + Shift + R to insert headers

##4.6 exercise

#restyle the following
flights|>filter(dest=="IAH")|>group_by(year,month,day)|>summarize(n=n(),
                                                                  delay=mean(arr_delay,na.rm=TRUE))|>filter(n>10)

flights %>%
  filter(dest == "IAH") %>%
  group_by(year, month, day) %>%
  summarize(n = n(),
            delay = mean(arr_delay, na.rm = TRUE)) %>%
  filter(n > 10)
  

