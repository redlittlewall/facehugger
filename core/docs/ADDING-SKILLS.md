# ➕ Adicionando Skills ao Facehugger

Skills são comandos slash (`/diagnose`, `/tdd`) que o Claude Code carrega sob demanda.

## Estrutura Esperada

Cada skill deve estar em uma pasta contendo um arquivo `SKILL.md`:

```
skills/
├── <repo-ou-categoria>/
│   └── <skill-name>/
│       └── SKILL.md
│       └── (arquivos de suporte opcionais)
```

## Onde Colocar

Dentro de `skills/`:

```
skills/
├── mattpocock/              ← Submodule (não modificar manualmente)
│   └── skills/
│       ├── engineering/
│       │   ├── diagnose/SKILL.md
│       │   └── tdd/SKILL.md
│       └── productivity/
├── facehugger/              ← Skills proprietários
│   └── setup-skills/SKILL.md
└── <novo-repo>/             ← Novos submodules ou skills manuais
    └── <skill>/SKILL.md
```

## Descoberta Automática

O Facehugger varre `skills/` recursivamente em busca de arquivos `SKILL.md`. Não é necessário cadastro — se tem `SKILL.md`, é um skill.

## Registro Opcional

Para skills próprios do Facehugger, registre em `core/plugin.json`:

```json
{
  "name": "facehugger",
  "skills": [
    "./skills/facehugger/setup-skills"
  ]
}
```

## Adicionar Via Submodule (recomendado)

```bash
git submodule add <url-do-repo> skills/<nome-do-repo>
```

O Facehugger detecta automaticamente na próxima execução.
