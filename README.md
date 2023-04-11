# Problema de programação linear inteira (PLI)
## Enunciado :speech_balloon:
![Enunciado](https://user-images.githubusercontent.com/107778190/230794910-764060fe-5cea-41b0-8c92-75e09eb9b08b.jpeg)

## Parâmetros :abacus: 
- $M$: número de fábricas e clientes
- `FABRICAS`: conjunto de fábricas
- `CLIENTES`: conjunto de clientes
- `demanda_j`: demanda do cliente $j$
- `limiteProducao_i`: limite de produção da fábrica $i$
- `custoFixo_i`: custo fixo da fábrica $i$
- `custoTransporte_{i,j}`: custo de transporte da fábrica $i$ para o cliente $j$

## Variáveis de decisão :chart_with_upwards_trend:

- `x_{i,j}`: quantidade produzida na fábrica $i$ para o cliente $j$
- `y_i`: indica se a fábrica $i$ é utilizada ou não

## Função objetivo :heavy_check_mark:

$$
\text{minimize } custoTotal = \sum_{i \in FABRICAS}^M\sum_{j \in CLIENTES}^M custoTransporte_{i,j} x_{i,j} + \sum_{i \in FABRICAS}^M custoFixo_i y_i
$$

## Restrições :x:

### Demanda dos clientes :raised_hand:

$$
\text{sujeito a } \sum_{i \in FABRICAS}^M x_{i,j} = demanda_j, \forall j \in CLIENTES
$$

### Limite de produção das fábricas :package:

$$
\text{sujeito a } \sum_{j \in CLIENTES}^M x_{i,j} \leq limiteProducao_i y_i, \forall i \in FABRICAS
$$

---

#### Tempo de execução :hourglass_flowing_sand: e memória :floppy_disk::
![WhatsApp Image 2023-04-09 at 16 20 21](https://user-images.githubusercontent.com/107778190/230792504-63444dbc-967e-431d-b6b5-57cc2da4f55d.jpeg)
---
###### 1000 fábricas e 1000 clientes / Alteração em uma linha de código 
 
```
param M := 1000; # Define o tamanho da matriz como 1000
```
#### Tempo de execução :hourglass::heavy_plus_sign: e memória :floppy_disk::heavy_plus_sign::
![aprint1000](https://user-images.githubusercontent.com/107778190/231298204-9b772811-f79f-4127-8849-b9c6c3ed04de.png)
#### Solução ótima :trophy::
![custototal -molode02](https://user-images.githubusercontent.com/107778190/230792810-eb68b2b6-9150-4c2a-93a5-581e11269d12.png)
---
###### 2000 fábricas e 2000 clientes / Alteração em uma linha de código 

```
param M := 2000; # Define o tamanho da matriz como 2000
```
#### Erro de memória :skull::
![print2000](https://user-images.githubusercontent.com/107778190/231297274-7c833588-24c7-4a1f-9b13-6ff0a27e3352.png)
---

## Caso em que não foi possível encontrar uma solução ótima :heavy_multiplication_x:
### Restrição adicional :no_entry:
```
subj to limiteFabricasAbertas: sum{i in FABRICAS} y[i] <= 2; # Define a restrição adicional de que o número de fábricas abertas não pode exceder 2
```
#### Tempo de execução :watch::
![WhatsApp Image 2023-04-09 at 17 14 04](https://user-images.githubusercontent.com/107778190/230794495-adca63bf-6eea-4fe8-8fb9-2c6cc7fb4e92.jpeg)

---
## Gráfico de comparação entre execuções :bar_chart:
![Relação Entrada - Memória](https://user-images.githubusercontent.com/107778190/231308186-ab87add2-638e-4f4a-931a-e0b9318a0c61.png)
![Relação Entrada - Tempo](https://user-images.githubusercontent.com/107778190/231308231-c1605ac5-cd11-400c-99d9-0069c42b7d46.png)
