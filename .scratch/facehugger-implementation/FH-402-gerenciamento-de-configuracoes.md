## What to build

Implementar o gerenciamento de configurações: criar, selecionar e editar perfis de configuração do Facehugger.

### Fluxo

Acessado via `./facehugger config`:

```
⚙️ Gerenciar Configurações do Facehugger

Configurações disponíveis:
  [1] default        (ativa)  — modo: semi, injeção: principal
  [2] stealth                — modo: rapido, injeção: silenciosa
  [3] full-docs              — modo: semi, injeção: completa

  [C] Criar nova configuração
  [S] Selecionar configuração ativa
  [E] Editar configuração existente
  [D] Deletar configuração
```

**Criar:**
- Pedir nome
- Perguntar cada campo (modo, injeção, tracker, agent_tool, etc.)
- Salvar como `core/configs/<nome>.yaml`

**Selecionar:**
- Marcar config como ativa (salvar referência em `config.local.yaml`)

**Editar:**
- Mostrar campos atuais
- Perguntar cada um com valor atual como default

### Integração

- O entrypoint chama `config` quando `./facehugger config`
- A config ativa é lida no início do `catch`
- `config.local.yaml` armazena apenas a referência à config ativa + sobrescritas

## Acceptance criteria

- [ ] `./facehugger config` abre gerenciador
- [ ] Criar nova config com todas as opções
- [ ] Selecionar config ativa
- [ ] Editar config existente (valores atuais como default)
- [ ] Deletar config
- [ ] Config ativa é usada no catch

## Blocked by

- FH-005 (sistema de config base)
