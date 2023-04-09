# Problema de programação linear inteira (PLI)

## Parâmetros
- $M$: número de fábricas e clientes
- `FABRICAS`: conjunto de fábricas
- `CLIENTES`: conjunto de clientes
- `demanda_j`: demanda do cliente $j$
- `limiteProducao_i`: limite de produção da fábrica $i$
- `custoFixo_i`: custo fixo da fábrica $i$
- `custoTransporte_{i,j}`: custo de transporte da fábrica $i$ para o cliente $j$

## Variáveis de decisão

- `x_{i,j}`: quantidade produzida na fábrica $i$ para o cliente $j$
- `y_i`: indica se a fábrica $i$ é utilizada ou não

## Função objetivo

$$
\text{minimize } custoTotal = \sum_{i \in FABRICAS}\sum_{j \in CLIENTES} custoTransporte_{i,j} x_{i,j} + \sum_{i \in FABRICAS} custoFixo_i y_i
$$

## Restrições

### Demanda dos clientes

$$
\text{sujeito a } \sum_{i \in FABRICAS} x_{i,j} = demanda_j, \forall j \in CLIENTES
$$

### Limite de produção das fábricas

$$
\text{sujeito a } \sum_{j \in CLIENTES} x_{i,j} \leq limiteProducao_i y_i, \forall i \in FABRICAS
$$


## Arquivo .mod
```
param M := 3; # Define o tamanho da matriz como 3
set FABRICAS := 1..M; # Define o conjunto de fábricas de 1 a 3
set CLIENTES := 1..M; # Define o conjunto de clientes de 1 a 3

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


end; # Fim da definição do modelo de programação linear inteira (PLI) 
```


## Arquivo .dat
```
data;

param demanda := # Define o parâmetro de demanda com os valores dos clientes
1 1200
2 1700
3 1600;

param limiteProducao := # Define o parâmetro de limite de produção com os valores das fábricas
1 1800
2 1400
3 1300;

param custoFixo := # Define o parâmetro de custo fixo com os valores das fábricas
1 12000
2 11000
3 12000;

param custoTransporte : 1      2      3 := # Define o parâmetro de custo de transporte com os valores das fábricas para os clientes
1                  10     15     12
2                  17     14     20
3                  15     10     11;

end; # Fim da definição dos dados
```


## Arquivo .out

- Model: `modelo`
- Rows: `7`
- Columns: `12` (`12` integer, `3` binary)
- Non-zeros: `33`
- Status: `INTEGER OPTIMAL`
- Objective: `custoTotal = 87800` (MINimum)

### Rows

| No. | Row name | Activity | Lower bound | Upper bound |
| --- | --- | --- | --- | --- |
| `1` | `custoTotal` | `87800` | | |
| `2` | `demandaClientes[1]` | `1200` | `1200` | `=` |
| `3` | `demandaClientes[2]` | `1700` | `1700` | `=` |
| `4` | `demandaClientes[3]` | `1600` | `1600` | `=` |
| `5` | `limiteProducaoFabricas[1]` | `0` | | `-0` |
| `6` | `limiteProducaoFabricas[2]` | `0` | | `-0` |
| `7` | `limiteProducaoFabricas[3]` | `0` | | `-0` |

### Columns

| No. | Column name | Activity | Lower bound | Upper bound |
| --- | --- | --- | --- | --- |
| `1` | `x[1,1]` | `*` | `1200` | `0` |
| `2` | `x[1,2]` | `*` | `0` | `0` |
| `3` | `x[1,3]` | `*` | `600` | `0` |
| `4` | `x[2,1]` | `*` | `0` | `0` |
| `5` | `x[2,2]` | `*` | `1400` | `0` |
| `6` | `x[2,3]` | `*` | `0` | `0` |
| `7` | `x[3,1]` | `*` | `0` | `0` |
| `8` | `x[3,2]` | `*` | `300` | `0` |
| `9` | `x[3,3]` | `*` | `1000` | `0` |
| `10` | `y[1]` | `*` | `1` | `0` | `1` |
| `11` | `y[2]` | `*` | `1` | `0` | `1` |
| `12` | `y[3]` | `*` | `1` | `0` | `1` |

### Integer feasibility conditions:

- KKT.PE: max.abs.err = `0.00e+00` on row `0`
- max.rel.err = `0.00e+00` on row `0`
- High quality

- KKT.PB: max.abs.err = `0.00e+00` on row `0`
- max.rel.err = `0.00e+00` on row `0`
- High quality

End of output


### Tempo de execução:
![WhatsApp Image 2023-04-09 at 16 20 21](https://user-images.githubusercontent.com/107778190/230792504-63444dbc-967e-431d-b6b5-57cc2da4f55d.jpeg)
---
##### 1000 fábricas e 1000 clientes
Alteração em uma linha de código  
```
param M := 1000; # Define o tamanho da matriz como 1000
```
