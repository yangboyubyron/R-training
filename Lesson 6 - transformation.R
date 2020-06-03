### Exploring data shape transformation, using Tidyr

library(tidyverse)

# Read data in ------------------------------------------------------------

a <- read.table(text = "Item	E	F	G	H
                AAAA	1	2	3	4
                BBBB	5	6	7	8
                CCCC	9	10 11 12
                DDDD	13 14 15 16
                ", header = TRUE)

a

# make longer code -------------------------------------------------------------


# repivot example code ---------------------------------------------------------
