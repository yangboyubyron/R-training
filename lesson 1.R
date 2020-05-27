### Lesson 1 objectives: Read a csv file in, 
### Do basic analysis and plotting on farmer sales

## Call libraries
# install.packages("tidyverse")
library(tidyverse)

## Read in data
df <- read_csv("farmerSales.csv")

## do top level EDA
summary(df)
glimpse(df)
head(df)
View(df)

DataExplorer::create_report(df)
## to do this one, we first have to do install.packages("DataExplorer")


# EXERCISE 1 --------------------------------------------------------------

## See a summary of the dataframe df
summary(__)

## See types of the dataframe df
_____(df)

## View the first few rows of the dataframe df
______(____)


# EXERCISE 2 --------------------------------------------------------------

## Recap. Fill in:

## summary() is useful for:
## glimpse() is useful for:
## head() is useful for: