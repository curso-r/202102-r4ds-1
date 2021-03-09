# objetivo: investigar a densidade (relação peso/altura) dos personagens

library(dplyr)
library(ggplot2)

View(starwars)

help("starwars")

starwars %>% 
  summarise(peso_medio = mean(mass, na.rm = TRUE))

starwars %>% 
  group_by(sex) %>% 
  summarise(peso_medio = mean(mass, na.rm = TRUE))

starwars %>% 
  filter(!is.na(mass)) %>% 
  group_by(species) %>% 
  summarise(peso_medio = mean(mass, na.rm = TRUE))

starwars %>% 
  filter(!is.na(mass)) %>% 
  group_by(species, sex) %>% 
  summarise(peso_medio = mean(mass, na.rm = TRUE)) %>% View

starwars %>% 
  filter(!is.na(mass)) %>% 
  group_by(species) %>% 
  summarise(peso_medio = mean(mass, na.rm = TRUE)) %>% 
  top_n(10, peso_medio) %>% 
  arrange(desc(peso_medio))

starwars %>% 
  filter(!is.na(mass)) %>% 
  group_by(species) %>% 
  summarise(
    peso_medio = mean(mass, na.rm = TRUE),
    altura_media = mean(height, na.rm = TRUE) / 100
  ) %>% 
  top_n(10, peso_medio) %>% 
  arrange(desc(peso_medio))

starwars %>% 
  filter(!is.na(mass)) %>% 
  group_by(species) %>% 
  mutate(imc = mass /( (height / 100) ^ 2)) %>% 
  summarise(
    peso_medio = mean(mass, na.rm = TRUE),
    altura_media = mean(height, na.rm = TRUE) / 100,
    imc_medio = mean(imc, na.rm = TRUE)
  ) %>% 
  top_n(10, peso_medio) %>% 
  arrange(desc(peso_medio))

starwars %>%
  filter(mass < 500) %>% 
  ggplot() +
  geom_point(mapping = aes(x = height, y = mass))

