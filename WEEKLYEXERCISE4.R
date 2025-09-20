#[1] "main"
library(readr)
library(dplyr)
library(ggplot2)

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