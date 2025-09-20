#[1] "main"

      
library(readr)
library(dplyr)
library(ggplot2)

Olympics <- read_csv("Olympics.csv")

oly <- Olympics %>%
  mutate(total.medals = gold + silver + bronze)
