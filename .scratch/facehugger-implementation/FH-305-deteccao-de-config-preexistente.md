## What to build

Implementar a verificação de configuração pré-existente no projeto alvo. Antes de gerar qualquer arquivo, o Facehugger deve verificar se o projeto já tem um arquivo de configuração (CLAUDE.md, .cursorrules, etc.) e perguntar o que fazer.

### Fluxo

```
⚠️ O projeto alvo já possui:
  - CLAUDE.md (existente)
  - CONTEXT.md (existente)

O que deseja fazer?
  [1] Manter arquivos existentes (pular geração)
  [2] Sobrescrever com nova configuração
  [3] Atualizar (manter seções customizadas, adicionar novas)
  [4] Fazer backup dos existentes e gerar novos
```

### Comportamento

- Detectar qualquer arquivo de configuração conhecido (CLAUDE.md, .cursorrules, .windsurfrules, AGENT-SEED.md)
- Se detectar, perguntar antes de prosseguir
- Opção "Atualizar" é um placeholder (não implementado nesta versão — mostrar "Em breve")
- Backup cria pasta `.backup-facehugger-<timestamp>/` com os arquivos originais

## Acceptance criteria

- [ ] Detecta arquivos de config pré-existentes no alvo
- [ ] Menu de opções (manter, sobrescrever, backup)
- [ ] Backup funcional (cópia com timestamp)
- [ ] Opção "Atualizar" mostra "em breve" (não implementado)

## Blocked by

- FH-303
