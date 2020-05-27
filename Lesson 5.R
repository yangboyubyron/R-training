### First stuff on local!



# Learning ifelse ---------------------------------------------------------
library(tidyverse)

farmerSales <- read_csv("farmerSales.csv")

## Oh no, someone made a typo for SLIT Nursery:
farmerSales %>% filter(buyerName == "SLIT Nursery")

## MarketPrice should be 124!
farmerSales <- farmerSales %>% 
  mutate(marketPrice = ifelse(buyerName == "SLIT Nursery", 124, marketPrice))

# Exercise 1 --------------------------------------------------------------

## Read in dirty.csv, change Gender = "F" to "Female" and "M" to "Male", 
## then find out what is the % of females in the sample group?


dirty %>% mutate(Gener)


# Exercise 2 --------------------------------------------------------------

## And now fix the whole Northern vs Northern Region thingie.



# Exercise 3 --------------------------------------------------------------

## Read in 20-0282-techapp1.xlsx. Wait, how do we read in Excel files? Write up how you would ask the question
