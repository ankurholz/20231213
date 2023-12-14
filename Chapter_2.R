library(tidyverse)

##2.1 Coding basics

# <- assignment operator to create new objects. object_name <- value

x <- 3*7

# 'c' combines elements into a vector

primes <- c(2,3,5,7,11,13)
primes * 2

# alt minus is the shortcut for the assignment operator

##2.4 Calling functions

seq(from = 1, to = 10)
seq(1,10)

##2.5 Exercises

#1

#The object being called is missing a dot over the i, so it doesn't match the object that was assigned previously.

#2

library(tidyverse)

ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  geom_smooth(method = "lm")

#3

#Alt+Shift+K brings up a shortcut menu, also in Help>Shortcuts

#4

#The first plot is saved because the ggsave function was given a specific plot to save.

