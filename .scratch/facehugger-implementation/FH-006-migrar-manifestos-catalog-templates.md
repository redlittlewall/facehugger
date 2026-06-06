## What to build

Copiar e adaptar os arquivos de definição do repositório atual para o novo repositório:

### Catalog
- `core/catalog.yaml` — Catálogo de livros (já existe, revisar paths dos submodules)

### Manifests
- `core/manifests/backend-api.yaml` (revisar para remover referências a paths antigos)
- `core/manifests/mobile-app.yaml`
- `core/manifests/web-frontend.yaml`
- `core/manifests/infra-service.yaml`
- `core/manifests/data-pipeline.yaml`
- `core/manifests/legacy-system.yaml`

### Templates
- `templates/shared/agent-skills-block.md` — Bloco padrão de referência a skills
- `templates/shared/footer.md` — Rodapé padrão
- `templates/backend-api/AGENT-SEED.md.tpl` — Template principal (renomear de CLAUDE.md.tpl)
- `templates/backend-api/CONTEXT.md.tpl`
- `templates/mobile-app/AGENT-SEED.md.tpl`
- `templates/mobile-app/CONTEXT.md.tpl`
- (mesmo para web-frontend e infra-service)

### Skills
- Copiar `facehugger/skills/setup-skills/` → `skills/facehugger/setup-skills/SKILL.md`
- `core/plugin.json` com referência ao setup-skills

### Ajustes necessários
- Atualizar referências internas (paths relativos, nomes de arquivos)
- Mudar templates de `CLAUDE.md.tpl` para `AGENT-SEED.md.tpl`
- No template AGENT-SEED.md.tpl, incluir TODO placeholder de MCP Servers

## Acceptance criteria

- [ ] `core/catalog.yaml` com paths corretos para submodules em `vendor/`
- [ ] 6 manifestos em `core/manifests/` com regras e skills recomendados
- [ ] Templates de AGENT-SEED.md e CONTEXT.md para cada tipo de projeto
- [ ] Template shared/agent-skills-block.md e footer.md
- [ ] `skills/facehugger/setup-skills/SKILL.md` copiado
- [ ] `core/plugin.json` configurado
- [ ] Nenhuma referência a paths antigos (devIA, scripts antigos)

## Blocked by

- FH-001
- FH-002 (para paths de submodules estarem corretos)
