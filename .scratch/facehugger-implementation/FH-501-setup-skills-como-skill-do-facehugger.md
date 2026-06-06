## What to build

Criar o `/setup-skills` como um skill do Facehugger que pode ser executado DENTRO do Claude Code no repositório do Facehugger.

### O que o skill faz

O skill `/setup-skills` é o mesmo que `./facehugger catch`, mas invocado de dentro do Claude Code. Quando o usuário está no repositório do Facehugger e executa:

```
> /setup-skills ../meu-projeto
```

Ele executa o mesmo fluxo do `catch`, usando o código do Facehugger.

### Implementação

- O skill já existe em `skills/facehugger/setup-skills/SKILL.md`
- Atualizar o `SKILL.md` para refletir o fluxo final definido no PRD
- O skill deve chamar `./facehugger catch <path>` por baixo dos panos
- Registrar em `core/plugin.json`

### SKILL.md

```markdown
# /setup-skills — Facehugger Catch

Configura um projeto alvo para desenvolvimento assistido por IA.

Uso: /setup-skills <caminho-do-projeto>

Fluxo:
1. Detecta tipo do projeto
2. Seleciona manifesto de regras
3. Configura issue tracker, labels, domínio
4. Gera AGENT-SEED.md + CONTEXT.md no projeto alvo
```

## Acceptance criteria

- [ ] `/setup-skills <path>` funcional dentro do Claude Code
- [ ] Fluxo idêntico ao `./facehugger catch`
- [ ] `core/plugin.json` registra o skill
- [ ] `skills/facehugger/setup-skills/SKILL.md` atualizado

## Blocked by

- FH-403 (fluxo completo do catch)
