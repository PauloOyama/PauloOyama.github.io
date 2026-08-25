---
title: "Uma vida inteira... — Monte Carlo e a Lei dos Grandes Números"
date: 2024-06-24
tags: ["R", "Monte Carlo", "Estatística", "Lei dos Grandes Números", "Probabilidade"]
categories: ["portfolio"]
summary: "O que sustenta o Método de Monte Carlo? Neste post exploramos a Lei dos Grandes Números, o conceito de Esperança e uma simulação de uma vida inteira de lançamentos de dado."
math: true
ShowToc: true
ShowBreadCrumbs: true
cover:
  image: "MonteCarlo.webp"
  alt: "Monte Carlo"
  relative: true
---

# Uma breve introdução ao Método de Monte Carlo — Parte 2

Agora que entendemos o que é o Método de Monte Carlo e vimos uma das suas implementações ([Parte 1](../part-1/)), vamos explorar o que o sustenta matematicamente.

## O que sustenta o Método de Monte Carlo?

O Método de M.C é sustentado pelo teorema da **Lei dos Grandes Números (L.G.N)**. De forma simplificada, o teorema propõe: repita um determinado experimento um número considerável de vezes, pegue o resultado de cada um e faça sua média aritmética — o resultado converge para o **valor esperado** $E[X]$.

Existem várias aplicações para a L.G.N. A vista no post sobre Pi, por exemplo, é a versão de Bernoulli, onde só há duas probabilidades (dentro ou fora do círculo).

## Conceito de Esperança $E[X]$

A **esperança** em probabilidade representa a ideia de que algo, no limite, tende para um determinado valor. Sua notação é $E[X]$:

$$
\lim_{n \to \infty} \frac{X_1 + X_2 + X_3 + \cdots + X_n}{n} = E[X]
$$

Imagine que você passa um dia jogando uma moeda, anotando cada resultado. Nas primeiras horas, a proporção de caras e coroas pode não ser $\frac{1}{2}$ — o número $n$ de lançamentos ainda é pequeno. Mas ao continuar pelo dia inteiro, você verá que a proporção converge "magicamente" para $0.5$.

## Explicação Matemática — Moeda

Seja $X_i$ o resultado do $i$-ésimo lançamento:

$$
X_i = \begin{cases} 1, & \text{se o resultado for cara} \\ 0, & \text{se o resultado for coroa} \end{cases}
$$

Como se trata de um lançamento justo:

$$
P(X_i = 1) = \frac{1}{2} \quad \text{e} \quad P(X_i = 0) = \frac{1}{2}
$$

Pela esperança:

$$
E[X] = 0 \cdot P(X=0) + 1 \cdot P(X=1) = 1 \cdot \frac{1}{2} = \frac{1}{2}
$$

### Código em R — Moeda

```r
# Lança a moeda 5000 vezes
lancamentos <- sample(x = c(0, 1), size = 5000, replace = TRUE)

# Média acumulada para cada n entre 1 e 5000
proporcao <- cumsum(lancamentos) / 1:5000

# Figura: proporção convergindo para 0.5
plot(x = 1:5000, y = proporcao, type = "l",
     xlab = "Número de lançamentos",
     ylab = "Proporção de caras")
abline(h = 0.5, col = "red")
```

![Convergência da proporção de caras para 0.5 conforme o número de lançamentos aumenta](imgs/coin-flip-convergence.png)

---

## Explicação Matemática — Dado

Vamos ver como isso ocorre com um dado. Um dado tem 6 faces, saindo das distribuições de Bernoulli e entrando nas **Distribuições Uniformes**.

Suponha que você passe um dia lançando dados e anotando a face que saiu para cima. O que teremos como média de todas as jogadas no final do dia?

Temos que $X_i \in \{1, 2, 3, 4, 5, 6\}$ e que, para um dado não viciado:

$$
P(X_i = k) = \frac{1}{6}, \quad k \in \{1, 2, 3, 4, 5, 6\}
$$

Portanto, pela esperança:

$$
E[X] = \frac{1 \cdot \frac{1}{6} + 2 \cdot \frac{1}{6} + 3 \cdot \frac{1}{6} + 4 \cdot \frac{1}{6} + 5 \cdot \frac{1}{6} + 6 \cdot \frac{1}{6}}{1} = \frac{21}{6} = 3{,}5
$$

### Código em R — Dado

```r
res <- c()
for (i in 1:10000) {
  res[i] <- sample(c(1, 2, 3, 4, 5, 6), 1)
}
proporcao <- cumsum(res) / 1:10000

plot(x = 1:10000, y = proporcao, type = "l",
     ylab = "Média", xlab = "Número de lançamentos")
abline(h = 3.5, col = "red")
```

![Convergência da média do dado para E[X] = 3.5 conforme o número de lançamentos aumenta](imgs/dice-convergence.png)

---

## Expansão: Uma vida inteira de lançamentos

Imagine agora que, ao invés de um dia entediante, uma determinada pessoa faça isso **pela vida inteira**. No final de cada dia, após todos os lançamentos, ela pega a média do dia e a escreve em um caderno. Como seria a distribuição dessas médias diárias?

### Código em R — Uma vida de lançamentos

```r
dist <- c()
# For representando 1000 dias da sua vida
for (j in 1:1000) {
  res <- c()
  # 10.000 lançamentos por dia
  for (i in 1:10000) {
    res[i] <- sample(c(1, 2, 3, 4, 5, 6), 1)
  }
  # Ao final de cada dia, anota a média em "dist"
  dist[j] <- mean(res)
}
hist(dist)
```

![Distribuição das médias diárias ao longo de 1000 dias — a distribuição converge para uma normal centrada em 3.5](imgs/lifetime-histogram.png)

No final de uma vida inteira, a **chance da média diária ter sido 3.5 é a maior de todas**. Raramente em sua vida um lançamento diário ficou em torno de 3.56 ou 3.44 — a distribuição das médias converge para uma **normal centrada em 3.5**, conforme previsto pelo Teorema Central do Limite.

---

## Referências

- Código e explicação originados em aula do Prof. Pedro Franklin (UFU)
- [Artigo2008 — MMC (SciELO)](https://www.scielo.br/j/qn/a/sJtBCMjy58FLgy74kqRyBmB/?lang=pt)
- [Introdução aos Métodos de Monte Carlo Avançados — Adrian Hinojosa Luna (UFMG)](https://www.est.ufmg.br/portal/wp-content/uploads/2023/01/RTE_01_2019.pdf)
- [Método Monte Carlo e suas Aplicações — Admilson Rodrigues de Carvalho (UFRR)](http://repositorio.ufrr.br:8080/jspui/bitstream/prefix/388/1/M%C3%A9todo%20Monte%20Carlo%20e%20suas%20aplica%C3%A7%C3%B5es...%20Carvalho.pdf)
