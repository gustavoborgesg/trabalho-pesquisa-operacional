# Trabalho de Pesquisa Operacional (Programação Linear Inteira)

Este projeto foi desenvolvido durante as aulas de Pesquisa Operacional, do curso de Ciências da Computação, com o intuito de aplicar os conhecimentos adquiridos na prática.


**Variáveis de decisão:**

- x_11, x_12, x_13: quantidade enviada da fábrica 1 aos clientes 1, 2 e 3, respectivamente
- x_21, x_22, x_23: quantidade enviada da fábrica 2 aos clientes 1, 2 e 3, respectivamente
- x_31, x_32, x_33: quantidade enviada da fábrica 3 aos clientes 1, 2 e 3, respectivamente
- y_1, y_2, y_3: fábrica i está aberta (1) ou fechada (0)

**Restrições:**

1. Restrições de demanda dos clientes:

  - x_11 + x_21 + x_31 = 1200   
  - x_12 + x_22 + x_32 = 1700
  - x_13 + x_23 + x_33 = 1600

2. Restrições de capacidade das fábricas:

  - x_11 + x_12 + x_13 <= 1800 * y_1
  - x_21 + x_22 + x_23 <= 1400 * y_2
  - x_31 + x_32 + x_33 <= 1300 * y_3

3. Restrições de integridade:

  - xij ∈ Z ≥ 0 (para todos os i e j) 
  - yi ∈ {0, 1} (para todos os i)

**Função objetivo:**

Minimizar o custo total, incluindo os custos fixos e de transporte:

Custo_total = 12000 * y_1 + 11000 * y_2 + 12000 * y_3 + 10 * x_11 + 17 * x_12 + 15 * x_13 + 15 * x_21 + 14 * x_22 + 10 * x_23 + 12 * x_31 + 20 * x_32 + 11 * x_33
