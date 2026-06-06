# AGENT-SEED.md — {{PROJECT_NAME}}

> Regras de governança do agente. Leia antes de qualquer alteração no código.
> Gerado por 🎭 Facehugger

## Filosofia do Projeto

{{PROJECT_PHILOSOPHY}}

## Regras de Engenharia

{{INJECTED_RULES}}

## Comportamento do Agente

1. Antes de alterar, entenda o fluxo de tráfego atual.
2. Resiliência em produção é prioridade — circuit breakers, bulkheads, timeouts.
3. Toda mudança deve ser reversível ou ter rollback testado.
4. Consulte o source real de dependências via open-source quando disponível.
5. Use `npx repomix` para contexto completo do projeto quando necessário.

{{AGENT_SKILLS_BLOCK}}

## 🚧 MCP Servers — A configurar

Consulte https://modelcontextprotocol.io para configurar.

{{FOOTER}}
