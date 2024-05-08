#Encontrar melhor Range de Idades

ds <- data.frame(range_idades)

colnames(ds)

names(ds)[names(ds) == "Idade"] <- "idade"

library(arules)

idade_grafico <-table(discretize(ds$idade, method = "cluster", breaks = 6))

idade_grafico
plot(idade_grafico)