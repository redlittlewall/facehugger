# 🌐 {{ECOSYSTEM_NAME}} — Ecossistema

> Visão geral da arquitetura multi-projeto.
> Mantenha atualizado conforme o ecossistema evolui.
> Gerado por 🎭 Facehugger

## Stack

| Projeto | Tipo | Linguagem | Framework |
|---------|------|-----------|-----------|
{{STACK_TABLE}}

## Topologia de Serviços

```
{{ARCHITECTURE_DIAGRAM}}
```

## Dependências entre Projetos

{{DEPENDENCIES_LIST}}

Exemplo:
- `{{SUB_API}}` é consumido por `{{SUB_APP}}` e `{{SUB_WEB}}`
- `{{SUB_WEB}}` faz SSR e consome `{{SUB_API}}` diretamente
- `{{SUB_NGINX}}` faz proxy reverso para `{{SUB_API}}` e `{{SUB_WEB}}`

## Desenvolvimento Local

{{LOCAL_DEV_GUIDE}}

Para rodar o ecossistema completo:

```bash
# A partir da raiz do ecossistema
# (adicione aqui os comandos para cada serviço)
```

## Projetos

{{PER_PROJECT_LINKS}}

Cada projeto tem seu próprio `CLAUDE.md` e `CONTEXT.md` com regras de engenharia
e linguagem ubíqua específicas.

## Portas e URLs

| Projeto | Porta | URL |
|---------|-------|-----|
{{PORTS_URLS}}

---

> Este arquivo foi gerado por 🎭 Facehugger.
> Edite livremente — ele é seu a partir de agora.
