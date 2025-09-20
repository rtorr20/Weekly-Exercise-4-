#[1] "main"

      
library(readr)
library(dplyr)
library(ggplot2)

Olympics <- read_csv("Olympics.csv")

oly <- Olympics %>%
  mutate(total.medals = gold + silver + bronze)


bycountry <- oly %>%
  group_by(country) %>%
  summarise(total_gold = sum(gold), na.rm = TRUE) %>%
  arrange(desc(total_gold))

head(bycountry, 10)


#A tibble: 10 × 3
#country       total_gold na.rm

1 Germany               72  
2 Norway                68 
3 United States         66 
4 Canada                51 
5 Russia                49  
6 Austria               37 
7 Switzerland           34 
8 Netherlands           28 
9 Sweden                28 
10 East Germany          27 
