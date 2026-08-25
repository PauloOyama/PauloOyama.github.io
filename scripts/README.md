# Scripts

## generate-plots.R

Gera os gráficos estáticos usados nos posts de Monte Carlo.

### Pré-requisitos

- R instalado (>= 4.0): https://www.r-project.org/

### Como rodar

A partir da **raiz do repositório** (onde está `hugo.yaml`):

```bash
Rscript scripts/generate-plots.R
```

Ou abra o script no RStudio e clique em **Source**.

### Saída

Os seguintes arquivos PNG são gerados em `content/portfolio/monte-carlo/imgs/`:

| Arquivo | Descrição | Post |
|---|---|---|
| `circle-estimation.png` | Estimativa de Pi via pontos aleatórios | Part 1 |
| `coin-flip-convergence.png` | Convergência da proporção de caras para 0.5 | Part 2 |
| `dice-convergence.png` | Convergência da média do dado para 3.5 | Part 2 |
| `lifetime-histogram.png` | Distribuição das médias diárias (1000 dias) | Part 2 |

> **Nota:** Estes arquivos não são commitados no repositório (estão no `.gitignore`).
> Qualquer contribuidor que queira buildar o site localmente deve rodar este script primeiro.
