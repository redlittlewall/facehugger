# 🔍 Detecção de Projetos

O Facehugger detecta o tipo do projeto analisando arquivos de configuração no diretório alvo.

## Tabela de Detecção

| Arquivos | Tipo | Linguagem | Framework | Confiança |
|---|---|---|---|---|
| `pubspec.yaml` | mobile-app | Dart | Flutter | Alta |
| `package.json` + `nest-cli.json` | backend-api | TypeScript | NestJS | Alta |
| `package.json` + `svelte.config.*` | web-frontend | TypeScript | SvelteKit | Alta |
| `package.json` + `next.config.*` | web-frontend | TypeScript | Next.js | Alta |
| `Cargo.toml` | backend-api | Rust | — | Média |
| `go.mod` | backend-api | Go | — | Média |
| `composer.json` | backend-api | PHP | Laravel/Symfony | Média |
| `nginx.conf` | infra-service | — | NGINX | Alta |
| `pyproject.toml` + `manage.py` | backend-api | Python | Django | Alta |
| `pyproject.toml` | backend-api | Python | — | Média |
| `requirements.txt` | backend-api | Python | — | Baixa |
| `package.json` (sozinho) | backend-api | TypeScript | Node.js | Baixa |

## Estratégia de Fallback

Se a detecção automática não encontrar nada (`confidence: none`):
1. O Facehugger pergunta a linguagem principal
2. Pergunta o tipo do projeto (API, Mobile, Web, Infra, Pipeline, Legado)
3. Pergunta o framework específico
4. Usa a resposta manual para o resto do fluxo

## Como Adicionar Novos Detectores

Edite `core/detectors/rules.yaml` e adicione uma nova entrada no formato:

```yaml
  - files: ["arquivo1", "arquivo2"]
    type: backend-api
    language: Python
    framework: FastAPI
    confidence: high
```

A ordem importa — o primeiro match é usado. Coloque regras mais específicas (mais arquivos) antes de genéricas.
