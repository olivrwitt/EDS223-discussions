packages <- c("here", "janitor", "tidyverse", "sf", "terra", "tmap", "spData", "spDataLarge", "geodata", "kableExtra", "viridisLite")
installed_packages <- packages %in% rownames(installed.packages())

if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}

install.packages("kableExtra")
install.packages("here")
install.packages("janitor")
install.packages("sf")

library(here)
library(janitor)
library(tidyverse)
library(sf)
library(kableExtra)

gdw_df <- read_csv("week0/data/gdw.csv") |> 
  clean_names()

head(gdw_df, 10) |> 
  kable()

tail(gdw_df, 10) |> 
  kable()

nrow(gdw_df)
ncol(gdw_df)

glimpse(gdw_df)

colnames(gdw_df)

country_df <- gdw_df[ , "country"]
country_vector <- gdw_df[["country"]]

gdw_df |> 
  group_by(dam_type) |> 
  summarise(count=n()) |> 
  ungroup()

sub_dam <- gdw_df |> 
  filter(dam_type == "Dam")

gdw_df <- gdw_df |> 
  arrange(year_dam)

gdw_df |> 
  group_by(country) |> 
  summarize(mean_dam_height = mean(dam_hgt_m, na.rm = TRUE)) |> 
  ungroup() |> 
  ggplot(
    aes(x=country, y=mean_dam_height)
  ) + geom_bar(stat = "identity")  + labs(x = "Country",
         y = "Average dam height in meters") + theme_minimal() + theme(axis.text.x = element_text(angle = 45))

gdw_df |> 
  ggplot(
    aes(x=cap_mcm,y=dam_hgt_m)
  ) + geom_point()


head(gdw_df$shape, n = 3)
class(gdw_df$shape)

