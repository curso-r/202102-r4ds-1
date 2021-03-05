# Pacotes -----------------------------------------------------------------

library(tidyverse)

# Base de dados -----------------------------------------------------------

imdb <- readr::read_rds("dados/imdb.rds")

# Jeito de ver a base -----------------------------------------------------

glimpse(imdb) # tidyverse

str(imdb) # base R

names(imdb)

View(imdb) # base R

view(imdb) # tidyverse

# dplyr: 6 verbos principais
# select()    # seleciona colunas do data.frame
# filter()    # filtra linhas do data.frame
# arrange()   # reordena as linhas do data.frame
# mutate()    # cria novas colunas no data.frame (ou atualiza as colunas existentes)
# summarise() + group_by() # sumariza o data.frame
# left_join   # junta dois data.frames

# select ------------------------------------------------------------------

# Selcionando uma coluna da base

select(imdb, titulo)

imdb_titulos <- select(imdb, titulo)


# A operação NÃO MODIFICA O OBJETO imdb

imdb

# Selecionando várias colunas

select(imdb, titulo, ano, orcamento)


select(imdb, titulo:cor)

# Funções auxiliares

select(imdb, starts_with("ator"))

select(imdb, contains("to"))

# Principais funções auxiliares

# starts_with(): para colunas que começam com um texto padrão
# ends_with(): para colunas que terminam com um texto padrão
# contains():  para colunas que contêm um texto padrão

# Selecionando colunas por exclusão

select(imdb, -starts_with("ator"), -titulo, -ends_with("s"))

select(imdb, -starts_with("ator"), -titulo, -ends_with("s"))

# os dois exemplos abaixo tem resultados diferentes.
select(imdb,  titulo, -starts_with("ator"))

select(imdb, -starts_with("ator"), titulo)

# Selecionar apenas doubles
select(imdb, where(is.double))

# Selecionar apenas character
select(imdb, where(is.character))

# matches() - para usar com RegEx

# arrange -----------------------------------------------------------------

# Ordenando linhas de forma crescente de acordo com 
# os valores de uma coluna

View(arrange(imdb, orcamento))

# Agora de forma decrescente

View(arrange(imdb, desc(orcamento)))

View(arrange(imdb, -orcamento))

# Ordenando de acordo com os valores 
# de duas colunas

View(arrange(imdb, desc(ano), desc(orcamento)))

View(arrange(imdb, diretor))

View(arrange(imdb, desc(diretor)))

# O que acontece com o NA?

df <- tibble(x = c(NA, 2, 1), y = c(1, 2, 3))

df 
arrange(df, x)
arrange(df, desc(x))

# Pipe (%>%) --------------------------------------------------------------

# Transforma funções aninhadas em funções
# sequenciais

# g(f(x)) = x %>% f() %>% g()

x %>% f() %>% g()   # CERTO
x %>% f(x) %>% g(x) # ERRADO

# Receita de bolo sem pipe. 
# Tente entender o que é preciso fazer.

esfrie(
  asse(
    coloque(
   #   bata(
        acrescente(
          recipiente(
            rep(
              "farinha", 
              2
            ), 
            "água", "fermento", "leite", "óleo"
          ), 
          "farinha", até = "macio"
        ), 
       # duração = "3min"
     # ), 
      lugar = "forma", tipo = "grande", untada = TRUE
    ), 
    duração = "50min"
  ), 
  "geladeira", "20min"
)

# Veja como o código acima pode ser reescrito 
# utilizando-se o pipe. 
# Agora realmente se parece com uma receita de bolo.

recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo") %>%
  acrescente("farinha", até = "macio") %>%
#  bata(duração = "3min") %>%
  coloque(lugar = "forma", tipo = "grande", untada = TRUE) %>%
  asse(duração = "50min") %>%
  esfrie("geladeira", "20min")

# ATALHO DO %>%: CTRL (command) + SHIFT + M


imdb_titulo_diretor <- imdb %>% 
  select(titulo, diretor) %>% 
  arrange(ano) %>% 
  View() # view do R base




# sem pipe
View(arrange(select(imdb,
                    titulo, diretor, ano), ano))


imdb_titulo_diretor # NULL


imdb_titulo_diretor_2 <- imdb %>% 
  select(titulo, diretor) %>% 
  view() # view do tidyverse

imdb_titulo_diretor_2 # NULL


# O CÓDIGO ABAIXO NÃO FUNCIONA!
imdb 
%>%
  select(titulo, diretor)



# Conceitos importantes para filtros! --------------------------------------

## Comparações lógicas ------------------------------------------------------

x <- 1

# Testes com resultado verdadeiro
x == 1
"a" == "a"

# Testes com resultado falso
x == 2
"a" == "b"

"a" == "A"

# Maior
x > 3
x > 0

# Maior ou igual
x > 1
x >= 1

# Menor
x < 3
x < 0

# Menor ou igual
x < 1
x <= 1

# Diferente
x != 1 
x != 2

x %in% c(1, 2, 3)
"a" %in% c("b", "c")



## Operadores lógicos -------------------------------

## & - E - Para ser verdadeiro, os dois lados 
# precisam resultar em TRUE

x <- 5
x >= 3 & x <=7



y <- 2
y >= 3 & y <= 7

## | - OU - Para ser verdadeiro, apenas um dos 
# lados precisa ser verdadeiro

y <- 2
y >= 3 | y <=7

y <- 1
y >= 3 | y == 0


## ! - Negação - É o "contrário"

!TRUE

!FALSE



w <- 5
!w < 4

# Associar ! com %in% 
!"a" %in% c("b", "c")
!FALSE

# == testando a igualdade/comparando
# != diferença/comparando

# ! contrário/negando

# filter ------------------------------------------------------------------

# Filtrando uma coluna da base
imdb %>% filter(nota_imdb > 9) %>% view()
imdb %>% filter(diretor == "Quentin Tarantino")

# Vendo categorias de uma variável
unique(imdb$cor) # saída é um vetor
imdb %>% distinct(cor) # saída é uma tibble

imdb %>% distinct(classificacao)

imdb %>% distinct(diretor)


# Filtrando duas colunas da base

## Recentes e com nota alta
imdb %>% 
 # select(titulo, ano, nota_imdb) %>% 
  filter(ano > 2010, nota_imdb > 8.5)

imdb %>% filter(ano > 2010 & nota_imdb > 8.5) 


## Gastaram menos de 100 mil, faturaram mais de 1 milhão
imdb %>% filter(orcamento < 100000, receita > 1000000) %>% view()

## Lucraram
imdb %>% filter(receita - orcamento > 0) %>% view()

## Lucraram mais de 500 milhões OU têm nota muito alta
imdb %>% filter(receita - orcamento > 500000000 | nota_imdb > 9) %>% view()

# O operador %in%
imdb %>% filter(ator_1 %in% c('Angelina Jolie Pitt', "Brad Pitt")) %>% view()

# Negação
imdb %>% filter(diretor %in% c("Quentin Tarantino", "Steven Spielberg"))
imdb %>% filter(!diretor %in% c("Quentin Tarantino", "Steven Spielberg")) %>% view()


# O que acontece com o NA?
df <- tibble(x = c(1, NA, 3))

df

filter(df, x > 1)

filter(df, is.na(x) | x > 1)

# Filtrando texto sem correspondência exata
# A função str_detect()
textos <- c("a", "aa","abc", "bc", "A", NA)

textos

str_detect(textos, pattern = "a")


## Pegando os seis primeiros valores da coluna "generos"
imdb$generos[1:6]

str_detect(
  string = imdb$generos[1:6],
  pattern = "Action"
)

## Pegando apenas os filmes que 
## tenham o gênero ação
imdb %>% filter(str_detect(generos, "Comedy")) %>% view()




# mutate ------------------------------------------------------------------

# Modificando uma coluna

imdb %>% 
  mutate(duracao = duracao/60) %>% 
  View()

# Criando uma nova coluna

imdb %>% 
  mutate(duracao_horas = duracao/60) %>% 
  # REALOCAR A COLUNA duracao_horas PARA FICAR APÓS A COLUNA duracao
  relocate(duracao_horas, .after = duracao) %>% 
  view()

# Ressaltar o NA

imdb %>% 
  mutate(lucro = receita - orcamento) %>% 
  relocate(lucro, .after = receita) %>% 
  View()

# A função ifelse é uma ótima ferramenta
# para fazermos classificação binária

imdb_info_lucro <- imdb %>% 
  mutate(
  lucro = receita - orcamento,
  houve_lucro = ifelse(lucro > 0, "Sim", "Não")
) %>% 
  relocate(c(lucro, houve_lucro), .after = receita) %>% 
  view()

# summarise ---------------------------------------------------------------

# Sumarizando uma coluna

imdb %>% summarise(media_orcamento = mean(orcamento, na.rm = TRUE))

# repare que a saída ainda é uma tibble


# Sumarizando várias colunas
imdb %>% summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  media_receita = mean(receita, na.rm = TRUE),
  media_lucro = mean(receita - orcamento, na.rm = TRUE)
)

# Diversas sumarizações da mesma coluna
imdb %>% summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  mediana_orcamento = median(orcamento, na.rm = TRUE),
  variancia_orcamento = var(orcamento, na.rm = TRUE)
)

# Tabela descritiva
imdb %>% summarise(
  media_orcamento = mean(orcamento, na.rm = TRUE),
  media_receita = mean(receita, na.rm = TRUE),
  qtd = n(),
  qtd_diretores = n_distinct(diretor),
  qtd_protagonista = n_distinct(ator_1)
)

# tidy
imdb %>% 
  distinct(diretor)

imdb %>% distinct(cor)

pessoas <- c("bea", "will", "julio", "bea", "hidelbrando", "will")

unique(pessoas)

# rbase
unique(imdb$diretor)

# funcoes que transformam -> N valores
# usamos dentro do mutate!
log(1:10)
sqrt()
str_detect()

# funcoes que sumarizam -> 1 valor
# usamos no summarize!
mean(c(1, NA, 2))
mean(c(1, NA, 2), na.rm = TRUE)
n_distinct()


# group_by + summarise ----------------------------------------------------

# Agrupando a base por uma variável.

imdb %>% group_by(cor)

# Agrupando e sumarizando
imdb %>%
  group_by(cor) %>%
  summarise(
    media_orcamento = mean(orcamento, na.rm = TRUE),
    media_receita = mean(receita, na.rm = TRUE),
    qtd = n(),
    qtd_diretores = n_distinct(diretor),
  ) %>%
  # group_by(cor) %>% 
  # ungroup() %>%  
  
  # qual a porcentagem de diretores dentro de cada grupo?
  mutate(
    total_diretores = sum(qtd_diretores),
    porc_diretores = qtd_diretores / total_diretores * 100
  ) %>% 
  select(-total_diretores)





# media de orcamento por diretores
# exemplo da duvida
imdb %>% 
  group_by(diretor) %>% 
  summarise(
    media_orcamento = mean(orcamento, na.rm = TRUE),
    n_filmes = n()
  ) %>% 
  filter(n_filmes > 1) %>% 
  arrange(desc(media_orcamento))
  

# dúvida enviada
imdb %>% 
  group_by(classificacao, cor) %>% 
  summarise(
    total = n()
  )


# left join ---------------------------------------------------------------

# A função left join serve para juntarmos duas
# tabelas a partir de uma chave. 
# Vamos ver um exemplo bem simples.

band_members
band_instruments

band_members %>% left_join(band_instruments)
band_instruments %>% left_join(band_members)

# o argumento 'by'
band_members %>% left_join(band_instruments,
                           by = "name")


# unindo com chaves diferentes
band_members2 <- band_members %>% 
  rename("nome" = name)


band_members2 %>% left_join(band_instruments,
                            by = c("nome" = "name"))

# De volta ao imdb...

# Vamos calcular a média do lucro e o lucro máximo dos filmes
# por diretor.
tab_lucro_diretor <- imdb %>% 
  mutate(lucro = receita - orcamento) %>% 
  group_by(diretor) %>% 
  summarise(
    lucro_medio_diretor = mean(lucro, na.rm = TRUE),
    lucro_maximo_diretor = max(lucro, na.rm = TRUE),
  ) %>% 
  view()

# E se quisermos colocar essa informação na base
# original? Para sabermos, por exemplo, o quanto
# o lucro de cada filme se afasta do lucro médio
# do diretor que o dirigiu.

# Usamos a funçõa left join para trazer a
# coluna lucro_medio para a base imdb, associando
# cada valor de lucro_medio ao respectivo diretor
imdb %>% 
left_join(tab_lucro_diretor, by = "diretor")

# Salvando em um objeto
imdb_com_lucro_medio <- imdb %>% 
  left_join(tab_lucro_diretor, by = "diretor")

# Calculando o lucro relativo. Vamos usar a
# função scales::percent() para formatar o
# nosso resultado.

scales::percent(0.05)
scales::percent(0.5)
scales::percent(1)

imdb_com_lucro_medio %>% 
  mutate(
    lucro = receita - orcamento,
    lucro_relativo = (lucro - lucro_medio_diretor)/lucro_medio_diretor,
    lucro_relativo_2 = scales::percent(lucro_relativo)
  ) %>% 
  view()

# Fazendo de-para

depara_cores <- tibble(
  cor = c("Color", "Black and White"),
  cor_em_ptBR = c("colorido", "preto e branco")
)

# Criar a tibble manualmente

tibble(
  cor = c("Color", "Black and White"),
  cor_em_ptBR = c("colorido", "preto e branco")
) %>% 
  add_row(
    cor = NA, cor_em_ptBR = NA
  )

cor <- c("Color", "Black and White")
cor_em_ptBR <- c("colorido", "preto e branco")

tibble(cor, cor_em_ptBR)

data.frame(cor, cor_em_ptBR)

data.frame(
  cor = c("Color", "Black and White"),
  cor_em_ptBR = c("colorido", "preto e branco")
)



left_join(imdb, depara_cores, by = c("cor")) %>% view()

imdb %>% 
  left_join(depara_cores, by = c("cor")) %>% 
  select(titulo, cor, cor_em_ptBR) %>% 
  View()

# OBS: existe uma família de joins

band_instruments %>% left_join(band_members)

band_instruments %>% right_join(band_members)

band_instruments %>% inner_join(band_members)

band_instruments %>% full_join(band_members)

