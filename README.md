# Problema de otimização da produção

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
