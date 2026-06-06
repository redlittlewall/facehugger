# 🎭 Facehugger v2 — Planejamento

> Estratégia para transformar o Facehugger de um script bash de templates
> em um orquestrador de agentes de IA que configura projetos de software.

---

## Filosofia da v2

O Facehugger v1 (bash) foi um **protótipo do processo** — documentou o que precisa
acontecer (detectar, manifestar, injetar regras, configurar skills). Mas a **execução**
deve ser feita por uma IA (Claude Code) que **entende o código** dos projetos alvo.

**Princípio fundamental:**
> O Facehugger não gera conteúdo. Ele **instrui a IA** a gerar o conteúdo certo,
> no contexto certo, com as ferramentas certas.

---

## Arquitetura da v2

```
┌──────────────────────────────────────────────────────────────┐
│                   FACEHUGGER v2 (orquestrador)                │
│                                                              │
│   ./facehugger catch <path> [--mode rapido|semi|interactive] │
│       │                                                      │
│       ▼                                                      │
│   ┌──────────────────────┐                                   │
│   │  1. DETECTAR         │  ← bash rápido (já existe)       │
│   │  - single vs ecosystem                                   │
│   │  - tipo do projeto   │                                   │
│   └──────────┬───────────┘                                   │
│              ▼                                               │
│   ┌──────────────────────┐                                   │
│   │  2. MANIFESTAR       │  ← YAML (já existe)              │
│   │  - selecionar regras │                                   │
│   │  - selecionar skills │                                   │
│   └──────────┬───────────┘                                   │
│              ▼                                               │
│   ┌──────────────────────────────────────────┐               │
│   │  3. GERAR CLAUDE.md COM DIRETRIZES DE IA │  ← NOVO       │
│   │  ├── Diretrizes por FASE                 │               │
│   │  ├── Regras de engenharia (inline)       │               │
│   │  └── Contexto do ecossistema (se houver) │               │
│   └──────────────────┬───────────────────────┘               │
│                      ▼                                       │
│   ┌──────────────────────────────────────────┐               │
│   │  4. IA EXECUTA (Claude Code)              │  ← NOVO      │
│   │  ├── Lê o CLAUDE.md com diretrizes        │               │
│   │  ├── Analisa o código fonte real          │               │
│   │  ├── Gera CONTEXT.md com termos do domínio│               │
│   │  ├── Configura skills e MCP Servers       │               │
│   │  └── Configura issue tracker              │               │
│   └───────────────────────────────────────────┘               │
└──────────────────────────────────────────────────────────────┘
```

---

## 🔑 O Coração da v2: As Diretrizes no CLAUDE.md

O segredo está em **como o CLAUDE.md é escrito**. Ao invés de placeholders
estáticos, ele contém **instruções para a IA executar**.

### Template de Diretrizes (single project)

```markdown
# 🎭 FACEHUGGER — SETUP ATIVO

Este projeto está em configuração inicial.
Execute cada fase em ordem e relate o progresso.

---

## 📋 Fase 1: Análise do Código Fonte

Explore o projeto e gere conhecimento sobre ele:

### 1A. Estrutura
- [ ] Liste os diretórios principais (src/, lib/, app/, api/, etc.)
- [ ] Identifique o framework e versões (package.json, pubspec.yaml, etc.)
- [ ] Identifique o banco de dados/configurações de infra

### 1B. Domínio
- [ ] Examine as entidades/modelos para extrair termos de negócio
- [ ] Identifique os fluxos principais (CRUD, autenticação, etc.)
- [ ] Liste Eventos de Domínio, Comandos e queries importantes
- [ ] Gere/atualize `CONTEXT.md` com a linguagem ubíqua REAL

### 1C. Arquitetura
- [ ] Identifique o padrão arquitetural (MVC, Clean Arch, etc.)
- [ ] Mapeie as camadas e dependências entre elas
- [ ] Verifique se há testes e qual o framework usado

---

## 📋 Fase 2: Configuração

### 2A. Regras de Engenharia

Aplique estas regras ao projeto (já incorporadas neste documento):

{REGRAS_INLINE}

### 2B. Skills do Matt Pocock

Skills recomendadas para este projeto:
{SKILLS_LIST}

Instale com:
```bash
mkdir -p .claude/skills
git clone https://github.com/mattpocock/skills.git .claude/skills
```

Depois execute `/setup-matt-pocock-skills` no Claude Code.

### 2C. Issue Tracker

Configure o issue tracker conforme:
{TRACKER_CONFIG}

### 2D. MCP Servers

Baseado na análise da Fase 1, configure MCP Servers para:
- Banco de dados identificado (PostgreSQL, SQLite, etc.)
- APIs externas identificadas
- Ferramentas de deploy (Docker, etc.)

---

## 📋 Fase 3: Finalização

- [ ] Remova este bloco de setup do CLAUDE.md
- [ ] Resuma o que foi configurado
- [ ] Aponte próximos passos recomendados
```

---

## 🌐 Modo Ecossistema (multi-projeto)

Quando o Facehugger detecta múltiplos projetos sob um diretório pai,
ele opera em modo **ecossistema**.

### Diferenças do modo single:

1. **Gera ECOSYSTEM.md** na raiz — a IA deve preencher com:
   - Stack real de cada serviço
   - Diagrama de arquitetura baseado no código
   - Portas e URLs reais (lendo docker-compose, configs, etc.)
   - Fluxos de dados entre serviços

2. **Gera CLAUDE.md contextualizado** em cada subprojeto:
   - Cada CLAUDE.md sabe que faz parte de um ecossistema
   - Inclui referências aos projetos irmãos
   - Instrui a IA a respeitar boundaries entre contextos

3. **Contexto global opcional**:
   - Se o usuário quiser, pode gerar um "modo integração"
   - Um template de tarefa que instrui a IA a implementar algo
     que atravessa múltiplos serviços

### Exemplo de ECOSYSTEM.md gerado pela IA:

```markdown
# 🌐 TatooPop — Ecossistema

## Stack (detectado pela IA)
| Projeto | Tipo | Tech | Porta |
|---------|------|------|-------|
| tattoopop-api | Backend | NestJS + PostgreSQL | :3000 |
| tattoopop-web-v2 | Frontend | SvelteKit | :5173 |
| TattooPop-Mobile | Mobile | Flutter | — |
| input-gateway | Proxy | Nginx | :80 |

## Fluxos (detectado pela IA)
- Web → Gateway → API → PostgreSQL
- Mobile → Gateway → API → PostgreSQL
- API → Web (SSR via SvelteKit)

## Como implementar uma feature cross-service
Para implementar algo que atravessa serviços:
1. Defina o contrato da API em `tattoopop-api/`
2. Atualize o gateway se necessário em `input-gateway/`
3. Consuma o novo endpoint em `tattoopop-web-v2/` e/ou `TattooPop-Mobile/`
```

---

## 🧩 Modos de Execução

| Modo | Fluxo | Uso |
|------|-------|-----|
| `rapido` | Bash detecta → Gera CLAUDE.md minimalista | Quando o dev já conhece o projeto |
| `semi` | Bash detecta + perguntas → Gera CLAUDE.md completo | Padrão — guiado mas rápido |
| `interactive` | Bash detecta → IA pergunta sobre o domínio | Projetos novos ou desconhecidos |
| `catch` | Apenas detecta e gera ECOSYSTEM.md | Já configurado, só mapa |

---

## 📦 Entregáveis da v2

### Mínimo (MVP)
1. Refatorar templates .tpl para formato de **diretrizes de IA**
2. Adicionar campo `domain_terms: [...]` nos manifests para sugerir à IA
3. Substituir placeholder `{{INJECTED_RULES}}` por regras inline direto no template
4. Remover placeholders não resolvidos do ECOSYSTEM.md (ex: `{{LOCAL_DEV_GUIDE}}`)

### Intermediário
5. Template de ECOSYSTEM.md que a IA preenche
6. Instruções para a IA configurar skills automaticamente
7. Issue tracker configurado pela IA

### Avançado
8. Modo "integração" — instruções para features cross-service
9. Sugestão de MCP Servers baseada na stack detectada
10. Auto-detecção de banco de dados, cache, filas para MCP

---

## 🛠️ Arquivos a modificar

| Arquivo | O que muda |
|---------|-----------|
| `templates/*/AGENT-SEED.md.tpl` | De template estático para diretrizes de IA |
| `templates/*/CONTEXT.md.tpl` | Template mínimo — IA preenche termos reais |
| `templates/shared/ECOSYSTEM.md.tpl` | Template com instruções pra IA preencher |
| `templates/shared/footer.md` | Atualizar para incluir info de setup |
| `core/manifests/*.yaml` | Adicionar `domain_terms:`, melhorar `description:` |
| `facehugger` (script) | Ajustar detecção de ecossistema |
| `.gitignore` | Adicionar `CLAUDE.md` ao bloco silenciosa |

---

## 🔄 Estratégia de implementação

```
v2/planning  →  v2/mvp  →  v2/intermediate  →  v2/advanced
     │             │              │                  │
     │        só templates      + skills         + MCP auto
     │        + manifests       + issue tracker  + cross-service
     ▼             ▼              ▼                  ▼
     └─────────────┴──────────────┴──────────────────┘
                              ↓
                         merge to main
```

---

## ❓ Perguntas em aberto

1. **CLAUDE.md com setup vs sem setup** — O template de diretrizes fica no CLAUDE.md
   e depois é removido. Mas e se o dev rodar de novo? Precisamos de um "reset"?
2. **Idempotência** — Se rodar o Facehugger 2x no mesmo projeto, o que acontece?
3. **CLAUDE.md do Facehugger** — O Facehugger deveria se auto-aplicar?
