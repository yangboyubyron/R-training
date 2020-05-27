### HOMEWORK DUE 2020/05/06

# 1) Go to the rstudio.cloud and open LESSON 3. OK

# 2) Start a new file. OK

# 3) Load the tidyverse and the gapminder libraries
library(gapminder)
library(tidyverse)

# 4) Answer the following 3 questions:
#   - Which 10 countries have the highest average life expectancy

gapminder %>% 
  group_by(country) %>%
  summarize(meanLE  = mean(lifeExp)) %>%
  arrange(desc(meanLE)) %>%
  head(10) %>% pull(country)

# - Please plot the average life expectancy by year. Comment on the shape of the curve... what does this mean?

gapminder %>% 
  group_by(year) %>%
  summarize(meanLE  = mean(lifeExp)) %>%
  ggplot(aes(x = year, y = meanLE)) + geom_point() + geom_line()

#   - Plot the average life expectancy per year per continent. What continent stands out and what does that mean?

gapminder %>% 
  group_by(continent, year) %>%
  summarize(meanLE = mean(lifeExp)) %>%
  ggplot(aes(x = year, y = meanLE, color = continent, group = continent)) + geom_point() + geom_line() + 
  labs(title = "LE per blah", subtitle = "subtitle", caption = "source:gapminder")

