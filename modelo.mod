param M := 2000; # Define o tamanho da matriz como 2000
set FABRICAS := 1..M; # Define o conjunto de fábricas de 1 a 2000
set CLIENTES := 1..M; # Define o conjunto de clientes de 1 a 2000

param demanda{CLIENTES}; # Define o parâmetro de demanda dos clientes
param limiteProducao{FABRICAS}; # Define o parâmetro de limite de produção das fábricas
param custoFixo{FABRICAS}; # Define o parâmetro de custo fixo das fábricas
param custoTransporte{FABRICAS,CLIENTES}; # Define o parâmetro de custo de transporte das fábricas para os clientes

# Variáveis de decisão
var x{FABRICAS,CLIENTES} integer >= 0; # Define a variável de produção que é um inteiro maior ou igual a 0
var y{FABRICAS} binary; # Define a variável binária que indica se a fábrica está aberta ou não

# Função objetivo: minimizar o custo total
minimize custoTotal: sum{i in FABRICAS, j in CLIENTES} custoTransporte[i,j] * x[i,j] + sum{i in FABRICAS} custoFixo[i] * y[i]; # Define a função objetivo que minimiza o custo total

# Restrições

# Demanda dos clientes
subj to demandaClientes{j in CLIENTES}: sum{i in FABRICAS} x[i,j] = demanda[j]; # Define a restrição de que a soma da produção das fábricas para cada cliente deve ser igual à sua demanda

# Limite de produção das fábricas
subj to limiteProducaoFabricas{i in FABRICAS}: sum{j in CLIENTES} x[i,j] <= limiteProducao[i] * y[i]; # Define a restrição de que a soma da produção de cada fábrica não pode exceder seu limite de produção se a fábrica estiver aberta

# Dados do problema


end; # Fim da definição do modelo de programação linear inteira  (PLI) em
