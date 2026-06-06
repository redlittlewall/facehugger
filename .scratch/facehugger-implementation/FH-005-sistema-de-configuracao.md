## What to build

Criar o sistema de configuração do Facehugger em `core/configs/`.

### `core/configs/default.yaml`
```yaml
name: "default"
mode: "semi"                    # rapido | semi | fresco
injection: "principal"          # silenciosa | principal | completa
tracker: "local"                # github | gitlab | local
agent_tool: "claude-code"       # claude-code | cursor | windsurf | outro
default_target: ""              # vazio = perguntar sempre
opensrc_enabled: false
skills_preset: "backend"        # backend | mobile | web | infra | all
```

### `core/config.local.yaml` (.gitignored)
Arquivo vazio ou com comentário explicando que sobrescreve o default.yaml.

### Carregamento de config
Implementar função em bash que:
1. Carrega `core/configs/default.yaml`
2. Carrega `core/configs/<nome>.yaml` se especificado via `--config`
3. Carrega `core/config.local.yaml` se existir (sobrescreve)
4. Valida campos obrigatórios
5. Retorna valores como variáveis de ambiente ou arquivo temporário

## Acceptance criteria

- [ ] `core/configs/default.yaml` criado com valores padrão
- [ ] `core/config.local.yaml` criado e adicionado ao `.gitignore`
- [ ] Script de carregamento de config funcional (merge de múltiplos arquivos)
- [ ] `--config <nome>` funciona no entrypoint
- [ ] Valores default são usados quando config ausente

## Blocked by

- FH-001
