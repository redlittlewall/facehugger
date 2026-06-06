## What to build

Implementar os 3 modos de execução do catch, que controlam quantas perguntas são feitas ao usuário.

### Modo Rápido (auto)

- Carrega config ativa
- Usa TODOS os valores da config sem perguntar nada
- Detecta, gera, renomeia, fim
- Se algo obrigatório estiver faltando na config, pergunta APENAS aquilo e salva na sessão

### Modo Guiado (semi) — DEFAULT

- Carrega config ativa
- Para cada etapa, mostra o valor default e pergunta "Confirma? [Y/n]"
- Se Enter, usa o default
- Se n, mostra a alternativa

```
📋 Manifesto sugerido: backend-api [Enter pra confirmar]

Issue tracker: local [Enter pra confirmar]

Skills: diagnose, tdd, grill-with-docs... [Enter pra confirmar]
```

### Modo Fresco (fresh)

- Ignora config completamente
- Pergunta TUDO como se fosse a primeira vez
- Não carrega defaults de lugar nenhum

### Implementação

- Flag `--mode rapido|semi|fresh` no entrypoint
- Leitura da config no início
- Função `confirm_with_default()` que encapsula a lógica:
  ```bash
  confirm_with_default "Mensagem" "default" "opcoes"
  # Se modo rapido → retorna default sem perguntar
  # Se modo semi → pergunta com default
  # Se modo fresh → pergunta sem default
  ```

## Acceptance criteria

- [ ] Modo Rápido: executa sem perguntar, usando config
- [ ] Modo Guiado: pergunta cada etapa com default
- [ ] Modo Fresco: pergunta tudo sem default
- [ ] `--mode` flag funcional no entrypoint
- [ ] Missing config obrigatória é perguntada mesmo no modo Rápido

## Blocked by

- FH-005 (sistema de config)
- FH-306 (fluxo completo do catch)
