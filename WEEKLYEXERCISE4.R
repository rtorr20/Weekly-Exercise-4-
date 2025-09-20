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


byyear <- oly %>%
  group_by(year) %>%
  summarise(total_given = sum(total.medals), na.rm = TRUE) %>%
  arrange(year)

head(byyear, 10)


# A tibble: 10 × 3
# year    total_given na.rm
1  1980         115 
2  1984         117 
3  1988         138 
4  1992          NA 
5  1994         183 
6  1998         205 
7  2002         234 
8  2006         252  
9  2010         258 
10  2014        295 

