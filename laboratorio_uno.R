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

#3 Distribucion normal  
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

#4 preguntas
options(max.print = 50)

#4.1 10 peliculas con mas presupuesto
orderData<-peliculas[c("original_title","budget","revenue","vote_count")]
orderData[order(-orderData[,2]),]

#4.2 10 peliculas con mejor ingreso
orderData[order(-orderData[,3]),]

#4.3 Pelicula mas votada
options(max.print = 5)
orderData[order(-orderData[,4]),]

#4.4 Pelicula con menos votos
orderData[order(orderData[,4]),]

#4.5 Cuantas peliculas se hacen por aÃ±o 
#pelixano = aggregate(peliculas[,16],list(peliculas$release_year), mean)
#head(pelixano)

#4.6 GÃ©nero principal de las 20 pelÃ­culas mÃ¡s populares
orden<-peliculas[c("original_title","vote_count","genres")]
options(max.print = 20)
orden[order(-orden[,2]),3]

#4.7 gÃ©nero que predomina en el dataset - grafico
getmode <- function(d) {
  uniqv <- unique(d)
  uniqv[which.max(tabulate(match(d, uniqv)))]
}
options(max.print = 5)
getmode(peliculas$genres)

#4.8 genero que obtuvieron mayores ganancias
orden<-peliculas[c("original_title","revenue","genres")]
options(max.print = 5)
orden[order(-orden[,2]),3]

#4.9 quÃ© genero necesito mayor presupuesto
View(orden)
orden<-peliculas[c("original_title","budget","genres")]
options(max.print = 5)
orden[order(-orden[,2]),3]

#4.10 20 mejores directores que hicieron pelÃ­culas altamente calificadas
orden<-peliculas[c("original_title","vote_count","director")]
options(max.print = 30)
orden[order(-orden[,2]),3]

#4.11 correlacion presupuestos - ingresos
hist(peliculas$budget)
hist(peliculas$revenue)
qqplot(peliculas$budget,peliculas$revenue)
cor(peliculas$budget,peliculas$revenue)

#4.12 asociacion meses - ingreso
meses_ingreso<-aggregate(peliculas$revenue,by=list((substr(peliculas$release_date,2,3))),sum)
View(meses_ingreso)

#4.13 meses lanzamientos maximos

#4.14 Calificaciones con exito comercial
qqplot(peliculas$vote_count, peliculas$revenue)
cor(peliculas$vote_count, peliculas$revenue)

#4.15 A qué género peliculas mas largas
orden<-peliculas[c("original_title","genres","runtime")]
options(max.print = 3)
orden[order(-orden[,3]),2]

#EXTRAS
#5 ACTORES CON MAS GANANCIAS
orden<-peliculas[c("original_title","cast","revenue_adj")]
options(max.print = 5)
orden[order(-orden[,3]),2]

#DIRECTOR CON MAS PELICULAS
ac<-getmode(peliculas$director)
options(max.print = 5)
ac

#ESTUDIO CON PELICULA MAS LARGA
orden<-peliculas[c("original_title","production_companies","runtime")]
options(max.print = 2)
orden[order(-orden[,3]),2]

