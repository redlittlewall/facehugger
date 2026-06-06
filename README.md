# 🎭 Facehugger

> _"It attaches to any host, injects the right configuration, and leaves no trace."_

Facehugger é um **orquestrador de configuração de projetos** para agentes de IA (Claude Code, Cursor, Windsurf). Ele detecta o tipo do seu projeto, seleciona regras de engenharia relevantes e gera um `CLAUDE.md` com **diretrizes executáveis** — instruções em fases que a IA segue automaticamente.

**Filosofia v2:** Facehugger não gera conteúdo estático. Ele **instrui a IA** a gerar o conteúdo certo, no contexto certo, com as ferramentas certas.

---

## 🚀 Uso rápido

```bash
# Clone
git clone git@github.com:red-guy/facehugger.git
cd facehugger/build

# Inicializa dependências (skills, regras de livros)
git submodule update --init --recursive

# Captura um projeto alvo
./facehugger catch ../meu-projeto
```

> ⚡ **Dica:** Se já está no Claude Code dentro do diretório `facehugger/build`, use `! ./facehugger catch <caminho>` para executar aqui mesmo.

---

## 🧠 Como funciona (v2)

```
┌──────────────────────────────────────────────────────────────┐
│                FACEHUGGER v2 (orquestrador)                   │
│                                                               │
│   1. DETECTAR (bash)                                          │
│      ├── single vs ecossistema (multi-projeto)                │
│      └── tipo do projeto (backend, mobile, web, infra, etc.)  │
│                                                               │
│   2. MANIFESTAR (YAML)                                        │
│      ├── regras de engenharia (clean arch, DDD, refactoring)  │
│      ├── skills recomendadas (Matt Pocock)                    │
│      └── termos de domínio para a IA mapear                   │
│                                                               │
│   3. GERAR CLAUDE.md COM DIRETRIZES DE IA                     │
│      └── IA executa 3 fases:                                  │
│          ├── 📋 Fase 1: Analisar código real                  │
│          ├── 📋 Fase 2: Configurar regras, skills, MCP        │
│          └── 📋 Fase 3: Auto-finalizar                        │
└──────────────────────────────────────────────────────────────┘
```

### As 3 fases que a IA executa

Quando você abre o projeto configurado no Claude Code, a IA lê o `CLAUDE.md` e executa:

| Fase | O que a IA faz |
|------|----------------|
| **1. Análise** | Explora diretórios, identifica framework, examina entidades, extrai termos de negócio reais e preenche `CONTEXT.md` |
| **2. Configuração** | Aplica regras de engenharia inline, instala skills, configura issue tracker, sugere MCP Servers baseado na stack |
| **3. Finalização** | Remove o bloco de setup do `CLAUDE.md`, resume o que foi configurado |

---

## 🎮 Modos de execução

| Modo | Flag | Descrição |
|------|------|-----------|
| ⚡ **Rápido** | `--mode rapido` | Usa config salva. Zero perguntas. |
| ✨ **Guiado** | `--mode semi` | Config salva + confirmações. **Padrão.** |
| 🆕 **Fresco** | `--mode fresh` | Ignora config, pergunta TUDO. |
| 💬 **Interativo** | `--mode interactive` | Gera entrevista de domínio para IA conduzir com o dev. |

```bash
# Exemplos
./facehugger catch ../meu-projeto               # modo guiado (padrão)
./facehugger catch ../meu-projeto --mode rapido  # sem perguntas
./facehugger catch ../meu-projeto --mode fresh   # configurar do zero
./facehugger catch ../meu-projeto --mode interactive  # IA entrevista o dev
```

## 🕵️ Modos de injeção (versionamento)

| Modo | No git | Uso |
|------|--------|-----|
| 🕵️ **Silenciosa** | Nada entra no git (adiciona ao `.gitignore`) | Time não vê os arquivos |
| 🎯 **Principal** | `AGENT-SEED.md` + `CONTEXT.md` versionados | Recomendado para times |
| 📦 **Completa** | Tudo versionado (incluindo `docs/agents/`) | Documentação completa |

## 🌐 Modo Ecossistema (multi-projeto)

Se o diretório alvo contém **2+ projetos detectáveis**, o Facehugger entra em modo ecossistema automaticamente:

```bash
# Exemplo: diretório com tattoopop-api, tattoopop-web e input-gateway
./facehugger catch ~/tattoopop
```

O que gera:
1. **`ECOSYSTEM.md`** na raiz — a IA preenche stack real, topologia, portas e fluxos
2. **`CLAUDE.md`** contextualizado em cada subprojeto
3. Cada subprojeto sabe que faz parte de um ecossistema maior

---

## 📦 Entregáveis gerados

| Arquivo | Propósito |
|---------|-----------|
| `CLAUDE.md` (ou `AGENT-SEED.md`) | Diretrizes de IA com 3 fases executáveis |
| `CONTEXT.md` | Template vazio — IA preenche com termos reais do domínio |
| `ECOSYSTEM.md` (raiz, modo ecossistema) | Mapa da arquitetura multi-projeto — IA completa |

---

## 📁 Estrutura do Facehugger

```
facehugger/build/
├── facehugger                          ← Entrypoint CLI (bash)
├── core/
│   ├── catalog.yaml                    ← Catálogo de livros de engenharia
│   ├── configs/                        ← Perfis de configuração
│   ├── manifests/                      ← Manifestos por tipo de projeto
│   │   ├── backend-api.yaml            ← Regras + skills + domain_terms
│   │   ├── mobile-app.yaml
│   │   ├── web-frontend.yaml
│   │   ├── infra-service.yaml
│   │   ├── data-pipeline.yaml
│   │   └── legacy-system.yaml
│   ├── detectors/                      ← Detecção de tipo do projeto
│   └── docs/                           ← Documentação interna
├── skills/
│   ├── mattpocock/                     ← Submodule: skills Matt Pocock
│   └── facehugger/                     ← Skills proprietárias
├── vendor/
│   ├── agent-rules-books/              ← Regras de livros (submodule)
│   └── free-claude-code/               ← Submodule: CLI alternativo
├── templates/                          ← Templates no formato de diretrizes
│   ├── backend-api/AGENT-SEED.md.tpl
│   ├── mobile-app/AGENT-SEED.md.tpl
│   ├── web-frontend/AGENT-SEED.md.tpl
│   ├── infra-service/AGENT-SEED.md.tpl
│   └── shared/ECOSYSTEM.md.tpl
├── PLANNING-v2.md                      ← Documento de planejamento da v2
└── README.md                           ← Este arquivo
```

---

## 🔧 Comandos

```bash
# Capturar um projeto (configurar)
./facehugger catch <caminho> [--mode rapido|semi|fresh|interactive]

# Finalizar setup (após entrevista interativa)
./facehugger finalize <caminho>

# Gerenciar configurações
./facehugger config

# Ajuda
./facehugger --help
./facehugger --version
./facehugger --dry-run catch <caminho>
```

---

## 🛣️ Roadmap

| Fase | Status | Funcionalidades |
|------|--------|-----------------|
| **v0.1** | ✅ Feito | Template estático, detecção básica, injeção |
| **v2/mvp** | ✅ Feito | Templates como diretrizes de IA, `domain_terms`, gitignore fix, ECOSYSTEM.md refatorado |
| **v2/intermediate** | 🔜 Próximo | IA configura skills automaticamente, issue tracker, MCP Servers |
| **v2/advanced** | 🔮 Futuro | Modo integração cross-service, auto-detecção de banco/filas para MCP |

---

## 📄 Licença

MIT
