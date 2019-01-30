#Laboratorio 1
#Pablo Viana - 16091
#Sergio Marchena - 16387
library(nortest)

# Definimos el directorio de trabajo
setwd("~/Desktop/2019/MD/R/HT1/datamining_lab1")

# cargamos la base de datos a una variable
peliculas<-read.csv("tmdb-movies.csv")

#1 Resumen de los datos
summary(peliculas)
View(peliculas)
str(peliculas)

# 3
hist(peliculas$popularity,probability = T, main = "Popularidad")
qqnorm(peliculas$popularity)
qqline(peliculas$popularity)

hist(peliculas$budget,probability = T, main = "Budget")
qqnorm(peliculas$budget)
qqline(peliculas$budget)

hist(peliculas$revenue,probability = T, main = "Revenue")
qqnorm(peliculas$revenue)
qqline(peliculas$revenue)

hist(peliculas$vote_count,probability = T, main = "Vote Count")
qqnorm(peliculas$vote_count)
qqline(peliculas$vote_count)

hist(peliculas$vote_average,probability = T, main = "Vote Average")
qqnorm(peliculas$vote_average)
qqline(peliculas$vote_average)

hist(peliculas$release_year,probability = T, main = "Release Year")
qqnorm(peliculas$release_year)
qqline(peliculas$release_year)

hist(peliculas$budget_adj,probability = T, main = "Budget Adj")
qqnorm(peliculas$budget_adj)
qqline(peliculas$budget_adj)

hist(peliculas$revenue_adj,probability = T, main = "Revenue Adj")
qqnorm(peliculas$revenue_adj)
qqline(peliculas$revenue_adj)
