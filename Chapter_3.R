# Chapter 3 - Data transformation

install.packages("nycflights13")
library(nycflights13)
library(tidyverse)

view(flights)
glimpse(flights)

#dplyr basics
#For a function to manipulate data, first argument is the data frame.
#Subsequent arguments describe which columns to operate on using variable names without quotes.
#Output is always a new data frame.

#3.2 Rows

filter() #changes which rows are present without changing their order
arrange() #changes the order of rows without changing which are present
distinct() #finds rows with unique values and can optionally modify columns

#3.2.1 filter()

#finding all flights that departed more than 2 hours late

flights %>%
  filter(dep_delay > 120)

#flights that departed on jan. 1

flights %>%
  filter(month == 1 & day == 1)

#flights that departed in jan or feb

flights %>%
  filter(month == 1 | month == 2)

# %in% keeps rows where the variable equals one of the values on the right

flights %>%
  filter(month %in% c(1,2))

#saving the new data frame

jan1 <- flights %>%
  filter(month == 1 & day == 1)

#3.2.3 arrange()

#the following orders the data with the 4 arguments to break ties

flights %>%
  arrange(year, month, day, dep_time)

#desc() used inside of arrange() arranges a column in descending order

flights %>%
  arrange(desc(dep_delay))

#3.2.4 distinct()

#remove duplicate rows if any

flights %>%
  distinct()

#find all unique origin and destination pairs

flights %>%
  distinct(origin, dest)

#the above tibble only has origin and dest in the output.
#To keep all rows, use .keep_all = TRUE

flights %>%
  distinct (origin, dest, .keep_all = TRUE)

#distinct() finds the first occurrence of a unqiue row and discards the rest

#count() to find number of occurences

flights %>%
  count(origin,dest, sort =TRUE)

#3.2.5 Exercies

#1

flights %>%
  filter(arr_delay >= 120)

flights %>%
  filter(dest %in% c("IAH","HOU"))

flights %>%
  filter(carrier %in% c("UA","AA","DL"))

flights %>%
  filter(month %in% c(7,8,9))

flights %>%
  filter(arr_delay > 120 & dep_delay <= 0)

flights %>%
  filter(dep_delay >= 60 & dep_delay - arr_delay > 30)

#2

flights %>%
  arrange(desc(dep_delay)) %>%
  arrange(sched_dep_time) %>%
  relocate(dep_delay,sched_dep_time)
#relocate puts those columns first

#3 

flights %>%
  mutate(speed = distance / (air_time / 60)) %>%
  arrange(desc(speed)) %>%
  relocate(speed)

#mutate adds a new column

#4

flights %>%
  distinct(year, month, day) %>%
  nrow()

#nrow() prints the number of rows in the specified data fram

#5

flights %>%
  arrange(desc(distance)) %>%
  relocate(distance,origin,dest,air_time)

flights %>%
  arrange(distance) %>%
  relocate(distance,origin,dest,air_time)

#6

#Filtering first will be more useful to cut down on the data to be processed.
#The end result however will be the same.

##3.3 columns

mutate() #creates new columns derived from existing columns
select() #changes which columns are present
rename() #changes the names of the columns
relocate() #changes the positions of the columns

#3.3.1 mutate()

flights %>%
  mutate(
    gain = dep_delay - arr_delay,
    speed = distance / (air_time/60),
    .before = 1
  )

#you can use .before and .after = to put the new column(s) exactly where you want in the data frame

#3.3.2 select()

flights %>%
  select(year, month, day)

flights %>%
  select(year:day)
# colon to select for all columns (inclusive) between the two arguments

flights %>%
  select(!year:day)
#selecting all columns except those from year to day

flights %>%
  select(where(is.character))

flights %>%
  select(starts_with("arr"))

flights %>%
  select(ends_with("time"))

flights %>%
  select(contains("arr"))

flights %>%
  select(tail_num = tailnum)
#you can rename variables as you select() them

#3.3.3 rename()

#rename() keeps all existing variables while renaming desired variables
#new name appears on the left

flights %>%
  rename(deptime = dep_time) %>%
  relocate(deptime)

#3.3.4 relocate() moves variables around

#3.3.5 Exercises

#1

flights %>%
  select(dep_time,sched_dep_time,dep_delay)
#The dep_delay should always equal the dep_time - sched_dep_time

#2

flights %>%
  select(dep_time,dep_delay,arr_time,arr_delay)

flights %>%
  select(starts_with("dep") | starts_with("arr"))

#3

flights %>%
  select(dest,dest,dest)

#The output will include just one instance of the variable.

#4

variables <- c("year", "month", "day", "dep_delay", "arr_delay")

flights %>%
  select(any_of(variables))

#any_of() is useful when you want to select for specific values within a vector

#5

flights %>%
  select(contains("TIME", ignore.case = FALSE))
#ignore.case = FALSE to look for the exact string, otherwise case is ignored

#6

flights %>%
  rename(air_time_min = air_time) %>%
  relocate(air_time_min, .before = year)

#7

#The arr_delay column has been selected out of the data frame

         