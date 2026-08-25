  
  # PauloOyama.github.io
  
  Site pessoal construído com [Hugo](https://gohugo.io/) (tema [PaperMod](https://github.com/adityatelange/hugo-PaperMod)), publicado em
  [paulooyama.github.io](https://paulooyama.github.io/).
  
  ## Pré-requisitos
  
  - **Hugo Extended** >= 0.128.0 — [Instruções de instalação](https://gohugo.io/installation/)
  - **Git** com suporte a submódulos
  
  > Use a versão **extended** (não a standard). O tema PaperMod requer ela para compilar os assets CSS.
  
  ### Instalação do Hugo no Windows
  
  ```powershell
  # Via Scoop (recomendado)
  scoop install hugo-extended
  
  # Via Winget
  winget install Hugo.Hugo.Extended
  
  Instalação no macOS / Linux
  
  # macOS
  brew install hugo
  
  # Ubuntu / Debian
  sudo apt install hugo
  
  Rodando localmente
  
  # 1. Clone o repositório com os submódulos (tema PaperMod)
  git clone --recurse-submodules https://github.com/PauloOyama/PauloOyama.github.io.git
  cd PauloOyama.github.io
  
  # 2. (Opcional) Gerar os gráficos dos posts de Monte Carlo
  Rscript scripts/generate-plots.R
  
  # 3. Iniciar o servidor local com live reload
  hugo server
  
  O site estará disponível em http://localhost:1313 (http://localhost:1313).
  
  Flags úteis do servidor
  
  # Incluir posts em rascunho
  hugo server -D
  
  # Escolher porta diferente
  hugo server --port 8080
  
  # Bind em todos os IPs da rede local
  hugo server --bind 0.0.0.0
  
  Build de produção
  
  hugo --minify
  
  O site gerado fica em public/ (ignorado pelo .gitignore).
  
  Gerar gráficos (R)
  
  Os posts de Monte Carlo dependem de imagens geradas por R.
  Veja scripts/README.md (scripts/README.md) para detalhes.
  
  # Requer R instalado: https://www.r-project.org/
  Rscript scripts/generate-plots.R
  
  Estrutura do projeto
  
  content/
    portfolio/        # Posts do portfólio (PT-BR)
    en/portfolio/     # Posts do portfólio (EN)
    about.md          # Página "Sobre" (PT-BR)
    en/about.md       # Página "About" (EN)
  scripts/
    generate-plots.R  # Gera PNGs para os posts de Monte Carlo
  assets/css/         # CSS customizado (sobrescreve o tema)
  layouts/            # Layouts customizados (sobrescreve o tema)
  hugo.yaml           # Configuração principal do Hugo
  
  Deploy
  
  O site é publicado automaticamente via GitHub Actions ao fazer push na branch main.
  O workflow está em .github/workflows/hugo.yml (.github/workflows/hugo.yml).
  
  ---
  
  Algumas notas sobre o conteúdo:
  
  - A versão `0.128.0 extended` foi retirada diretamente do seu `hugo.yml` — garante consistência com o CI.
  - Incluí `--recurse-submodules` no clone porque o PaperMod é um submódulo; sem isso o tema não carrega.
  - O `scoop install hugo-extended` / `winget install Hugo.Hugo.Extended` instalam a variante correta no Windows sem precisar baixar manualmente.
