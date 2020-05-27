### Introduction to mutate, and more advanced pipelines

library(tidyverse)

## read in COVID data
# df <- tidycovid19::download_merged_data()
# write_rds(df, "covid2020.04.22.RDS")

df <- read_rds("covid2020.04.22.RDS")

## take a look at data
View(df)


# Exercise 1 --------------------------------------------------------------
## plot the number of cases over time for all countries, highlighting countries
## with more than 100000 cases
df %>% ggplot(aes(x = date, y = confirmed, group = country)) + 
  geom_line() + gghighlight::gghighlight(confirmed > 100000)

## eliminate scientific notation
options(scipen = 999)


# Exercise 2 --------------------------------------------------------------
## plot number of deaths over time for all countries, highlighting countries
## with more than 10000 deaths

df %>% ggplot(aes(x = date, y = deaths, group = country)) + 
  geom_line() + gghighlight::gghighlight(deaths > 10000)


## TOO MUUUUCH!!! Let's get a subset
subDFwithRate <- df %>% select(country, region, date, confirmed, deaths)

## see death rate per country
subDFwithRate %>% mutate(rate = deaths/confirmed)

## need to take cases 14 days in future
subDFwithRate %>% mutate(futureDeaths = lead(deaths, 14)) %>% View

subDFwithRate14 <- subDFwithRate %>% group_by(country) %>% mutate(futureDeaths = lead(deaths, 14)) %>% 
  ungroup()

## now calculate again
subDFwithRate14 %>% mutate(rate = futureDeaths/confirmed)

## remove NAs
subDFwithRate14NA <- subDFwithRate14 %>% filter(confirmed != 0)
# OR
# subDFwithRate14 %>% drop_na(confirmed)

subDFwithRatewithRate <- subDFwithRate14NA %>% 
  mutate(rate = futureDeaths/confirmed)


subDFwithRatewithRate %>% ggplot(aes(x = date, y = rate, color = country)) + geom_line()

subDFwithRatewithRate %>% ggplot(aes(x = date, y = rate, color = country)) + geom_line() +
  ggeasy::easy_remove_legend()


# by region ------------------------------------------------------------

# Exercise 3 --------------------------------------------------------------
## aggregate the average rate by date and region
subDFwithRatewithRate %>% group_by(date, region) %>% summarize(aveRate = mean(rate)) %>% 
  filter(!is.na(region))

## find the LATEST (non-NA) rate per region
subDFwithRatewithRate %>% arrange(desc(date)) %>% group_by(country) %>% 
  drop_na(rate) %>% slice(1)

## find the LATEST 3 rates per region
subDFwithRatewithRate %>% arrange(desc(date)) %>% group_by(country) %>% 
  drop_na(rate) %>% slice(1:3)

# Exercise 4 --------------------------------------------------------------
## remove rate = 0 from all countries, and then find the average of 
## the latest 3 rates per country. Write a sentence documenting 
## the top 3 countries, the bottom 3 countries and the average.
## EXTRA CREDIT. Discuss why some of the rates are so high!

subDFwithRatewithRate %>% filter(rate != 0) %>% arrange(desc(date)) %>% group_by(country) %>% 
  drop_na(rate) %>% slice(1:3) %>% summarize(aveRate = mean(rate)) %>% 
  arrange(desc(aveRate))


# Extra credit!! ----------------------------------------------------------

## a better way to calculate death rate is deaths / (deaths + recovered)
## Create an alternative death rate using this number and compare top/bottom/mean rates
## Start from scratch!
subDFwithRatewithRate2 <- df %>% select(country, region, date, confirmed, deaths)

## need to take cases 14 days in future
subDFwithRatewithRate2 %>% group_by(country) %>% 
  mutate(futureDeaths = lead(deaths, 14)) %>% 
  mutate(rate = futureDeaths/confirmed) %>% 
  drop_na(confirmed) %>% 
  filter(confirmed != 0, rate != 0)

subDFwithRatewithRate3 <- df %>% select(country, region, date, recovered, deaths)


subDFwithRatewithRate3 %>% mutate(total = deaths + recovered) %>% 
  filter(total != 0) %>% mutate(betterRate = deaths/total)
