install.packages("usethis")
install.packages("devtools")
install.packages("fastmap")
install.packages("rjson")
install.packages("dplyr")
install.packages("here")
install.packages("skimr")
install.packages("janitor")


library(dplyr)
library(usethis)
library(devtools)
library(fastmap)
library("here") 
library("janitor")
library("skimr")

devtools::install_github("datadotworld/data.world-r", build_vignettes = TRUE, ref = "main")


library(data.world)

saved_cfg <- data.world::save_config(auth_token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJwcm9kLXVzZXItY2xpZW50OmVlZ29uY2EiLCJpc3MiOiJhZ2VudDplZWdvbmNhOjo3YThkM2Q3ZS04ZDFjLTQyZTMtODE1MS0wOGYwNmZhNGIyMzMiLCJpYXQiOjE3MTQwNjQ5MDEsInJvbGUiOlsidXNlcl9hcGlfcmVhZCIsInVzZXJfYXBpX3dyaXRlIl0sImdlbmVyYWwtcHVycG9zZSI6dHJ1ZX0.D6rpNA9lTpcla52mev1r8emiArcW3-AcorAVb3sj7bQRlDn9En2Edm0nYlk9Zg8IyFrJCnredglVmVwUFg75ig")
data.world::set_config(saved_cfg)

vignette("quickstart", package = "data.world")


library("data.world")

intro_ds <- "https://data.world/xperiun/desafio-xperiun-xhospital-internaes"
team_df <- data.world::query(
  data.world::qry_sql("SELECT tpro.cod_procedimento, ti.data_admissao,ti.data_alta, tp.cod_paciente, 
ti.tipo_alta,ti.cod_medico,tcp.cod_classe,tc.cod_convenio,ti.acomodacao
FROM tab_internacoes ti
    INNER JOIN tab_paciente tp ON (ti.cod_paciente = tp.cod_paciente)
    INNER JOIN tab_convenio tc ON (tp.cod_convenio = tc.cod_convenio)
    INNER JOIN tab_procedimento tpro ON (tpro.cod_procedimento = ti.cod_procedimento )
    INNER JOIN tab_classe_procedimento tcp ON (tpro.cod_classe = tcp.cod_classe)
GROUP by tp.cod_paciente,ti.data_admissao,ti.data_alta,tpro.cod_procedimento,
ti.tipo_alta,ti.cod_medico,tcp.cod_classe,tc.cod_convenio,ti.acomodacao
ORDER by tp.cod_paciente asc"),
  dataset = intro_ds
)

intro_ds <- "https://data.world/xperiun/desafio-xperiun-xhospital-internaes"
tab_internacoes <- data.world::query(
  data.world::qry_sql("SELECT * FROM tab_internacoes"),
  dataset = intro_ds
)



###INICIO DAS ANALISES###
glimpse(team_df)
View(team_df)
str(tab_internacoes)
View(tab_internacoes)

colnames(team_df)
clean_names(team_df)
clean

team_df %>% 
  count(acomodacao)

team_df %>% 
  count(tipo_alta)

#Total de Clientes
n_distinct(team_df$cod_paciente)
  
#Total de Médicos
n_distinct(team_df$cod_medico)

#Atendimento por Médicos
team_summary <- team_df %>% 
  group_by(cod_medico) %>% 
  summarise(QtdeAtend = n()) %>% 
  arrange(desc(QtdeAtend)) %>% 
  slice_max(QtdeAtend, n = 10)

# Criar o gráfico de barras
Grafico_Atend_Medico <- ggplot(team_summary, aes(x = reorder(cod_medico, -QtdeAtend), y = QtdeAtend)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_text(aes(label = QtdeAtend), vjust = -0.3, size = 4) +  # Adiciona os rótulos
  labs(x = "Código do Médico", y = "Quantidade de Atendimentos", title = "Top 10 Médicos por Atendimentos") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



#Atendimento por Acomodacao
team_summary_acomod <- team_df %>% 
  group_by(acomodacao) %>% 
  summarise(QtdeAtend = n()) %>% 
  arrange(desc(QtdeAtend)) %>% 
  slice_max(QtdeAtend, n = 10)

View(team_summary_acomod)

# Criar o gráfico de barras
Grafico_Atend_Acomd <- ggplot(team_summary_acomod, aes(x = reorder(acomodacao, -QtdeAtend), y = QtdeAtend)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_text(aes(label = QtdeAtend), vjust = -0.3, size = 4) +  # Adiciona os rótulos
  labs(x = "Acomomodacao", y = "Quantidade de Atendimentos", title = "Atend. Acomodacao") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


Grafico_Atend_Acomd
Grafico_Atend_Medico

##Analise do Valor##

total_valor <- sum(tab_internacoes$valor)

media_valor <- mean(tab_internacoes$valor)
desvio_padrao_valor<- sd(tab_internacoes$valor)
# Cálculo do coeficiente de variação
coef_valor <- (desvio_padrao_valor / media_valor) * 100
# Calcular os quartis
quartis <- quantile(tab_internacoes$valor)

boxplot(tab_internacoes$valor, main = "Boxplot dos Dados", ylab = "Valores", col = "skyblue")
abline(h = quartis, col = "red", lty = 2)  # Linhas vermelhas nos quartis



# Calcular o intervalo interquartil (IQR)
iqr <- IQR(tab_internacoes$valor)
q1 <- quartis[2]  # Primeiro quartil (Q1)
q3 <- quartis[4]  # Terceiro quartil (Q3)

# Definir os limites inferior e superior
limite_inferior <- q1 - 1.5 * iqr
limite_superior <- q3 + 1.5 * iqr

# Identificar os outliers
outliers <- tab_internacoes$valor[tab_internacoes$valor < limite_inferior |tab_internacoes$valor > limite_superior]
print(outliers)

boxplot(tab_internacoes$valor, main = "Boxplot com Outliers", ylab = "Valores", col = "lightblue")
text(x = 1, y = quartis, 
     labels = round(quartis, 2), 
     pos = 4, 
     cex = 0.8, 
     col = "red")

