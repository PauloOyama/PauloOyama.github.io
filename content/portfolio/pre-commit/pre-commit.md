---
title: "Pre-Commit — Automatizando Linters no Git"
date: 2024-08-09
tags: ["Git", "Pre-Commit", "Python", "Automação", "CI"]
categories: ["portfolio"]
summary: "Como configurar o pre-commit para rodar Black e Flake8 automaticamente antes de cada commit no Git."
ShowToc: true
ShowBreadCrumbs: true
cover:
  image: "git-hooks.png"
  alt: "Git Hooks — diagrama do fluxo de commits com hooks"
  relative: true
---

> **Nota:** Este post está em construção. O conteúdo será expandido em breve com exemplos completos de configuração do pre-commit.

## O que é pre-commit?

O [pre-commit](https://pre-commit.com/) é um framework para gerenciar e manter **hooks de Git multi-linguagem**. Um hook de pre-commit é um script que roda automaticamente **antes de cada `git commit`**, permitindo verificar ou transformar o código antes que ele seja commitado.

Combinado com as ferramentas da [parte anterior](../standard-tools/) (Black e Flake8), o pre-commit garante que nenhum código fora do padrão entre no repositório.

![Diagrama de git hooks — o hook intercepta o commit antes de ele ser finalizado](git-hooks.png)

## Instalação

```bash
pip install pre-commit
```

## Configuração básica

Crie um arquivo `.pre-commit-config.yaml` na raiz do repositório:

```yaml
repos:
  - repo: https://github.com/psf/black
    rev: 23.12.1
    hooks:
      - id: black
        language_version: python3

  - repo: https://github.com/PyCQA/flake8
    rev: 7.0.0
    hooks:
      - id: flake8
```

Em seguida, instale os hooks no repositório Git local:

```bash
pre-commit install
```

A partir deste ponto, toda vez que você rodar `git commit`, o pre-commit vai:

1. Rodar o **Black** para formatar o código
2. Rodar o **Flake8** para verificar conformidade com PEP 8
3. Se alguma verificação falhar, o commit é **bloqueado** até que os problemas sejam corrigidos

## Rodando manualmente

Para rodar os hooks em todos os arquivos do repositório sem fazer um commit:

```bash
pre-commit run --all-files
```

---

*Conteúdo completo em breve.*
