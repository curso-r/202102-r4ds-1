
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Referências do curso

  - Nosso livro **Ciência de Dados em R**: <https://livro.curso-r.com/>

  - R for Data Science: <https://r4ds.had.co.nz/>

  - Nosso blog: <https://curso-r.com/blog/>

## Dúvidas

Fora do horário de aula ou monitoria:

  - perguntas gerais sobre o curso deverão ser feitas no Classroom.

  - perguntas sobre R, principalmente as que envolverem código, deverão
    ser enviadas no [nosso fórum](https://discourse.curso-r.com/).

## Aula 1

### Conteúdo abordado

  - Vantagens de usarmos programação para analisar dados
  - Ambientação ao RStudio
      - Interface
      - Projetos
  - Introdução ao R
      - Objetos e vetores
      - Classes: números, caracteres, lógicos e data frames
      - Funções e pacotes
      - tidyverse

### Slides

  - [Introdução ao
    curso](https://curso-r.github.io/main-r4ds-1/slides/01-introducao-ao-curso.html)

  - [Introdução ao
    R](https://curso-r.github.io/main-r4ds-1/slides/02-introducao-ao-r.html)
    (tem mais conteúdo do que visto em aula, você pode pular o que não
    foi abordado ou fazer a leitura completa para se aprofundar no tema)

### Scripts da aula

``` r
nome_pasta <- "scripts/"
  tibble::tibble(
    script = list.files(nome_pasta, pattern = ".R")[1],
    link = paste0("https://curso-r.github.io/", turma, "/", nome_pasta, script)
  )
```

### Comentado na aula e extras

  - [Rladies](https://benubah.github.io/r-community-explorer/rladies.html)

  - [AI inclusive](https://www.ai-inclusive.org/)

### Lição de casa

  - [R como
    calculadora](https://livro.curso-r.com/3-2-r-como-calculadora.html#exerc%C3%ADcios)

  - [Objetos](https://livro.curso-r.com/3-3-objetosfuncoes#exerc%C3%ADcios-1)

  - Leia a [seção Vetores](https://livro.curso-r.com/3-6-vetores.html)
    do nosso livro e faça os [exercícios no fim da
    seção](https://livro.curso-r.com/3-6-vetores.html#exerc%C3%ADcios-2)

### Lição de casa extra 🤓

  - Leia o [Capítulo 2 -
    RStudio](https://livro.curso-r.com/2-rstudio.html) do nosso livro.

  - Leia as seções [3.4
    à 3.10](https://livro.curso-r.com/3-4-data-frames.html) do nosso
    livro e faça os seguintes exercícios:
    
      - [Seção 3.7](https://livro.curso-r.com/3-7-testes-l%C3%B3gicos.html#exerc%C3%ADcios-4)
      - [Seção 3.8](https://livro.curso-r.com/3-8-valoresespeciais#exerc%C3%ADcios-5)
      - [Seção 3.10](https://livro.curso-r.com/3-10-mais-sobre-data-frames.html#exerc%C3%ADcios-4)

<!-- ## Aula 2 -->

<!-- ### Conteúdo abordado -->

<!-- - Importação de arquivos -->

<!--   - arquivos de texto -->

<!--   - arquivos Excel -->

<!-- - Exportação de arquivos -->

<!-- - Manipulação de bases -->

<!--   - `select()` -->

<!--   - `arrange()` -->

<!--   - pipe `%>%` -->

<!-- ### Slides -->

<!-- - [Introdução ao curso](https://curso-r.github.io/main-r4ds-1/slides/01-introducao-ao-curso.html) -->

<!-- - [Importação](    https://curso-r.github.io/main-r4ds-1/slides/03-importacao.html) -->

<!-- - [Manipulação](https://curso-r.github.io/main-r4ds-1/slides/04-manipulacao.html) -->

<!-- ### Scripts da aula -->

<!-- ```{r, eval = FALSE} -->

<!-- nome_pasta <- "scripts/" -->

<!--   tibble::tibble( -->

<!--     script = list.files(nome_pasta, pattern = ".R")[1], -->

<!--     link = paste0("https://curso-r.github.io/", turma, "/", nome_pasta, script) -->

<!--   ) -->

<!-- ``` -->

<!-- ### Comentado na aula e extras -->

<!-- ### Lição de casa -->

<!-- ### Lição de casa extra &#x1f913; -->

<!-- ## Aula 3 -->

<!-- ### Conteúdo abordado -->

<!-- - Manipulação de bases -->

<!--   - `filter()` -->

<!--   - `mutate()` -->

<!-- ## Aula 4 -->

<!-- ### Conteúdo abordado -->

<!-- - Manipulação de bases -->

<!--   - `group_by()` e `summarise()` -->

<!--   - juntando duas bases -->

<!-- ## Aula 5 -->

<!-- ### Conteúdo abordado -->

<!-- - Gráficos -->

<!--   - Gráficos de pontos (dispersão) -->

<!--   - Gráficos de barras -->

<!-- ## Aula 6 -->

<!-- ### Conteúdo abordado -->

<!-- - Gráficos -->

<!--   - Boxplots e histogramas -->

<!--   - Customizando gráficos -->

<!-- ## Aula 7 -->

<!-- ### Conteúdo abordado -->

<!-- - Relatórios em R Markdown -->

<!--   - Introdução ao R Markdown -->

<!--   - Construindo relatórios em HTML, PDF e Word -->
