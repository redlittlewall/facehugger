## What to build

Criar os documentos de referência em `core/docs/`:

### `core/docs/DETECTION.md`
Como o Facehugger detecta o tipo do projeto. Deve incluir:
- Tabela de arquivos de configuração mapeados (`package.json` → Node, `pubspec.yaml` → Flutter, etc.)
- Estratégia de fallback (quando não detecta)
- Como adicionar novos detectores

### `core/docs/CREATING-MANIFESTS.md`
Como criar e customizar manifestos. Deve incluir:
- Formato YAML de um manifesto
- Lista de livros disponíveis (referência ao `catalog.yaml`)
- Como escolher versões (mini/nano/full)
- Como salvar um manifesto customizado

### `core/docs/ADDING-SKILLS.md`
Como adicionar novas skills ao Facehugger. Deve incluir:
- Estrutura esperada (pasta com `SKILL.md`)
- Onde colocar (dentro de `skills/`)
- Como funciona a descoberta automática
- Registro opcional em `plugin.json`

**Nota:** Este slice depende de definições do usuário para o conteúdo exato de cada doc. Se alguma seção não estiver clara nas definições existentes (PRD/DEFINITION.md), pergunte ao usuário antes de escrever.

## Acceptance criteria

- [ ] `core/docs/DETECTION.md` criado com tabela de detecção e fallback
- [ ] `core/docs/CREATING-MANIFESTS.md` criado com formato e instruções
- [ ] `core/docs/ADDING-SKILLS.md` criado com estrutura e descoberta
- [ ] Documentos usam o glossário e linguagem definidos no DEFINITION.md

## Blocked by

- FH-001
