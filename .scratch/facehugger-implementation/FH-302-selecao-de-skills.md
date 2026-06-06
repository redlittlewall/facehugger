## What to build

Implementar a seleção de skills no fluxo do catch. O Facehugger deve sugerir uma lista de skills pré-selecionados baseada no manifesto, e permitir que o usuário ative/desative cada um.

### Fluxo

```
🤖 Skills a instalar no projeto:

Essenciais (pré-selecionados):
  [x] diagnose        — Loop de debug disciplinado
  [x] tdd             — Red-Green-Refactor
  [x] grill-with-docs — Grilling + documentação automática
  [x] triage          — Triagem de issues
  [x] to-issues       — PRD → issues
  [x] handoff         — Handoff entre agentes
  [x] grill-me        — Grilling simples

Opcionais:
  [ ] zoom-out        — Visão macro do código
  [ ] prototype       — Prototipação rápida
  [ ] caveman         — Modo compacto

  [A] Aceitar seleção
  [M] Marcar/desmarcar individualmente
  [T] Marcar todos / Nenhum
```

### Implementação

- Skills disponíveis são descobertos varrendo `skills/` (qualquer subpasta com `SKILL.md`)
- A lista de "essenciais" vem do manifesto (campo `recommended_skills.essential`)
- A lista de "opcionais" vem do manifesto (campo `recommended_skills.optional`)
- Skills não listados no manifesto não aparecem (a menos que o usuário peça "ver todos")
- O resultado final é uma lista de skills selecionados

### Saída

Lista de skills selecionados é passada adiante para o motor de geração.

## Acceptance criteria

- [ ] Skills são descobertos automaticamente de `skills/`
- [ ] Lista essencial vem do manifesto (pré-selecionada)
- [ ] Lista opcional do manifesto (desmarcada)
- [ ] Usuário pode marcar/desmarcar individualmente
- [ ] Opção "Ver todos os skills disponíveis" (inclui não-listados no manifesto)
- [ ] Seleção final é passada adiante

## Blocked by

- FH-002 (submodule do Matt Pocock precisa estar no lugar)
