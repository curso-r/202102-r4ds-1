library(tidyverse)

# Caminhos até o arquivo --------------------------------------------------

# Diretório de trabalho
getwd()

# Caminhos absolutos
"/home/william/Documents/Curso-R/main-r4ds-1/dados/imdb.csv"

# Caminhos relativos
"dados/imdb.csv"

"dados/imdb.csv"

# (cara(o) professora(o), favor lembrar de falar da dica 
# de navegação entre as aspas)

# Tibbles -----------------------------------------------------------------

airquality
class(airquality)

as_tibble(airquality)

class(as_tibble(airquality))

# Lendo arquivos de texto -------------------------------------------------

library(readr)

# CSV, separado por vírgula (comma separated values)
imdb_csv <- read_csv("dados/imdb.csv")

# CSV, separado por ponto-e-vírgula
imdb_csv2 <- read_csv2(file = "dados/imdb2.csv")

str(imdb_csv)


# TXT, separado por tabulação (tecla TAB)
imdb_txt <- read_delim(file = "dados/imdb.txt", delim = "\t")

# A função read_delim funciona para qualquer tipo de separador
imdb_delim <- read_delim("dados/imdb.csv", delim = ",")
imdb_delim <- read_delim("dados/imdb2.csv", delim = ";")

# direto da internet
imdb_csv_internet <- read_csv("https://raw.githubusercontent.com/curso-r/202005-r4ds-1/master/dados/imdb.csv")

# Interface point and click do RStudio também é útil!

summary(imdb_csv$cor)
table(imdb_csv$cor)

summary(imdb_csv)

# Lendo arquivos do Excel -------------------------------------------------

library(readxl)

imdb_excel <- read_excel("dados/imdb.xlsx")
read_xlsx()
read_xls()
excel_sheets("dados/imdb.xlsx")

# Gravando dados ----------------------------------------------------------

# As funções iniciam com 'write'

# CSV
readr::write_csv(imdb_csv, file = "dados/imdb_csv_20210225.csv")

# Excel
library(writexl)
write_xlsx(imdb_csv, path = "imdb.xlsx")

# O formato rds -----------------------------------------------------------

# .rds são arquivos binários do R
# Você pode salvar qualquer objeto do R em formato .rds

imdb_rds <- readr::read_rds("dados/imdb.rds")
readr::write_rds(imdb_rds, file = "dados/imdb_rds.rds", compress = "xz")

# para rodar um script inteiro
source("scripts/01-introducao-ao-R.R")



