# load packages ----
library(shiny)
library(tidyverse)
library(lterdatasampler)
library(shinyWidgets)
library(shinycssloaders)

# data wrangling (trout) ----
clean_trout <- and_vertebrates %>% 
  filter(species == "Cutthroat trout") %>% # filter for trout
  select(sampledate, section, 
         species, length_mm = length_1_mm,
         weight_g, channel_type = unittype) %>% # select for preferred columns
  mutate(section = case_when(
    section == "CC" ~ "clear cut forest",
    section == "OG" ~ "old growth forest"
  )) %>% 
  drop_na()
