## What to build

Implementar o motor que lê as regras dos livros em `vendor/agent-rules-books/`, seleciona a versão apropriada (mini/nano/full) conforme o manifesto, e injeta inline no template AGENT-SEED.md.

### Fluxo

1. Ler manifesto selecionado (ex: `core/manifests/backend-api.yaml`)
2. Para cada `book` no manifesto, ler o arquivo de regras:
   - `vendor/agent-rules-books/<book-path>.<version>.md`
   - Ex: `vendor/agent-rules-books/clean-architecture/clean-architecture.mini.md`
3. Concatenar as regras com cabeçalhos por livro
4. Substituir `{{INJECTED_RULES}}` no template pelo conteúdo

### Formato da saída no AGENT-SEED.md

```markdown
## Regras de Engenharia

### Clean Architecture (Robert C. Martin)
[conteúdo do mini.md]

### Domain-Driven Design Distilled (Vaughn Vernon)
[conteúdo do mini.md]
```

### Comportamento

- Se o arquivo de regras não existir, mostrar aviso e pular (não quebrar)
- Se o manifesto pedir `version: mini` e não existir, tentar `full`, depois `nano`
- Ordem das regras segue a `priority` do manifesto (high primeiro)

## Acceptance criteria

- [ ] Lê corretamente arquivos mini/nano/full de agent-rules-books
- [ ] Injeta regras inline no template, substituindo {{INJECTED_RULES}}
- [ ] Ordem respeita a prioridade do manifesto
- [ ] Fallback de versão (se mini não existe, tenta full)
- [ ] Aviso se livro não for encontrado (não quebra)

## Blocked by

- FH-002 (submodules precisam estar no lugar certo)
- FH-201 (templates precisam existir)
