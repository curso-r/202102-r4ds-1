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
  group_by(diretor) %>% 
  filter(n()>1)
