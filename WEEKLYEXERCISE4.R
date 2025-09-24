#[1] "main"
DEV

      

 main
library(readr)
library(dplyr)
library(ggplot2)

DEV
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

olymp <- read_csv("Olympics.csv")


largest1992 <- olymp %>%
  filter(year == 1992) %>%
  select(country, athletes) %>%
  arrange(desc(athletes))

print(largest1992)
# A tibble: 113 × 2
#country                      athletes
#<chr>                           <dbl>
1 United States                     147
2 Unified Team (Former Soviet)      129
3 Germany                           111
4 Canada                            109
5 France                            109
6 Italy                             107
7 Norway                             80
8 Czechoslovakia                     74
9 Switzerland                        74
10 Sweden                             73




count_5 <- c("United States", "France", "Germany", "Russia", "China")

gold_times <- olymp %>%
  filter(country %in% count_5) %>%
  mutate(year = as.integer(year)) %>%
  group_by(country, year) %>%
  summarise(gold = sum(gold, na.rm = TRUE), .groups = "drop") %>%
  arrange(country, year)




ggplot(gold_times, aes(x = year, y = gold, color = country, group = country)) +
  geom_line(linewidth = 0.9) +
  geom_point(size = 2) +
  labs(
    title = "Gold Medals Over Time (Selected Countries)",
    x = "Year",
    y = "Gold Medals")


main

