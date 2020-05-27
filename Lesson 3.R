### starting to play with dplyr data


# Call libraries ----------------------------------------------------------

# install.packages("tidyverse")
# install.packages("gapminder")

library(tidyverse)
library(gapminder)

df <- gapminder


# Quick EDA ---------------------------------------------------------------

View(df)
glimpse(df)
head(df)
summary(df)

# filter ------------------------------------------------------------------


df %>% 
  filter(country == "Austria", year == 1962)

df %>% 
  filter(country == "Austria" & year == 1962)

df %>% 
  filter(country == "Austria" | year == 1962)

df %>% 
  filter(country == "Austria", year < 1962)

df %>% 
  filter(country == "Austria", year > 1962)

# Exercise 1 --------------------------------------------------------------

## Fill in:
## & is:
## | is: 
## , is:


# filter, select ----------------------------------------------------------

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country, year)

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country:year)

df %>% 
  filter(country == "Austria" | year == 1962) %>% 
  select(country:year, gdpPercap)


# Exercise 2: -------------------------------------------------------------

## Fill in:
## in select using ":" does 
## in select using "," does

# pull --------------------------------------------------------------------

farmer <- read_csv("farmerSales.csv")

farmer %>% select(product)

farmer %>% pull(product) %>% head(10)

# ## back to our example
# df %>% 
#   pull(country)
# 
# ##^ Levels? what's a factor?
# 
# ## KILL ALL FACTORS FOREVER!
# df %>% 
#   modify_if(is.factor, as.character) %>%
#   pull(country)


# Exercise 3 --------------------------------------------------------------

## Please filter to country "Zimbabwe" and select the year and lifeExp
df %>% 
  filter(country == "Zimbabwe") %>%
  select(year,lifeExp)


# Exercise 4 --------------------------------------------------------------
## produce a vector of country names with population greater than 500 000 000

## find which countries have a population of greater than 500M AND THEN
## pull a vector of the country names

df %>%
  filter(pop > 500000000) %>% 
  pull(country) %>% 
  unique
  

##^ why factors again?
cleaned_df <- df %>%
  modify_if(is.factor, as.character)


# Exercise 4a -------------------------------------------------------------
## how can we tell that we have converted the factor to the character?
glimpse(cleaned_df)



# arrange -----------------------------------------------------------------

cleaned_df %>% 
  filter(year == 1997) %>% 
  arrange(pop)

cleaned_df %>% 
  filter(year == 1997) %>% 
  arrange(desc(pop))



# QUICK EXERCISE!!! -------------------------------------------------------

## What country had the highest life expectancy in 2007?



# group_by, count, summarize ----------------------------------------------

cleaned_df %>% 
  filter(year == 1997) %>% 
  arrange(desc(pop)) %>%
  count

cleaned_df %>% 
  filter(year == 1997) %>% 
  arrange(desc(pop)) %>%
  group_by(country) %>%
  count

cleaned_df %>% 
  group_by(continent, year) %>%
  count

cleaned_df %>%
  group_by(country) %>%
  summarize(meanlife = mean(lifeExp))


# Exercise 4 --------------------------------------------------------------
## What are the 3 countries with the highest average life expectancy?
cleaned_df %>%
  group_by(_______) %>%
  ______(meanLife = mean(lifeExp)) %>%
  _________________________

## SL, Af, Ang? Or I, S, N?

# Exercise 5 --------------------------------------------------------------
## What 2 countries in Asia have the highest maximum population?
cleaned_df %>%
  filter(_________ == "Asia") %>%                    ## deal with "in Asia" part
  group_by(_________) %>%                            ## what grouping are we looking for in final answer
  summarize(maxPop = max(_____)) %>%                 ## create the value that we are looking for
  arrange(desc(_____)) %>%                           ## arrange so that the top values are at the top
  head(2) %>%                                        ## grab the first 2 rows
  pull(______)                                       ## select the portion that was asked for in the question

## Exercise 6
## What 2 continents have the highest average life expectancy?
## Start with the text description of what you will do. Then code.

## FORGET ME NOT!!!! 
## Create a plot of the populations of all the countries in Oceania over time. 
## Countries should be in different colors

cleaned_df %>%
  ______(continent == "Oceania") %>%
  ggplot(aes(x == ______, y = ______, color = ________)) + 
  geom_point() + 
  geom_line()


# Exercise OH_NO!!!!!! ----------------------------------------------------

### HELP!!!!!!! I MADE A MISATAKE AND IT WONT WORK LOL. WATS WRONG LOL
cleaned_df %>%
  filter(continent = "Asia") %>%
  ggplot2(aes(x = year, y = gdpPercap, color = Country)) +
  geom_points() %>% 
  geom_line()

## ^ how to improve?