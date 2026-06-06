# 📋 Criando e Customizando Manifestos

Manifestos são combinações pré-definidas de regras de livros + skills para um tipo de projeto.

## Formato

```yaml
# core/manifests/meu-manifesto.yaml
name: meu-manifesto
label: Meu Manifesto
description: Descrição do que este manifesto cobre
tags: [tag1, tag2]

rules:
  - book: clean-architecture
    version: mini
    priority: high
  - book: refactoring
    version: mini
    priority: medium

recommended_skills:
  essential:
    - diagnose
    - tdd
    - handoff
  optional:
    - caveman
```

## Campos

| Campo | Descrição | Obrigatório |
|---|---|---|
| `name` | Identificador único do manifesto | ✅ |
| `label` | Nome de exibição | ✅ |
| `description` | Descrição curta | ✅ |
| `tags` | Tags para categorização | Opcional |
| `rules` | Lista de livros + versões | ✅ |
| `recommended_skills.essential` | Skills pré-selecionados | ✅ |
| `recommended_skills.optional` | Skills opcionais | Opcional |

## Regras (rules)

Cada regra tem:
- `book`: ID do livro (deve existir em `core/catalog.yaml`)
- `version`: `full` | `mini` | `nano`
- `priority`: `high` | `medium` | `low` (controla ordem de exibição)

## Livros Disponíveis

Consulte `core/catalog.yaml` para a lista completa de livros com seus IDs, autores e tags.

## Customização no Catch

Durante o catch, o usuário pode:
1. Aceitar o manifesto sugerido
2. Ver outros manifestos e selecionar
3. Customizar: adicionar/remover livros individualmente
4. Mudar versões (full/mini/nano) por livro
5. Salvar a customização como novo manifesto
