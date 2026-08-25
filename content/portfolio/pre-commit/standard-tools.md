---
title: "Enforcement Style Guide — Padronizando Código Python"
date: 2024-08-09
tags: ["Python", "PEP8", "Black", "Flake8", "Qualidade de Código"]
categories: ["portfolio"]
summary: "Como implementar padronização de código Python com ferramentas automatizadas como Black e Flake8."
ShowToc: true
ShowBreadCrumbs: true
---

Ao abordar a padronização de código em Python, surge a complexidade de adaptar-se a um padrão estrutural consistente que garante que todos os desenvolvedores contribuam de maneira uniforme em um repositório. Esse desafio pode ser comparado à necessidade de seguir normas acadêmicas, como a ABNT no Brasil, onde autores de diferentes origens devem alinhar-se a um estilo comum para produzir trabalhos científicos compreensíveis.

Em Python, esse alinhamento é crucial para garantir que o código escrito por diferentes programadores seja claro e coerente, independentemente das diferenças individuais no estilo de programação.

## O problema da diversidade de estilos

A implementação desse padrão pode parecer uma tarefa árdua, especialmente considerando a diversidade de padrões disponíveis para diferentes linguagens. Enquanto algumas linguagens, como Java, apresentam múltiplos padrões de escrita devido à sua forte tipagem e características sintáticas, outras, como JavaScript, oferecem menos opções de padronização devido à sua natureza dinâmica e flexível.

A necessidade de adotar uma padronização como o **PEP 8** em Python surge como uma tentativa de unificar a escrita do código, mitigando variações e garantindo uma comunicação clara entre os desenvolvedores.

## Ferramentas automatizadas: a solução

A revisão manual seria, sem dúvida, um processo demorado e propenso a falhas, devido a fatores como cansaço e falta de atenção. Para superar esses desafios, ferramentas como **Flake8** e **Black** foram desenvolvidas, automatizando a verificação e a formatação do código de acordo com o PEP 8.

### Flake8

O [Flake8](https://flake8.pycqa.org/) é um linter que verifica o código Python em relação ao PEP 8 e detecta erros de estilo sem modificar o código. Ele funciona como um verificador: aponta o que está fora do padrão, mas não corrige.

```bash
# Instalar
pip install flake8

# Verificar um arquivo
flake8 meu_arquivo.py

# Verificar um diretório inteiro
flake8 src/
```

Exemplo de saída do Flake8:

```
src/main.py:12:1: E302 expected 2 blank lines, found 1
src/main.py:15:80: E501 line too long (85 > 79 characters)
src/utils.py:8:5: F401 'os' imported but unused
```

### Black

O [Black](https://black.readthedocs.io/) é um formatador de código que *reformata* automaticamente o código Python para conformidade com o PEP 8. Ao contrário do Flake8, ele não apenas aponta — ele corrige.

```bash
# Instalar
pip install black

# Formatar um arquivo
black meu_arquivo.py

# Verificar sem modificar (modo dry-run)
black --check meu_arquivo.py

# Formatar um diretório
black src/
```

### Comparação

| Ferramenta | O que faz | Modifica o código? |
|---|---|---|
| **Flake8** | Verifica conformidade com PEP 8 | Não |
| **Black** | Formata automaticamente | Sim |

O uso combinado das duas ferramentas é comum em projetos profissionais: Black para formatar, Flake8 para verificar o que o Black não cobre (como imports não utilizados).

---

Veja como automatizar essa verificação no fluxo de versionamento na próxima parte: [Pre-Commit](../pre-commit/).
