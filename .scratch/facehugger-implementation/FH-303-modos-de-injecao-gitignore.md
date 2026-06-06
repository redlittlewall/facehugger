## What to build

Implementar os modos de injeção que controlam quais arquivos são versionados e como o `.gitignore` é manipulado.

### Modos

**🕵️ Silenciosa:**
- Gera todos os arquivos no disco
- Adiciona ou cria bloco no `.gitignore`:
  ```gitignore
  # 🎭 Facehugger generated
  AGENT-SEED.md
  CONTEXT.md
  docs/agents/
  # 🎭 End Facehugger
  ```
- Se `.gitignore` não existe, cria com o bloco
- Se já existe, adiciona o bloco no final (perguntar se sobrescrever bloco existente)

**🎯 Principal:**
- Gera apenas `AGENT-SEED.md` + `CONTEXT.md`
- Ambos versionados normalmente
- Não mexe no `.gitignore`

**📦 Completa:**
- Gera tudo: `AGENT-SEED.md` + `CONTEXT.md` + `docs/agents/*`
- Tudo versionado
- Não mexe no `.gitignore`

### Integração

O modo de injeção vem da config (`config.yaml` → `injection: silenciosa`) e pode ser sobrescrito na pergunta inicial.

### Verificação

- Antes de gerar, verificar se arquivos já existem no alvo
- Se existirem, perguntar: "AGENT-SEED.md já existe. Sobrescrever? [Y/n] [Fazer backup?]"
- No modo Silenciosa, adicionar ao `.gitignore` ANTES de gerar os arquivos (pra não vazar)

## Acceptance criteria

- [ ] Modo Silenciosa adiciona bloco ao .gitignore e gera tudo ignorado
- [ ] Modo Principal gera só AGENT-SEED.md + CONTEXT.md (versionados)
- [ ] Modo Completa gera tudo versionado
- [ ] Detecção de arquivos pré-existentes com opção de sobrescrever/backup
- [ ] `.gitignore` bem formatado (bloco delimitado, fácil de remover manualmente)

## Blocked by

- FH-202 (geração de regras inline)
- FH-203 (geração de CONTEXT.md)
