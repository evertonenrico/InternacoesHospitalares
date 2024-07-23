# Desafio Internações - Hospitalares

## Introdução

 O XHospital está precisando do seu serviço como Analista de Dados. Toda operação hospitalar é feita através de um ERP que utiliza como base de dados um banco SQL.
Esse sistema contempla um módulo que gera relatórios, mas como de costume, são relatórios limitados e extrair real valor deles não é uma tarefa fácil.
Os diretores do XHospital precisam avaliar o setor de internação e, muito melhor do que páginas e páginas de relatórios, querem um Dashboard dinâmico para fazer essa análise.

O setor de TI te dará acesso à base de dados, mas tem um detalhe: esse setor está desfalcado. Parte da equipe está de férias e um colaborador não faz mais parte da equipe. Isso significa que o setor está bem sobrecarregado e você, como um Analista de Dados, precisará desenvolver as queries SQL necessárias para fazer o projeto acontecer.


Na primeira etapa do desafio você precisa:

+ Acessar o Data World, criar sua conta e acessar a base de dados
+ Criar as queries necessárias para responder às necessidades do negócio
+ Conectar o Power BI ao Data World

![SQL 1](/SQL_.png)
![SQL 2](/SQL_2.png)

Na segunda etapa você precisa criar um Dashboard que responda perguntas como:

+ Qual o número de Admissões? E a quantidade de altas?
+ Qual a taxa de mortalidade?
+ Qual é o TMP (Tempo Médio de Permanência) dos pacientes?
+ Quais convênios nos geram maior faturamento?
+ Quais as classes de procedimentos que mais realizamos na unidade?

Essas são algumas perguntas que os diretores gostariam de responder, mas você está sendo desafiado a trazer novos insights para o hospital.

## Telas do Projeto

![Painel de Controle](/print_tela.png)

![Painel Financeiro](/print_tela2.png)

 ## Insights
+ No momento da análise, existiam 3 pacientes no hospital;
+ A taxa de mortalidade no contexto total é de 1,66% já para 2023: 1,40% e 2024: 2,78%;
+ O total de pacientes(únicos) atendidos é de 2.689;
+ O TMP (Tempo Médio de Permanência) é de 1 dia,19 horas e 53 minutos, ou 43 horas e 53 minutos;
+ A classe de serviço mais utilizada foi a Classe 19(759);
+ A maioria dos pacientes tem idades entre 45-64 anos, a segunda maior parte acima de 65 anos;
+ O horário de maior admissão é entre 06h-12h da manhã;
+ Domingo é o dia com o menor número de admissão;
+ Maio é o mês com o maior TMP (2d,9h e 58m) e Março o menor (1d,3h e 54m).

+ Receita total de 21,13Mi;
+ Em 2024 a receita é 20,09% maior comparada com o mesmo período do ano anterior;
+ A maior receita é em Janeiro com 3 milhões;
+ Vitalícia Saúde é o convênio com a maior receita;
+ A receita por acomodação são semelhantes para Enfermaria e Apartamento, sendo 10 milhões e 9 milhões respectivamente;
+ O procedimento 415 gerou maior receita;
 
 
 ## Link para o painel
 
Acesso ao painel detalhado em [Power BI](https://app.powerbi.com/view?r=eyJrIjoiYTRhZDc4OTAtZmEyMC00MWFlLTg1Y2MtM2Q2MDkyZWQ5NTUwIiwidCI6ImVhZWZiZmY5LWFmZmMtNDgwNS1hZTdkLTM4MTUxMWVmOTA3MCJ9)

> [!CAUTION]
> Dados coletados de uma base fictícia/pública.
