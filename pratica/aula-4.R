# Objetivo: descobrir qual o filme mais caro, 
# mais lucrativo e com melhor nota dos anos 2000

# Carregar pacotes necessários
library(dplyr) 
library(readr)


# Dica do Maykon :
options(scipen = 999) # não usar mais notação cientifica 


# Carregar a base
imdb <- read_rds("dados/imdb.rds")

# Filme mais caro!

imdb %>% 
  filter(ano >= 2000 & ano <= 2009) %>% 
  View()


imdb %>% 
  filter(ano %in% 2000:2009) %>% 
  arrange(desc(orcamento)) %>% 
  slice(1) %>% 
  View()


imdb %>% 
  filter(ano %in% 2000:2009) %>% 
  filter(orcamento == max(orcamento, na.rm = TRUE)) %>% 
  select(titulo, orcamento) %>% 
  mutate(orcamento_milhoes = orcamento / 1e6,
         orcamento_milhoes = scales::dollar(orcamento_milhoes)) %>% 
  View()

# filme com a melhor nota!

imdb %>% 
  filter(ano %in% 2000:2009) %>% 
  filter(nota_imdb == max(nota_imdb, na.rm = TRUE)) %>% 
  View()
  

# Filme mais lucrativo

imdb %>% 
  mutate(lucro =  receita - orcamento) %>% 
  filter(ano %in% 2000:2009) %>% 
  filter(lucro == max(lucro, na.rm = TRUE)) %>% 
  View()


# Encontrar os duplicados (dúvida do Maykon)
imdb %>% 
  group_by(diretor, ano) %>% 
  filter(n() > 1)

# Fazendo para todas as décadas

imdb %>% 
  filter(!is.na(ano), !is.na(receita), !is.na(orcamento)) %>% 
  mutate(
    decada = floor(ano / 10) * 10,
    lucro = receita - orcamento
  ) %>% 
  group_by(decada) %>% 
  filter(lucro == max(lucro, na.rm = TRUE)) %>% 
  select(titulo, ano, decada, lucro) %>% 
  arrange(desc(decada)) %>% 
  mutate(
    lucro = scales::dollar(
      lucro, prefix = "R$", 
      big.mark = ".", 
      decimal.mark = ","
    )
  ) %>%
  arrange(desc(lucro)) %>% View()

imdb %>%
  mutate(par = ano %% 2 == 0) %>%
  filter(par == TRUE) %>%
  View()

imdb %>%
  filter(ano %% 2 == 0) %>%
  View()

imdb %>%
  mutate(resto_divisao = ano %% 2) %>%
  filter(resto_divisao == 0) %>%
  View()

imdb %>% 
  filter(!is.na(ano)) %>% 
  mutate(
    decada = floor(ano / 10) * 10,
    lucro = receita - orcamento
  ) %>% 
  group_by(decada) %>% 
  summarise(qtd_filmes = n())

imdb %>%
  mutate(
    nota_arredondada = floor(nota_imdb),
    par = nota_arredondada %% 2 == 0
  ) %>%
  select(nota_imdb, nota_arredondada, par) %>%
  View()


floor(1.9)
round(1.499999999999)
ceiling(1.000000000001)

1000^1000
