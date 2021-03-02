# Objetivo:
# Ler imdb, gerar a tabela com colunas filme e ano,
# ordenada por ano

library(tidyverse)

imdb <- read_rds("dados/imdb.rds")

glimpse(imdb)

tabela_selecionada <- imdb %>% 
  select(titulo, ano) %>% 
  arrange(ano)

writexl::write_xlsx(tabela_selecionada, "pratica/tab_filmes_ord.xlsx")

writexl::write_xlsx(tabela_selecionada)

write_csv2(tabela_selecionada, col_names = FALSE, file = "pratica/tabela_selecionada.csv")

