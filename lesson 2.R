### Lesson 2 objectives: Do basic plotting on farmer sales

## Call libraries
# install.packages("tidyverse")
library(tidyverse)

## Read in data
df <- read_csv("farmerSales.csv")

# Start with hypothesis testing ------------------------------------------
## look at the data

## hypothesis 1) rate and marketprice are correlated
ggplot(df, aes(x = marketPrice, y = rate)) + geom_point()

## let's break it up by product and add 1:1 line
ggplot(df, aes(x = marketPrice, y = rate)) + geom_point() + 
  facet_wrap(~product, scale = "free") + 
  geom_abline(slope = 1)

##^ what observations can we make?

## hypothesis 2) rate is higher than marketprice when selling a high volume

ggplot(df, aes(x = marketPrice, y = rate, color = volume)) + geom_point() + 
  facet_wrap(~product, scale = "free")

## ^ Write: why don't the colors change?  

ggplot(df, aes(x = marketPrice, y = rate, size = volume, color = volume)) + geom_point() + 
  facet_wrap(~product, scale = "free")

## Let's see only for one
df %>% filter(product == "Pepper") %>%
  ggplot(data = ., aes(x = marketPrice, y = rate, size = volume, 
                       color = volume)) + geom_point() + 
  geom_abline(slope = 1)

## hypothesis 3) maybe they sold earlier or later?
df %>% filter(product == "Pepper") %>%
  mutate(month = lubridate::month(date)) %>%
  ggplot(data = ., aes(x = marketPrice, y = rate, size = volume, 
                       color = month)) + geom_point() + 
  geom_abline(slope = 1)

# EXERCISE 3 --------------------------------------------------------------

## observe the relationship between rate and marketPrice for Peanut
df %>% filter(product == _____________) %>%
  ggplot(data = ., aes(x = marketPrice, y = _______, color = volume)) + 
  geom_point()


## plot date vs rate, facetted by product
ggplot(df, aes(x = ______, y = rate)) + geom_point() + 
  facet_wrap(~________, scale = "free")

## Filter the dataset to show only Cashewnut, plot the date vs volume, 
## facetted by village (will take a long time!)
df %>% _________(product == "Cashewnut") %>%
  ________(data = ., aes(x = date, y = volume)) + geom_line() + 
  _________(~village)


## Recap ------------------------------

## ggplot2 stuff ----------
## ggplot() is useful for:
## geom_point() is useful for:
## facet_wrap() is useful for:
## geom_abline() is useful for:

## other stuff ------------
## filter() is useful for:
## mutate() is useful for:
## lubridate::month() is useful for:

# EXERCISE - EXTRA CREDIT!!!!! --------------------------------------------

## read in dirty.csv, assign it to dirty_df, 
## glimpse the data (to understand the structure), 
## and plot the relationship between crop and area, using columns instead 
##   of points (geom_col), and facetting by region.