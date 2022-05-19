```R
library(tidyverse)
library(lubridate)
library(googlesheets4)

file <- read_sheet("https://docs.google.com/spreadsheets/d/16i38oonuX1y1g7C_UAmiK9GkY7cS-64DfiDMNiR41LM/edit#gid=0")


df %>% summarise(mean(order_amount))

df <- file %>% 
  mutate(aov = order_amount / total_items)

df %>% summarise(mean(aov))

df %>% summarise(aov = sum(order_amount) / sum(total_items),
                 total_items, order_amount)
```
