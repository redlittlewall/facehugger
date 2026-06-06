## What to build

Implementar a etapa final do catch que pergunta se o usuário quer renomear `AGENT-SEED.md` para o nome da sua ferramenta.

### Fluxo

Após gerar todos os arquivos no projeto alvo:

```
📄 Arquivos gerados com sucesso!

Quer renomear AGENT-SEED.md para o nome da sua ferramenta?
  [1] Claude Code → CLAUDE.md
  [2] Cursor → .cursorrules
  [3] Windsurf → .windsurfrules
  [4] Não, manter AGENT-SEED.md
  [5] Outro (especificar nome)
```

### Comportamento

- Se `config.agent_tool` está configurado, pular pergunta e renomear automaticamente
- Se o arquivo de destino já existir no projeto, perguntar antes de sobrescrever
- Se o usuário escolher "Outro", pedir o nome do arquivo
- Se o usuário escolher "Não", manter como `AGENT-SEED.md`

### Integração

Executado APÓS a geração dos arquivos (FH-303).

## Acceptance criteria

- [ ] Pergunta de rename no final do catch
- [ ] Renome automático se config.agent_tool estiver definido
- [ ] Opção "Outro" com entrada manual
- [ ] Verificação de conflito (arquivo já existe)
- [ ] Se não renomear, arquivo permanece como AGENT-SEED.md

## Blocked by

- FH-303
