## What to build

Criar um novo repositório no GitHub (`red-guy/facehugger`) e estruturar a árvore de diretórios final do projeto, conforme definido no PRD.

A estrutura deve ser criada com todos os diretórios vazios necessários, prontos pra receber os arquivos nos próximos slices.

- `facehugger` — entrypoint CLI (esqueleto vazio inicial)
- `core/` — configs/, manifests/, detectors/, docs/
- `skills/` — mattpocock/, facehugger/ (setup-skills)
- `vendor/` — agent-rules-books/, claude-code/
- `templates/` — shared/, backend-api/, mobile-app/, web-frontend/, infra-service/
- `scripts/`

### No git

- `.gitignore` com `config.local.yaml` ignorado
- `.gitmodules` vazio (submodules adicionados no slice 0.2)
- `README.md` inicial
- `DEFINITION.md` (copiado do repositório atual)
- `docs/prd-facehugger.md` (copiado do repositório atual)

O repositório deve ser initialized com um commit inicial contendo apenas a estrutura vazia + arquivos de definição.

## Acceptance criteria

- [ ] Repositório `red-guy/facehugger` criado no GitHub
- [ ] Árvore de diretórios completa criada conforme o PRD
- [ ] `.gitignore` configurado ignorando `config.local.yaml`
- [ ] `README.md` inicial com descrição do projeto
- [ ] `DEFINITION.md` e `docs/prd-facehugger.md` presentes
- [ ] Primeiro commit com a estrutura limpa (sem baggage do devIA)

## Blocked by

None — can start immediately
