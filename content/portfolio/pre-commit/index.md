---
title: "Pre-Commit Para Grupos de Trabalho"
date: 2024-08-09
tags: ["Git", "Pre-Commit", "Python", "Linter", "Qualidade de Código"]
categories: ["portfolio"]
summary: "Uma breve descrição de como usar linters com git hook de maneira automática em projetos com versionamento."
cover:
  image: "git-hooks.png"
  alt: "Git Hooks"
  relative: true
ShowToc: false
---

## O projeto

Este projeto aborda como padronizar código Python em equipes usando **pre-commit hooks** com ferramentas como **Black** e **Flake8**, integrando a verificação automaticamente ao fluxo de versionamento via Git.

O projeto está dividido em:

- [**Enforcement Style Guide**](standard-tools/) — Por que e como padronizar código Python com linters.
- [**Pre-Commit**](pre-commit/) — Configurando o pre-commit para aplicar os linters automaticamente.
