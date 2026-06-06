# 🎭 PRD: Facehugger — Configurador de IA para Projetos de Software

**Status:** `ready-for-agent`
**Data:** 2026-06-06
**Versão:** 0.1.0

---

## Problem Statement

Desenvolvedores que usam assistentes de IA (Claude Code, Cursor, Windsurf) para programar precisam configurar cada projeto do zero — ou copiar configuração de outro projeto que pode não ser adequada. Não existe uma ferramenta que:

1. Detecte automaticamente o tipo do projeto (linguagem, framework, arquitetura)
2. Injete as regras de engenharia apropriadas para aquele tipo (Clean Architecture pra backend, Clean Code pra mobile, etc.)
3. Configure skills específicos pro ecossistema daquele projeto
4. Faça isso de forma rápida, interativa e sem deixar rastro

O resultado é que cada sessão de desenvolvimento começa com setup manual, resultados inconsistentes entre projetos, e baixa adesão a boas práticas de engenharia de software porque "ninguém quer configurar isso toda vez".

## Solução

**Facehugger** — um repositório local que, quando executado contra um projeto alvo, detecta seu tipo, pergunta as preferências do usuário, e gera os arquivos de configuração de IA (`AGENT-SEED.md` + `CONTEXT.md`) com regras de engenharia inline e skills habilitados.

Analogia com o Alien: o Facehugger se acopla ao hospedeiro (projeto alvo), injeta o ovo (configuração), e vaza. Zero rastro. O hospedeiro "nasce" pronto pra ser desenvolvido com IA.

É stateless — cada execução é fresca e adaptativa ao que encontra no hospedeiro.

## User Stories

1. Como um desenvolvedor, quero executar um comando dentro do Facehugger apontando pro meu projeto, para que ele detecte automaticamente a stack e sugira a configuração ideal.

2. Como um desenvolvedor, quero confirmar ou corrigir a detecção automática, para que a configuração gerada seja precisa pro meu projeto.

3. Como um desenvolvedor, quero escolher entre modos de execução (Rápido, Guiado, Fresco), para que eu decida o nível de controle sobre o processo.

4. Como um desenvolvedor, quero escolher entre modos de injeção (Silenciosa, Principal, Completa), para que eu decida o que é versionado no git do projeto.

5. Como um desenvolvedor, quero que o Facehugger gere AGENT-SEED.md com regras de engenharia INLINE (lidas de livros como Clean Architecture, DDD, Legacy Code), para que o projeto seja autocontido e não dependa de paths externos.

6. Como um desenvolvedor, quero que o Facehugger gere CONTEXT.md com a linguagem ubíqua do domínio, para que o agente entenda sobre o que o projeto é.

7. Como um desenvolvedor, quero selecionar entre manifestos pré-definidos de regras (backend-api, mobile-app, web-frontend, etc.), para que eu não precise montar a combinação manualmente.

8. Como um desenvolvedor, quero customizar um manifesto (adicionar/remover livros, mudar versões mini/nano/full), para que eu ajuste o rigor das regras ao meu contexto.

9. Como um desenvolvedor, quero selecionar quais skills instalar (diagnose, tdd, grill-with-docs, etc.), para que eu tenha só o que uso no dia-a-dia.

10. Como um desenvolvedor, quero que ao final da execução o AGENT-SEED.md seja renomeado pro nome da minha ferramenta (CLAUDE.md, .cursorrules, etc.), para que a ferramenta reconheça o arquivo.

11. Como um desenvolvedor, quero salvar um arquivo de configuração do Facehugger com minhas preferências, para que execuções futuras sejam mais rápidas.

12. Como um desenvolvedor, quero que o Facehugger adicione as linhas necessárias ao .gitignore no modo Silenciosa, para que nada da configuração seja versionado.

13. Como um desenvolvedor, quero que o Facehugger detecte se o projeto já tem CLAUDE.md (ou similar) e pergunte se quer manter, atualizar ou recriar.

14. Como um desenvolvedor, quero poder adicionar novos repositórios de skills (além do Matt Pocock) apenas clonando na pasta de skills, sem configurar nada.

15. Como um desenvolvedor, quero que o Facehugger sugira pacotes para baixar source via opensrc, para ter contexto profundo das dependências no AGENT-SEED.md.

16. Como um desenvolvedor, quero que o Facehugger inclua recomendação de uso do repomix no AGENT-SEED.md, para que o agente tenha acesso a contexto completo do projeto quando necessário.

17. Como mantenedor, quero que o repositório tenha uma estrutura limpa com `skills/` para skills (submodules) e `vendor/` para dependências externas, para que não haja confusão de nomes e responsabilidades.

18. Como mantenedor, quero que o entrypoint do Facehugger seja um executável na raiz do repositório chamado `facehugger`, para que o comando seja óbvio e direto.

19. Como mantenedor, quero migrar para um repositório GitHub novo com histórico limpo, sem baggage do projeto anterior (devIA), para que o projeto nasça com a estrutura correta desde o primeiro commit.

## Pre-Flight: Repository Restructuring

### Problema atual da estrutura

O repositório atual tem uma confusão estrutural herdada do projeto anterior (devIA):

| Problema | Descrição |
|---|---|
| `skills/` na raiz | É o submodule do Matt Pocock, mas o nome genérico sugere que é a pasta de skills do Facehugger. Conflito direto com `facehugger/skills/`. |
| `facehugger/` não é a raiz | O código do Facehugger está dentro de uma subpasta, mas o nome do repositório já é Facehugger. Hierarquia redundante. |
| Submodules espalhados | `skills/`, `agent-rules-books/`, `claude-code/` todos na raiz, poluindo o namespace. |
| `scripts/facehugger.sh` | Entrypoint enterrado dentro de `scripts/`, não na raiz. |
| `facehugger/docs/` vazio | Diretório de docs existe mas não tem conteúdo. |
| `STRATEGY.md` desatualizado | Documento de estratégia original não reflete as decisões tomadas na definição conceitual. |

### Solução: Reestruturação completa

Criar um **novo repositório GitHub do zero** (`facehugger/`), migrando apenas o que for necessário. Isso permite:

1. **Histórico limpo** — sem baggage do devIA, sem commits de renomeação, sem lixo
2. **Estrutura correta desde o primeiro commit** — cada pasta com propósito claro
3. **Submodules organizados** — todos dentro de `vendor/` ou similar, não poluindo a raiz
4. **Entrypoint na raiz** — `facehugger.sh` ou `facehugger` como comando único

### Nova estrutura proposta

```
facehugger/                          ← Raiz do repositório (GitHub: red-guy/facehugger)
├── facehugger                       ← Entrypoint CLI (executável bash)
├── DEFINITION.md                    ← Definição conceitual do projeto
├── README.md                        ← Apresentação + instruções rápidas
├── .gitignore
├── .gitmodules
│
├── core/                            ← ♥ Código do Facehugger
│   ├── catalog.yaml                 ← Catálogo de livros disponíveis
│   ├── plugin.json                  ← Registro de skills do Facehugger
│   ├── configs/
│   │   ├── default.yaml             ← Config padrão versionada
│   │   └── (perfis)
│   ├── config.local.yaml            ← Sobrescrita local (.gitignored)
│   ├── manifests/
│   │   ├── backend-api.yaml
│   │   ├── mobile-app.yaml
│   │   ├── web-frontend.yaml
│   │   ├── infra-service.yaml
│   │   ├── data-pipeline.yaml
│   │   └── legacy-system.yaml
│   ├── detectors/
│   │   ├── detect.sh
│   │   └── rules.yaml
│   └── docs/
│       ├── DETECTION.md
│       ├── CREATING-MANIFESTS.md
│       └── ADDING-SKILLS.md
│
├── skills/                          ← Skills do Facehugger + submodules
│   ├── mattpocock/                  ← Submodule do Matt Pocock
│   │   └── skills/
│   ├── facehugger/                  ← Skills proprietários
│   │   └── setup-skills/
│   │       └── SKILL.md
│   └── (futuros submodules/manuais)
│
├── vendor/                          ← Dependências externas (submodules)
│   ├── agent-rules-books/           ← Submodule regras de livros
│   └── claude-code/                 ← Submodule opcional free-claude-code
│
├── templates/                       ← Templates de saída
│   ├── shared/
│   │   ├── agent-skills-block.md
│   │   └── footer.md
│   ├── backend-api/
│   │   ├── AGENT-SEED.md.tpl
│   │   └── CONTEXT.md.tpl
│   ├── mobile-app/
│   ├── web-frontend/
│   └── infra-service/
│
└── scripts/                         ← Scripts auxiliares
    ├── update-submodules.sh
    └── (outros utilitários)
```

### Tarefas da reestruturação

1. Criar repositório vazio no GitHub (`facehugger/`)
2. Inicializar git do zero na pasta limpa
3. Copiar arquivos selecionados do repositório atual (DEFINITION.md, PRD, catalog.yaml, manifests, templates, scripts)
4. Re-adicionar submodules na nova estrutura (`skills/mattpocock/`, `vendor/agent-rules-books/`)
5. Atualizar `.gitmodules` com os paths corretos
6. Escrever `facehugger` entrypoint na raiz
7. Preencher `core/docs/` (DETECTION.md, CREATING-MANIFESTS.md, ADDING-SKILLS.md)
8. Remover STRATEGY.md desatualizado (DEFINITION.md + PRD o substituem)
9. Primeiro commit com a estrutura limpa

---

## Implementation Decisions

### Arquitetura Geral

- **Repositório local**: Facehugger é clonado no computador do desenvolvedor. Não é um pacote instalável (por enquanto).
- **Entrypoint**: Script `facehugger.sh` na raiz, com subcomando `catch <caminho-do-projeto>`.
- **Stateless**: Cada execução é independente. Facehugger não guarda estado do que fez em execuções anteriores.
- **Zero rastro**: Não cria pasta `.facehugger/` no hospedeiro. Apenas os arquivos combinados.

### Estrutura de Diretórios

```
Facehugger/
├── facehugger.sh                    ← Entrypoint CLI
├── DEFINITION.md                    ← Definição conceitual
├── facehugger/
│   ├── catalog.yaml                 ← Catálogo de livros disponíveis
│   ├── plugin.json                  ← Registro de skills do Facehugger
│   ├── configs/
│   │   ├── default.yaml             ← Config padrão versionada
│   │   └── (outros arquivos .yaml)  ← Perfis de configuração
│   ├── config.local.yaml            ← Sobrescrita local (.gitignored)
│   ├── manifests/
│   │   ├── backend-api.yaml
│   │   ├── mobile-app.yaml
│   │   ├── web-frontend.yaml
│   │   ├── infra-service.yaml
│   │   ├── data-pipeline.yaml
│   │   └── legacy-system.yaml
│   ├── detectors/
│   │   ├── detect.sh                ← Script de detecção
│   │   └── rules.yaml               ← Regras: arquivo → linguagem/framework
│   ├── skills/
│   │   ├── mattpocock/              ← Submodule
│   │   │   └── skills/
│   │   │       ├── engineering/
│   │   │       ├── productivity/
│   │   │       └── misc/
│   │   ├── setup-skills/
│   │   │   └── SKILL.md             ← Skill interno do Facehugger
│   │   └── (outros submodules ou skills manuais)
│   ├── templates/
│   │   ├── shared/
│   │   │   ├── agent-skills-block.md
│   │   │   └── footer.md
│   │   ├── backend-api/
│   │   │   ├── AGENT-SEED.md.tpl
│   │   │   └── CONTEXT.md.tpl
│   │   ├── mobile-app/
│   │   ├── web-frontend/
│   │   └── infra-service/
│   └── docs/
│       ├── DETECTION.md
│       ├── CREATING-MANIFESTS.md
│       └── ADDING-SKILLS.md
├── skills/                          ← Submodule Matt Pocock (raiz)
│   └── skills/
├── agent-rules-books/               ← Submodule regras de livros
├── scripts/
│   ├── facehugger.sh                ← Entrypoint real (link simbólico?)
│   └── update-submodules.sh
└── .gitmodules
```

### Fluxo do `catch`

1. **Boas-vindas**: Mostrar arte "🎭 Facehugger"
2. **Detecção**: Analisar diretório alvo por arquivos de configuração
   - `package.json` + `nest-cli.json` → backend-api (NestJS)
   - `pubspec.yaml` → mobile-app (Flutter)
   - `svelte.config.*` → web-frontend (SvelteKit)
   - `Cargo.toml` → backend-api (Rust)
   - etc.
3. **Confirmação**: "Detectei: backend-api (NestJS). Confirma? [Y/n]"
4. **Se não**: Menu de seleção manual de tipo + linguagem + framework
5. **Modo de execução**: Rápido | Guiado | Fresco | Gerenciar Config
6. **Manifesto**: Sugerir baseado no tipo, permitir trocar ou customizar
7. **Issue tracker**: GitHub | GitLab | Local | Outro
8. **Labels de triagem**: Usar defaults ou customizar
9. **Domínio**: Single-context | Multi-context
10. **Skills**: Lista pré-selecionada baseada no manifesto, permitir marcar/desmarcar
11. **opensrc**: Perguntar se quer configurar pacotes pra source download
12. **Modo de injeção**: Silenciosa | Principal | Completa
13. **Resumo e confirmação**: Mostrar tudo que será gerado
14. **Geração**: Criar AGENT-SEED.md + CONTEXT.md + docs/agents/ (se aplicável)
15. **Renomear**: "Quer renomear AGENT-SEED.md? [CLAUDE.md / .cursorrules / Outro / Não]"
16. **Multi-projeto**: "Quer configurar outro projeto? [Y/n]"

### Geração do AGENT-SEED.md

- Template por tipo de projeto (backend-api, mobile-app, etc.)
- Regras dos livros injetadas INLINE (versão mini/nano/full conforme manifesto)
- Bloco de skills configurados
- Instruções de comportamento do agente
- Recomendação de repomix
- Instrução de opensrc (se configurado)
- TODO de MCP Servers (placeholder)
- Issue tracker + triage labels + domain docs config

### Geração do CONTEXT.md

- Template por tipo de projeto
- Estrutura de linguagem ubíqua
- Termos sugeridos baseados no tipo do projeto (ex: backend-api → "Endpoint", "Service", "Repository")
- Prompt para o usuário preencher ou deixar placeholder

### Configuração do Facehugger

```yaml
# facehugger/configs/default.yaml
name: "default"
mode: "semi"                    # rapido | semi | fresco
injection: "silenciosa"         # silenciosa | principal | completa
tracker: "local"                # github | gitlab | local
agent_tool: "claude-code"       # claude-code | cursor | windsurf | outro
default_target: "~/Documentos"
opensrc_enabled: true
skills_preset: "backend"        # backend | mobile | web | infra | all
```

Arquivos suportados:
- `facehugger/configs/*.yaml` — Versionados, compartilháveis
- `facehugger/config.local.yaml` — .gitignored, sobrescreve os anteriores

## Testing Decisions

### O que torna um bom teste

- Testar o script `facehugger.sh` contra projetos mock (pastas temporárias com arquivos de config)
- Verificar que a detecção identifica corretamente cada tipo de projeto
- Verificar que o AGENT-SEED.md gerado contém as regras dos livros selecionados
- Verificar que o .gitignore é modificado corretamente no modo Silenciosa
- Verificar que o CONTEXT.md tem a estrutura correta

### Módulos a testar

- `facehugger.sh` — CLI entrypoint (fluxo completo)
- `detect.sh` — Detecção de tipo de projeto
- Geração de templates (AGENT-SEED.md.tpl, CONTEXT.md.tpl)
- Seleção e customização de manifestos
- Modos de injeção (gitignore, versionamento)

### Prior art

Não há testes existentes no repositório. Serão os primeiros.

## Out of Scope

- **Empacotamento CLI** (`facehugger` como comando global) — será Fase 2
- **skills.sh** — busca de skills externos será manual, não automatizada agora
- **opensrc** — sugestão de pacotes será feita, mas implementação da abertura de source fica pro CLAUDE.md gerado
- **MCP Servers** — não implementado, apenas TODO placeholder
- **Suporte a Cursor/Windsurf/Copilot** — o nome genérico AGENT-SEED.md permite adaptação manual, mas não teremos geração nativa de `.cursorrules` ou `.windsurfrules` agora
- **Modo --update** — re-aplicar mantendo customizações será Fase 2
- **Interface web** — nunca, Facehugger é CLI

## Further Notes

- O nome `AGENT-SEED.md` (e não `CLAUDE.md` como padrão) foi uma decisão deliberada para manter o Facehugger agnóstico de ferramenta
- TODO de MCP Servers fica explicitamente no `AGENT-SEED.md` como um bloco de configuração pendente
- A metáfora do Alien é central pro branding e pra filosofia de design — "acopla, injeta, vaza, zero rastro"
- Cada execução do `catch` pergunta o modo de execução, dando flexibilidade sem perder agilidade
- A estrutura de skills centralizada permite que o Facehugger escale sem mudanças arquiteturais — adicionar skills é só copiar uma pasta ou adicionar um submodule
