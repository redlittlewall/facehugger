---
name: setup-skills
description: Multi-context setup wizard. Detects the current project type (or asks), selects a skill+rule manifest, and generates AGENT-SEED.md, CONTEXT.md, and docs/agents/ for any project.
---

# /setup-skills — Facehugger Catch

Configura o projeto alvo para desenvolvimento assistido por IA.

## Uso

```
/setup-skills <caminho-do-projeto>
```

## Fluxo

1. Detecta o tipo do projeto (linguagem + framework)
2. Sugere um manifesto com regras de engenharia + skills apropriados
3. Pergunta sobre issue tracker, labels de triagem e domínio
4. Gera `AGENT-SEED.md`, `CONTEXT.md` e `docs/agents/*.md` no projeto alvo
5. Oferece renomear AGENT-SEED.md para o nome da ferramenta (CLAUDE.md, .cursorrules, etc.)

## Comportamento

- Se executado sem argumentos, usa o diretório atual como alvo
- Modos: Rápido (auto), Guiado (semi — default), Fresco (fresh)
- Stateless — cada execução é independente
- Zero rastro — não cria pastas do Facehugger no projeto alvo
