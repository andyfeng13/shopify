library(tidyverse)
library(lubridate)
library(googlesheets4)

df <- read_sheet("https://docs.google.com/spreadsheets/d/16i38oonuX1y1g7C_UAmiK9GkY7cS-64DfiDMNiR41LM/edit#gid=0")

## initial calculation
df %>% summarise(mean(order_amount))


## corrected calculation
df %>% summarise(aov = sum(order_amount) / sum(total_items))

## shop 42 is an outlier
df %>% group_by(shop_id) %>% 
  summarise(n = mean(total_items)) %>%
  arrange(-n)

## shop 78 is also an outlier
df %>% group_by(shop_id) %>% 
  summarise(ave = mean(order_amount/total_items)) %>% 
  arrange(-ave)

## further correction without outliers
df %>% 
  filter(shop_id != 78, shop_id != 42) %>%
  summarise(aov_mean = sum(order_amount) / sum(total_items),
            aov_median = median(order_amount/total_items))




