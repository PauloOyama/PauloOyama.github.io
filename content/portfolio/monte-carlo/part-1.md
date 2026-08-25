---
title: "O que é o Método de Monte Carlo?"
date: 2024-06-24
tags: ["R", "Monte Carlo", "Estatística", "Pi", "Probabilidade"]
categories: ["portfolio"]
summary: "Introdução ao Método de Monte Carlo e como usá-lo para estimar o valor de π com variáveis aleatórias em R."
math: true
ShowToc: true
ShowBreadCrumbs: true
cover:
  image: "MonteCarlo.webp"
  alt: "Monte Carlo"
  relative: true
---

# Uma breve introdução ao Método de Monte Carlo (M.C)

Este post é uma explicação breve porém concisa sobre o que é o Método de Monte Carlo, e serve como base para um futuro estudo comparando esta ferramenta com métodos numéricos convencionais.

## Qual a finalidade do Método de Monte Carlo?

Um dos intuitos em se criar esse método é ser uma ferramenta mais fácil para atingir certos objetivos. A matemática divide-se em pura e aplicada: a pura, com muito rigor metodológico e cálculos complexos; a aplicada, baseando-se mais em métodos experimentais para chegar aos resultados de problemas do dia a dia.

O Método de M.C busca juntar as melhores partes da matemática pura com as da aplicada, trocando a alta complexidade das equações por meios mais acessíveis como os métodos experimentais. Em resumo, esta ferramenta usa variáveis aleatórias e um grande número de experimentos que, sustentados pela **Lei dos Grandes Números (L.G.N)**, resultam em uma aproximação do resultado do problema.

## Estimando Pi (π) por meio de Monte Carlo

> *Imagine que você começa a fazer uma prova de matemática e uma questão te pede o valor de Pi (π), mas você só pode usar um computador que gera valores aleatórios em um determinado intervalo. Como fazer?*

A princípio essa pergunta parece maluca, mas sua resolução é elegante e curiosa. Vamos ver primeiro a ideia matemática e depois o código em R.

## Explicação Matemática

Considere o quadrado $Q$ de vértices $(-1,1)$, $(1,1)$, $(1,-1)$ e $(-1,-1)$, e o círculo $C$ de raio 1 circunscrito em $Q$.

Seja $A$ o seguinte conjunto:

$$
A = \{ (x,y) \in Q \mid x^2 + y^2 \leq 1 \}
$$

Ou seja, $A$ é formado pelos pontos do quadrado $Q$ que estão dentro do círculo $C$. Assim, $P(A)$ representa a probabilidade de sortear um ponto dentro do círculo:

$$
P(A) = \frac{\text{Área do Círculo}}{\text{Área do Quadrado}} = \frac{\pi \times 1^2}{2^2} = \frac{\pi}{4}
$$

E, por consequência:

$$
\pi = 4 \times P(A)
$$

## Implementação em R

Primeiro, geramos dois conjuntos de 100.000 pontos aleatórios no intervalo $[-1, 1]$:

```r
# Gera 100.000 pontos aleatórios entre -1 e 1
x <- runif(100000, -1, 1)
y <- runif(100000, -1, 1)
```

Depois, verificamos quantos pontos caíram dentro do círculo $C$:

```r
# TRUE se o ponto está dentro do círculo, FALSE se fora
circulo <- x^2 + y^2 <= 1

# P(A) = proporção de pontos dentro do círculo
p <- sum(circulo) / 100000
```

Como temos $P(A)$, calculamos $\pi$:

```r
piresultado <- 4 * p
# piresultado ≈ 3.13988

# Visualização
plot(x, y, type = "n")
points(x[ circulo], y[ circulo], col = "orange", pch = 20, cex = 0.5)
points(x[!circulo], y[!circulo], col = "blue",   pch = 20, cex = 0.5)
```

O resultado visual é a distribuição dos pontos dentro (laranja) e fora (azul) do círculo:

![Estimativa de Pi via Monte Carlo — pontos dentro do círculo em laranja, fora em azul](imgs/circle-estimation.png)

> **Resultado:** Com 100.000 pontos, a estimativa de π fica em torno de **3,1399 ~ 3,1416**, demonstrando como a simulação aleatória converge para o valor real com um número grande de experimentos.

---

Veja a [Parte 2](../part-2/) para entender o que sustenta matematicamente este método: a **Lei dos Grandes Números**.
