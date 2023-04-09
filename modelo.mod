param M := 3; # Define o tamanho da matriz como 3
set FABRICAS := 1..M; # Define o conjunto de f�bricas de 1 a 3
set CLIENTES := 1..M; # Define o conjunto de clientes de 1 a 3

param demanda{CLIENTES}; # Define o par�metro de demanda dos clientes
param limiteProducao{FABRICAS}; # Define o par�metro de limite de produ��o das f�bricas
param custoFixo{FABRICAS}; # Define o par�metro de custo fixo das f�bricas
param custoTransporte{FABRICAS,CLIENTES}; # Define o par�metro de custo de transporte das f�bricas para os clientes

# Vari�veis de decis�o
var x{FABRICAS,CLIENTES} integer >= 0; # Define a vari�vel de produ��o que � um inteiro maior ou igual a 0
var y{FABRICAS} binary; # Define a vari�vel bin�ria que indica se a f�brica est� aberta ou n�o

# Fun��o objetivo: minimizar o custo total
minimize custoTotal: sum{i in FABRICAS, j in CLIENTES} custoTransporte[i,j] * x[i,j] + sum{i in FABRICAS} custoFixo[i] * y[i]; # Define a fun��o objetivo que minimiza o custo total

# Restri��es

# Demanda dos clientes
subj to demandaClientes{j in CLIENTES}: sum{i in FABRICAS} x[i,j] = demanda[j]; # Define a restri��o de que a soma da produ��o das f�bricas para cada cliente deve ser igual � sua demanda

# Limite de produ��o das f�bricas
subj to limiteProducaoFabricas{i in FABRICAS}: sum{j in CLIENTES} x[i,j] <= limiteProducao[i] * y[i]; # Define a restri��o de que a soma da produ��o de cada f�brica n�o pode exceder seu limite de produ��o se a f�brica estiver aberta

# Dados do problema


end; # Fim da defini��o do modelo de programa��o linear inteira  (PLI) em
