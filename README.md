# Problema de programação linear inteira (PLI)
![WhatsApp Image 2023-04-09 at 17 25 20](https://user-images.githubusercontent.com/107778190/230794910-764060fe-5cea-41b0-8c92-75e09eb9b08b.jpeg)


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
\text{minimize } custoTotal = \sum_{i \in FABRICAS}^M\sum_{j \in CLIENTES}^M custoTransporte_{i,j} x_{i,j} + \sum_{i \in FABRICAS}^M custoFixo_i y_i
$$

## Restrições

### Demanda dos clientes

$$
\text{sujeito a } \sum_{i \in FABRICAS}^M x_{i,j} = demanda_j, \forall j \in CLIENTES
$$

### Limite de produção das fábricas

$$
\text{sujeito a } \sum_{j \in CLIENTES}^M x_{i,j} \leq limiteProducao_i y_i, \forall i \in FABRICAS
$$

---

#### Tempo de execução:
![WhatsApp Image 2023-04-09 at 16 20 21](https://user-images.githubusercontent.com/107778190/230792504-63444dbc-967e-431d-b6b5-57cc2da4f55d.jpeg)
---
###### 1000 fábricas e 1000 clientes / Alteração em uma linha de código 
 
```
param M := 1000; # Define o tamanho da matriz como 1000
```
#### Tempo de execução:
![modelo02 -tempoexecução](https://user-images.githubusercontent.com/107778190/230792784-55463377-73ac-4395-8892-c3e9148946a3.png)

#### Custo total:
![custototal -molode02](https://user-images.githubusercontent.com/107778190/230792810-eb68b2b6-9150-4c2a-93a5-581e11269d12.png)

---

## Caso em que não foi possível encontrar uma solução ótima
### Restrição adicional
```
subj to limiteFabricasAbertas: sum{i in FABRICAS} y[i] <= 2; # Define a restrição adicional de que o número de fábricas abertas não pode exceder 2
```
#### Tempo de execução:
![WhatsApp Image 2023-04-09 at 17 14 04](https://user-images.githubusercontent.com/107778190/230794495-adca63bf-6eea-4fe8-8fb9-2c6cc7fb4e92.jpeg)




