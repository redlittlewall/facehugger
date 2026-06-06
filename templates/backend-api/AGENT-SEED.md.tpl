# AGENT-SEED.md — {{PROJECT_NAME}}

> Regras de governança do agente. Leia antes de qualquer alteração no código.
> Gerado por 🎭 Facehugger

## Filosofia do Projeto

{{PROJECT_PHILOSOPHY}}

## Regras de Engenharia

{{INJECTED_RULES}}

## Comportamento do Agente

1. Antes de escrever código novo, leia `CONTEXT.md` e explore a base existente.
2. Prefira separation of concerns: controllers lidam com HTTP, services com lógica de negócio.
3. Validação nas boundaries (DTOs/Pipes), não espalhada pelos services.
4. Repository pattern para acesso a dados — dependa de interfaces, não do ORM diretamente.
5. Sempre adicione/atualize docstrings em qualquer classe ou função tocada.
6. Testes novos acompanham código novo.
7. Consulte o source real de dependências via open-source (Vercel):
   ```bash
   npx open-source <url-do-repo>
   ```
   Depois use `@open-source/<repo>` para referenciar no código.
8. Use `npx repomix` para contexto completo do projeto quando necessário.

{{AGENT_SKILLS_BLOCK}}

## 🚧 MCP Servers — A configurar

Este projeto pode se beneficiar de MCP Servers para:
- Banco de dados (PostgreSQL, SQLite)
- APIs externas

Consulte https://modelcontextprotocol.io para configurar.

{{FOOTER}}
