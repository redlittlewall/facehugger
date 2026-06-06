# 🎭 Facehugger — Definição Conceitual

> _"It attaches to any host, injects the right configuration, and leaves no trace."_

**Repositório local.** Stateless. Você abre o terminal dentro dele e executa `./facehugger catch <projeto>`. Ele detecta, pergunta, gera `AGENT-SEED.md` + `CONTEXT.md` com regras inline. Zero rastro. Zero acoplamento.

## Modos de Injeção

| 🕵️ Silenciosa | 🎯 Principal | 📦 Completa |
|---|---|---|
| Tudo ignorado no git | Só o essencial versionado | Tudo versionado |

## Modos de Execução

| ⚡ Rápido | ✨ Guiado | 🆕 Fresco |
|---|---|---|
| Sem perguntas | Com confirmações | Tudo do zero |

## Como o catch funciona

1. Detecta o projeto → confirma
2. Escolhe modo de execução (ou usa config)
3. Escolhe manifesto + skills
4. Escolhe issue tracker e modo de injeção
5. Gera os arquivos (AGENT-SEED.md + CONTEXT.md)
6. Pergunta se quer renomear AGENT-SEED.md
7. Oferece configurar outro projeto

## Princípios

- **Genérico:** Funciona pra qualquer stack
- **Stateless:** Cada catch é fresco
- **Autocontido:** Regras inline, sem dependência de path externo
- **Zero rastro:** Não deixa pasta .facehugger/ no hospedeiro
- **Extensível:** Skills são descobertos automaticamente via SKILL.md

## Ferramentas Acopladas

- **open-source (Vercel):** Sugere dependências pra baixar source real
- **repomix:** Recomendado como instrução no AGENT-SEED.md
- **Gravile/gloop:** Workflow de qualidade descrito, não empacotado
