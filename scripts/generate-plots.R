# =============================================================================
# Script para gerar os gráficos estáticos dos posts de Monte Carlo
# =============================================================================
# Execute no RStudio ou via linha de comando:
#   Rscript scripts/generate-plots.R
#
# Os arquivos serão salvos em:
#   content/portfolio/monte-carlo/imgs/
#
# Pré-requisito: ter R instalado e rodar este script a partir da raiz do
# repositório (onde está o arquivo hugo.yaml).
# =============================================================================

# Garante que a pasta de destino existe
dir.create("content/portfolio/monte-carlo/imgs", recursive = TRUE, showWarnings = FALSE)

cat("=== Gerando gráficos para os posts de Monte Carlo ===\n\n")

# -----------------------------------------------------------------------------
# Plot 1: Estimativa de Pi pelo Método de Monte Carlo
# Usado em: content/portfolio/monte-carlo/part-1.md
# -----------------------------------------------------------------------------
set.seed(42)
x <- runif(100000, -1, 1)
y <- runif(100000, -1, 1)
circulo <- x^2 + y^2 <= 1
p <- sum(circulo) / 100000
piresultado <- 4 * p

png("content/portfolio/monte-carlo/imgs/circle-estimation.png",
    width = 800, height = 800, res = 100)
plot(x, y, type = "n",
     main = paste("Estimativa de Pi =", round(piresultado, 5)),
     xlab = "x", ylab = "y")
points(x[circulo],  y[circulo],  col = "orange", pch = 20, cex = 0.5)
points(x[!circulo], y[!circulo], col = "blue",   pch = 20, cex = 0.5)
dev.off()
cat("[ OK ] Plot 1 gerado: circle-estimation.png  (Pi ≈", round(piresultado, 5), ")\n")

# -----------------------------------------------------------------------------
# Plot 2: Convergência da moeda — Lei dos Grandes Números
# Usado em: content/portfolio/monte-carlo/part-2.md
# -----------------------------------------------------------------------------
set.seed(42)
lancamentos <- sample(x = c(0, 1), size = 5000, replace = TRUE)
proporcao_moeda <- cumsum(lancamentos) / 1:5000

png("content/portfolio/monte-carlo/imgs/coin-flip-convergence.png",
    width = 900, height = 500, res = 100)
plot(x = 1:5000, y = proporcao_moeda, type = "l",
     xlab = "Número de lançamentos",
     ylab = "Proporção de caras",
     main = "Convergência da moeda para E[X] = 0.5")
abline(h = 0.5, col = "red", lwd = 2)
dev.off()
cat("[ OK ] Plot 2 gerado: coin-flip-convergence.png\n")

# -----------------------------------------------------------------------------
# Plot 3: Convergência do dado — Lei dos Grandes Números
# Usado em: content/portfolio/monte-carlo/part-2.md
# -----------------------------------------------------------------------------
set.seed(42)
res_dado <- integer(10000)
for (i in 1:10000) {
  res_dado[i] <- sample(c(1, 2, 3, 4, 5, 6), 1)
}
proporcao_dado <- cumsum(res_dado) / 1:10000

png("content/portfolio/monte-carlo/imgs/dice-convergence.png",
    width = 900, height = 500, res = 100)
plot(x = 1:10000, y = proporcao_dado, type = "l",
     xlab = "Número de lançamentos",
     ylab = "Média acumulada",
     main = "Convergência do dado para E[X] = 3.5")
abline(h = 3.5, col = "red", lwd = 2)
dev.off()
cat("[ OK ] Plot 3 gerado: dice-convergence.png\n")

# -----------------------------------------------------------------------------
# Plot 4: Histograma de uma vida inteira de lançamentos de dado
# Usado em: content/portfolio/monte-carlo/part-2.md
# -----------------------------------------------------------------------------
set.seed(42)
dist_vida <- numeric(1000)
for (j in 1:1000) {
  lancamentos_dia <- sample(c(1, 2, 3, 4, 5, 6), 10000, replace = TRUE)
  dist_vida[j] <- mean(lancamentos_dia)
}

png("content/portfolio/monte-carlo/imgs/lifetime-histogram.png",
    width = 800, height = 600, res = 100)
hist(dist_vida,
     main = "Distribuição das médias diárias (1000 dias)",
     xlab = "Média do dia",
     col  = "steelblue",
     border = "white",
     breaks = 30)
abline(v = 3.5, col = "red", lwd = 2, lty = 2)
dev.off()
cat("[ OK ] Plot 4 gerado: lifetime-histogram.png\n")

# -----------------------------------------------------------------------------
cat("\n=== Todos os gráficos foram gerados com sucesso! ===\n")
cat("Local: content/portfolio/monte-carlo/imgs/\n\n")
cat("Arquivos gerados:\n")
cat("  - circle-estimation.png       (Estimativa de Pi)\n")
cat("  - coin-flip-convergence.png   (Convergência da moeda)\n")
cat("  - dice-convergence.png        (Convergência do dado)\n")
cat("  - lifetime-histogram.png      (Histograma de uma vida de lançamentos)\n")
