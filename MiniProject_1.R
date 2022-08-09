#### Mini Project ####
#### Cleaning and Transforming Data with Power Query and R Language ####
#Limpeza e Transformação de Dados com Power Query e Linguagem R

setwd("C:/repos/Microsoft_Power_BI_DataScienceAcademy/Modulo_III/Capitulo_12")
getwd()

#### Install ####
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")

#### Load packages ####
library(dplyr)
library(data.table)
library(ggplot2)

#### Load data ####
#Source: https://archive.ics.uci.edu/ml/datasets/iris

dados_iris <- iris
View(dados_iris)

#### Exercise 1 ####
# Sumarizar os dados com as médias de cada coluna de um dataset.

library(dplyr)

medias_iris <- summarize(group_by(dados_iris, Species),
                         media_sepal_length = mean(Sepal.Length),
                         media_sepal_width = mean(Sepal.Width),
                         media_petal_length = mean(Petal.Length),
                         media_petal_width = mean(Petal.Width))

View(medias_iris)
                         
#### Exercise 2 ####
# Extrair o valor inteiro de uma das colunas decimais.

library(data.table)

dados_iris_id <- dados_iris
View(dados_iris_id)

dados_iris_id <- setDT(dados_iris_id, keep.rownames = TRUE)[]
setnames(dados_iris_id, 1, "id")
dados_iris_id$id <- as.integer(dados_iris_id$id)
View(dados_iris_id)

#### Execute Power Query ####

library(data.table)

dados_iris_id <- data.table(dados_iris)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)

#### Exercise 3 ####
# Construir um gráfico mostrando a relação de duas variáveis numéricas para as 3 categorias de uma variável categórica.

library(ggplot2)

ggplot(data = dados_iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(aes(color = Species), size = 3) + 
  ggtitle("Largura e Comprimento das Pétalas") +
  labs(x = "Largura da Pétala",
       y = "Comprimento da Pétala") + 
  theme_bw() +
  theme(title = element_text(size = 15, color = "turquoise4"))

# Colors in R Language
colors()

  
  