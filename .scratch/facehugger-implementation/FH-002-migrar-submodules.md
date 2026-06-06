## What to build

Adicionar os submodules ao novo repositório, seguindo a estrutura definida:

```
skills/mattpocock/       ← git@github.com:mattpocock/skills.git
vendor/agent-rules-books/ ← git@github.com:mattpocock/agent-rules-books.git
vendor/claude-code/      ← git@github.com:Alishahryar1/free-claude-code.git (opcional)
```

Configurar `.gitmodules` com os paths corretos e executar `git submodule update --init --recursive` para verificar que tudo clona corretamente.

Criar um symlink ou script de setup que novos desenvolvedores possam rodar:
```bash
git clone git@github.com:red-guy/facehugger.git
cd facehugger
git submodule update --init --recursive
```

## Acceptance criteria

- [ ] `skills/mattpocock/` contém o repositório do Matt Pocock clonado
- [ ] `vendor/agent-rules-books/` contém o repositório de regras clonado
- [ ] `.gitmodules` reflete os paths corretos da nova estrutura
- [ ] `git submodule update --init --recursive` funciona sem erros
- [ ] Nenhum submodule na raiz do repositório — tudo em `skills/` ou `vendor/`

## Blocked by

- FH-001
