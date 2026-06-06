## What to build

Criar e popular os templates de saída para cada tipo de projeto.

### `core/templates/shared/agent-skills-block.md`
Bloco padrão de configuração de agent skills (issue tracker, triage labels, domain). É incluído no AGENT-SEED.md de todos os projetos.

### `core/templates/shared/footer.md`
Rodapé padrão com informações de versão do Facehugger e contato.

### Templates por tipo de projeto

Cada tipo deve ter `AGENT-SEED.md.tpl` e `CONTEXT.md.tpl`:

| Tipo | AGENT-SEED.md.tpl | CONTEXT.md.tpl |
|---|---|---|
| `backend-api` | Regras de Clean Arch + DDD + Legacy Code + Philosophy of SD | Termos: Endpoint, Service, Repository, DTO, Use Case |
| `mobile-app` | Regras de Clean Code + Philosophy of SD + Refactoring | Termos: Screen, Widget, State, BLoC, Route |
| `web-frontend` | Regras de Pragmatic Programmer + Philosophy of SD | Termos: Page, Component, Store, Route, API |
| `infra-service` | Regras de Release It! + Clean Code (nano) | Termos: Proxy, Route, Upstream, Health Check, Config |

### Conteúdo mínimo do AGENT-SEED.md.tpl

```markdown
# AGENT-SEED.md — [NOME DO PROJETO]

> Regras de governança do agente.

## Filosofia do Projeto

## Regras de Engenharia
{{INJECTED_RULES}}

## Comportamento do Agente

## Agent Skills
{{AGENT_SKILLS_BLOCK}}

## Ferramentas Recomendadas
- **repomix**: `npx repomix` para contexto completo
{{OPENSRC_INSTRUCTIONS}}

## MCP Servers (TODO)
{{MCP_TODO_PLACEHOLDER}}
```

Os placeholders ({{INJECTED_RULES}}, etc.) são preenchidos pelo motor de geração (FH-201 e FH-202).

## Acceptance criteria

- [ ] Template AGENT-SEED.md.tpl para cada tipo de projeto
- [ ] Template CONTEXT.md.tpl para cada tipo de projeto
- [ ] Bloco shared/agent-skills-block.md
- [ ] Bloco shared/footer.md
- [ ] Placeholders para injeção de regras, skills, opensrc, MCP
- [ ] Termos sugeridos no CONTEXT.md.tpl relevantes para cada tipo

## Blocked by

- FH-006 (templates foram copiados, agora vamos preenchê-los)
