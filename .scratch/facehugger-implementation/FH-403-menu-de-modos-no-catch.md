## What to build

Em vez de criar um subcomando `config` separado, integrar a seleção/gerenciamento de config no início do fluxo do `catch`.

### Fluxo

Quando o usuário executa `./facehugger catch <path>`:

```
🎭 Facehugger — Catch

Como quer configurar esta execução?

[1] ⚡ Rápido (usar config existente)
    Usa as configurações salvas sem perguntar nada.

[2] ✨ Guiado (config existente + confirmações)
    Usa a config como base, mas pergunta confirmação em cada etapa.

[3] 🆕 Fresco (ignorar config, perguntar tudo)
    Ignora qualquer config salva e pergunta cada decisão do zero.

[4] ⚙️ Gerenciar Config
    Criar, selecionar ou editar configurações.
    (Após gerenciar, volta pra esta tela)
```

### Lógica

- Se não existir `config.local.yaml` e não houver configs em `core/configs/`:
  - Mostrar: "Primeira execução! Quer criar uma config agora? [Y/n]"
  - Se sim, criar config default e seguir
  - Se não, seguir em modo Fresco

- Se existir config default, sugerir ela e perguntar se quer usar

## Acceptance criteria

- [ ] Menu de modos no início do catch
- [ ] Primeira execução detecta ausência de config e oferece criar
- [ ] Opção 4 (Gerenciar Config) chama o gerenciador (FH-402)
- [ ] Após gerenciar, retorna ao menu de modos

## Blocked by

- FH-401
- FH-402
