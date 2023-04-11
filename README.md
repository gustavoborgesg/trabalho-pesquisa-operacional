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

#### Tempo de execução :hourglass_flowing_sand::
![WhatsApp Image 2023-04-09 at 16 20 21](https://user-images.githubusercontent.com/107778190/230792504-63444dbc-967e-431d-b6b5-57cc2da4f55d.jpeg)
---
###### 1000 fábricas e 1000 clientes / Alteração em uma linha de código 
 
```
param M := 1000; # Define o tamanho da matriz como 1000
```
#### Tempo de execução :hourglass: :hourglass: :hourglass::
![modelo02 -tempoexecução](https://user-images.githubusercontent.com/107778190/230792784-55463377-73ac-4395-8892-c3e9148946a3.png)

#### Solução ótima :trophy::
![custototal -molode02](https://user-images.githubusercontent.com/107778190/230792810-eb68b2b6-9150-4c2a-93a5-581e11269d12.png)
---
###### 2000 fábricas e 2000 clientes / Alteração em uma linha de código 

```
param M := 2000; # Define o tamanho da matriz como 2000
```
#### Erro de memória :skull::
![image](https://user-images.githubusercontent.com/97256329/231294122-463041bc-bd81-4f27-81e6-fe3bc7ef6956.png)
---

## Caso em que não foi possível encontrar uma solução ótima :heavy_multiplication_x:
### Restrição adicional :no_entry:
```
subj to limiteFabricasAbertas: sum{i in FABRICAS} y[i] <= 2; # Define a restrição adicional de que o número de fábricas abertas não pode exceder 2
```
#### Tempo de execução :watch::
![WhatsApp Image 2023-04-09 at 17 14 04](https://user-images.githubusercontent.com/107778190/230794495-adca63bf-6eea-4fe8-8fb9-2c6cc7fb4e92.jpeg)




