# 🎭 Facehugger

> _"It attaches to any host, injects the right configuration, and leaves no trace."_

Facehugger é um configurador de IA para projetos de software. Ele detecta o tipo do seu projeto, pergunta suas preferências, e gera `AGENT-SEED.md` + `CONTEXT.md` com regras de engenharia inline e skills prontos pra usar.

## Uso rápido

```bash
git clone git@github.com:red-guy/facehugger.git
cd facehugger
git submodule update --init --recursive

./facehugger catch ../meu-projeto
```

## Como funciona

1. **Detecta** o tipo do projeto (linguagem + framework)
2. **Pergunta** suas preferências (modo de execução, manifesto, skills)
3. **Gera** `AGENT-SEED.md` + `CONTEXT.md` com regras inline
4. **Renomeia** pro nome da sua ferramenta (CLAUDE.md, .cursorrules, etc.)
5. **Vaza** — zero rastro além dos arquivos gerados

## Modos de execução

| Modo | Descrição |
|------|-----------|
| ⚡ **Rápido** | Usa config salva. Sem perguntas. |
| ✨ **Guiado** | Usa config + confirmações. |
| 🆕 **Fresco** | Pergunta tudo do zero. |

## Modos de injeção

| Modo | No git |
|------|--------|
| 🕵️ **Silenciosa** | Nada — adiciona bloco ao .gitignore |
| 🎯 **Principal** | AGENT-SEED.md + CONTEXT.md |
| 📦 **Completa** | Tudo (incluindo docs/agents/) |

## Estrutura

```
facehugger/
├── facehugger              ← Entrypoint CLI
├── core/                   ← Código principal
│   ├── catalog.yaml        ← Catálogo de livros
│   ├── configs/            ← Perfis de configuração
│   ├── manifests/          ← Combinações de regras
│   ├── detectors/          ← Detecção de projetos
│   └── docs/               ← Documentação do Facehugger
├── skills/                 ← Skills (submodules + proprietários)
│   ├── mattpocock/         ← Submodule Matt Pocock
│   └── facehugger/         ← Skills do Facehugger
├── vendor/                 ← Dependências externas
│   └── agent-rules-books/  ← Regras de livros
└── templates/              ← Templates de saída
```

## Licença

MIT
