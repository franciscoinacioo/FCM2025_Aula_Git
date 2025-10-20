# Criado por: Francisco Inácio Paiva Ferreira
# Disciplina: Ferramentas Computacionais e Modelagem

## Adicionando o diretório de Trabalho

setwd("C:/Users/inaci/Desktop/POS -GRADUAÇÃO DOUTORADO/Disciplinas/Modelagem e ferramentas computacionais/FCM2025")
getwd()

## Carregar pacotes
library(pacman)
p_load("tidyverse")


## Carregar o data set

dados <- datasets::iris

head(dados, 20) # Visualizar as primeiras linhas dos dados, no caso as 20 primeiras
tail(dados) # Visualizar as últimas linhas dos dados

# Ter uma ideia dos dados, se as coluans são fatores numéricas, etc
glimpse(dados)
summary(dados)
str(dados)

names(dados) # observar os nomes das colunas

# Renomear os dados
dados_renomeados <- dados %>% 
  rename(
    comprimento_sepala = "Sepal.Length",
    largura_sepala = "Sepal.Width",
    comprimento_petala = "Petal.Length",
    largura_petala = "Petal.Width",
    especies = "Species"
  )

names(dados_renomeados)

# Selecionar colunas
select(dados, "Sepal.Length")
select(dados_renomeados, "comprimento_sepala")


# Filtrar colunas (seleciono linhas)
filter(dados, Species == "virginica")
filter(dados, Species == "virginica", Petal.Length > 6.0)

# Operações
mutate(dados, x = Sepal.Length * Sepal.Width, y = Petal.Length * Petal.Width)

dados_2 <- dados %>% mutate(dados, x = Sepal.Length * Sepal.Width, y = Petal.Length * Petal.Width)

dados_2

df_1 <- dados_2 %>% select(x, Species)
df_1

df_2 <- dados_2 %>% select(y, Species)
df_2

df_1 <- df_1 %>% group_by(Species) %>% mutate(media = mean(x))
df_1

dados_2 %>% group_by(Species) %>% summarise(mean(Petal.Length)) %>% View

# busca padrões
# aceita Regular Expression (ReGex)

grep("osa", dados$Species) #mostra a posição onde está
grepl("set|ver", dados$Species) #mostra verdadeiro e falso pra todos os dados

# trabalhando juntando dados

# bind row
df3 <- dados %>%
  filter(Species == "virginica")

df3

df4 <- dados %>% 
  filter(Species == "setosa")

df4



rbind(df3,df4) #juntar as linhas


# com colunas diferentes

df5 <- dados %>% 
  select(Petal.Length, Petal.Width, Species) 

df5

df6 <- dados %>% 
  select(Sepal.Length, Sepal.Width, Species) 

df6

rbind(df5, df6) # juntar linhas - nao aceita dimensoes e nomes diferentes


bind_rows(df5, df6) # juntar linhas - completa se não bater


# juntar colunas

df7 <- dados %>% head(75)
df8 <- dados %>% tail(75)

cbind(df7, df8) 

bind_cols(df7,df8)



# Fazendo join
# left, right full, inner

left_join(df7, df8, by = c('Species')) %>% View
right_join(df7, df8, by = c("Species")) %>% View


full_join(df5, df6, by = c("Species")) %>% View #Mantem todo mundo
inner_join(df5, df6, by = c("Species")) %>% View #Joga fora tudo que não bate


