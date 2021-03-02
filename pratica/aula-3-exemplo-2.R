library(tidyverse)
# install.packages("googlesheets4")
library(googlesheets4)
url <- "https://docs.google.com/spreadsheets/d/1FzVnUUG5Fp-VuuGe0ummQ8KliH9C_47G6Q-pB310m9s/edit?usp=sharing"

dados_brutos <- googlesheets4::read_sheet(url, skip = 2, n_max = 27)

dados_brutos %>% view()

names(dados_brutos)

# > names(dados_brutos)
# [1] "UF [-]"                                                  
# [2] "Código [-]"                                              
# [3] "Gentílico [-]"                                           
# [4] "Governador [2019]"                                       
# [5] "Capital [2010]"                                          
# [6] "Área Territorial - km² [2019]"                           
# [7] "População estimada - pessoas [2020]"                     
# [8] "Densidade demográfica - hab/km² [2010]"                  
# [9] "Matrículas no ensino fundamental - matrículas [2018]"    
# [10] "IDH <span>Índice de desenvolvimento humano</span> [2010]"
# [11] "Receitas realizadas - R$ (×1000) [2017]"                 
# [12] "Despesas empenhadas - R$ (×1000) [2017]"                 
# [13] "Rendimento mensal domiciliar per capita - R$ [2020]"     
# [14] "Total de veículos - veículos [2018]"

library("janitor")
# install.packages("janitor")

dados_brasil_arrumado <- dados_brutos %>% 
  clean_names() 

dados_brasil <- dados_brasil_arrumado %>%
  rename(
    "capital" = capital_2010,
    "idh" = idh_span_indice_de_desenvolvimento_humano_span_2010,
    "populacao_estimada" = populacao_estimada_pessoas_2020
    
    
  )

names(dados_brasil)
glimpse(dados_brasil)



# qual estado com a maior pop?

dados_brasil %>% 
  select(uf, populacao_estimada) %>% 
  arrange(desc(populacao_estimada)) %>% 
  slice(1)

# outra forma de resolver!

dados_brasil %>% 
  select(uf, populacao_estimada) %>%  
  filter(populacao_estimada == max(populacao_estimada))

