# Exemplo usando dados do IBGE, para o Brasil e Estados

# Download feito no dia 28/02/2021
# https://www.ibge.gov.br/cidades-e-estados

# Exportar > Todas as UFs. Escolhi xlsx

# Carregar pacotes --------------
library(tidyverse)
# install.packages("googlesheets4")
library(googlesheets4)
# install.packages("janitor")
library(janitor)



# Importar a base ------------
url <- "https://docs.google.com/spreadsheets/d/1FzVnUUG5Fp-VuuGe0ummQ8KliH9C_47G6Q-pB310m9s/edit?usp=sharing"

dados_brutos <- googlesheets4::read_sheet(url, skip = 2, n_max = 27)

dados_brutos %>% view()



# Arrumando o nome das colunas ----------

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




dados_brasil_arrumado <- dados_brutos %>% 
  clean_names() 

dados_brasil <- dados_brasil_arrumado %>%
  rename("capital" = capital_2010,
         "area_territorial" = area_territorial_km2_2019,
         "populacao_estimada" = populacao_estimada_pessoas_2020,
         "densidade_demografica" = densidade_demografica_hab_km2_2010,
         "matriculas_ensino_fund" = matriculas_no_ensino_fundamental_matriculas_2018,
         "idh" = idh_span_indice_de_desenvolvimento_humano_span_2010,
         "receitas_realizadas" = receitas_realizadas_r_1000_2017,
         "despesas_empenhadas" = despesas_empenhadas_r_1000_2017,
         "rendimento_mensal_domiciliar_per_capita" = rendimento_mensal_domiciliar_per_capita_r_2020,
         "total_veiculos" = total_de_veiculos_veiculos_2018) 

names(dados_brasil)
glimpse(dados_brasil)

# Salvar a base de dados

readr::write_csv2(x = dados_brasil, file = "pratica/dados_brasil.csv")


# Usando manipulação de dados ----------------
## Qual é o estado com a maior população estimada? -------

# Solução com arrange() + slice()
dados_brasil %>% 
  select(uf, populacao_estimada) %>% 
  arrange(desc(populacao_estimada)) %>% 
  slice(1)

# outra forma de resolver!
# Solução com filter()

dados_brasil %>% 
  select(uf, populacao_estimada) %>%  
  filter(populacao_estimada == max(populacao_estimada))

