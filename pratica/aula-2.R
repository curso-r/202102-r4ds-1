# Investigar a base mtcars

mtcars
View(mtcars)

str(mtcars)

help(mtcars)

# Variável resposta: mpg

mean(mtcars$mpg)
var(mtcars$mpg)
min(mtcars$mpg)
max(mtcars$mpg)

# Filtrar a base

summary(mtcars)

class(mtcars$cyl)
table(mtcars$cyl)

table(mtcars$mpg)

cor(mtcars$mpg, mtcars$cyl)

plot(mtcars$cyl, mtcars$mpg)

# -------------------------------------------------------------------------
# importação --------------------------------------------------------------

library(readr)
library(purrr)

imdb <- read_rds("dados/por_ano/imdb_2016.rds")
imdb

arquivos <- list.files(
  "dados/por_ano/", 
  full.names = TRUE,
  pattern = ".rds$"
)

imdb <- map(arquivos, read_rds)

paste("oi", "tudo bem?", sep = " ")

imdb <- read_rds(arquivos[1])
for(i in 2:90) {
  print(paste("Li a base", i))
  aux <- read_rds(arquivos[i])
  print("empilhando as bases")
  imdb <- rbind(imdb, aux)
}

imdb
map(arquivos, read_rds)


imdb <- read_rds(arquivos[1])
for(arq in arquivos[2:90]) {
  print(paste("Li a base", arq))
  aux <- read_rds(arq)
  print("empilhando as bases")
  imdb <- rbind(imdb, aux)
}

imdb <- tibble::tibble()

imdb <- NULL
for(arq in arquivos) {
  print(paste("Li a base", arq))
  aux <- read_rds(arq)
  print("empilhando as bases")
  imdb <- rbind(imdb, aux)
}


# -------------------------------------------------------------------------

library(readxl)

nome_colunas <- read_excel(
  "dados/imdb_nao_estruturada.xlsx",
  sheet = 2
)

imdb_errada <- read_excel(
  "dados/imdb_nao_estruturada.xlsx",
  skip = 4, 
  col_names = nome_colunas$nome
)

imdb <- read_excel(
  "dados/imdb_nao_estruturada.xlsx",
  skip = 4, 
  col_names = nome_colunas$nome,
  nmax = nrow(imdb_errada) - 2
)

dplyr


View(imdb)
str(imdb)



