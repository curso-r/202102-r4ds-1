
library(tidyverse)

imdb <- readr::read_rds("dados/imdb.rds")

imdb <- imdb %>% mutate(lucro = receita - orcamento)

tab <- imdb %>%
  filter(!is.na(lucro)) %>% 
  mutate(
    lucrou = ifelse(lucro <= 0, "Não", "Sim"),
  )

porcentagem <- tab %>% 
  count(lucrou) %>% 
  mutate(prop = n / sum(n)) %>% 
  filter(lucrou == "Sim") %>% 
  pull(prop) %>% 
  scales::percent(accuracy = 0.01)
  

tab %>% 
  ggplot() +
  geom_point(aes(x = orcamento, y = receita, color = lucrou)) +
  annotate(geom = "text", y = 6e8, x = 1e8, label = porcentagem)

case_when(
  lucro <= 0 ~ "Não",
  lucro / receita <= 0.5 ~ "Razoável",
  lucro / receita <= 0.75 ~ "Bom",
  TRUE ~ "Muito bom"
)

imdb %>%
  mutate(
    lucrou = case_when(
      lucro <= 0 ~ "Não",
      lucro / receita <= 0.5 ~ "Razoável",
      lucro / receita <= 0.75 ~ "Bom",
      TRUE ~ "Muito bom"
    )
  ) %>%
  ggplot() +
  geom_point(aes(
    x = orcamento,
    y = receita,
    color = lucrou
  )) +
  scale_color_manual(
    breaks = c("Não", "Razoável", "Bom", "Muito bom"),
    # values = c("Razoável" =  "red", "Não" = "orange", "Muito bom" =  "yellow", "Bom" =  "green")
    values = minhas_cores(4)
  )

minhas_cores <- function(n) {
  cores <- c("green", "blue", "yellow", "black", "#ff0022")
  cores[1:n]
}


minhas_cores(5)


starwars %>% 
  ggplot(aes(x = mass, y = height)) +
  geom_point(color = "yellow") +
  coord_cartesian(xlim = c(0, 200)) +
  labs(title = "Star Wars", subtitle = "May the force be with you") +
  theme(
    plot.background = element_rect(fill = "black"),
    panel.background = element_rect(fill = "black"),
    axis.text = element_text(color = "yellow"),
    axis.title = element_text(color = "yellow"),
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid = element_line(color = "grey"),
    plot.title = element_text(
      color = "yellow", 
      size = 30, 
      hjust = 0.5,
      family = "Star Jedi"
    ),
    plot.subtitle = element_text(
      color = "yellow", 
      size = 10, 
      hjust = 0.5,
      family = "Star Jedi"
    )
  )

# Dúvida no final da aula 7

imdb %>%
  filter(!is.na(diretor)) %>% 
  mutate(lucro = receita - orcamento) %>% 
  group_by(diretor) %>% 
  top_n(1, lucro) %>% 
  ungroup() %>% 
  arrange(desc(lucro)) %>% 
  slice(1:15)

# generalizando

calculo_top_15_lucro <- function(x) {
  imdb %>%
    # filter(!is.na(x)) %>% 
    mutate(lucro = receita - orcamento) %>% 
    group_by(.data[[x]]) %>% 
    top_n(1, lucro) %>% 
    ungroup() %>% 
    arrange(desc(lucro)) %>% 
    slice(1:15)
} 

calculo_top_15_lucro("diretor")

calculo_top_15_lucro <- function(x) {
  imdb %>%
    drop_na({{x}}) %>% 
    mutate(lucro = receita - orcamento) %>% 
    group_by({{x}}) %>% 
    top_n(1, lucro) %>% 
    ungroup() %>% 
    arrange(desc(lucro)) %>% 
    slice(1:15)
}

calculo_top_15_lucro(diretor)







