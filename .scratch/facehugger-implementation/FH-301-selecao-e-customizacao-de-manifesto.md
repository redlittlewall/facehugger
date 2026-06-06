## What to build

Implementar a seleção e customização de manifestos durante o fluxo do `catch`.

### Fluxo

Após a detecção do tipo de projeto:

```
📋 Manifesto sugerido: backend-api
   Regras: Clean Architecture + DDD Distilled + Legacy Code + Philosophy of SD

   [1] Usar este manifesto
   [2] Ver outros manifestos disponíveis
   [3] Customizar (adicionar/remover livros)
   [4] Mudar versões (mini/nano/full por livro)
```

### Funcionalidades

**Ver outros (2):** Lista todos os 6 manifestos com descrição e permite selecionar

**Customizar (3):**
- Adicionar livro da lista do `catalog.yaml`
- Remover livro
- Mostrar árvore atual: `[x] Clean Arch (mini)`, `[ ] Code Complete`, etc.

**Mudar versões (4):**
- Para cada livro no manifesto, permite trocar entre full/mini/nano
- Mostrar tamanho aproximado (full = máximo rigor, mini = recomendado, nano = compacto)

**Salvar customização:** Perguntar "Salvar como novo manifesto? [Y/n]" e, se sim, pedir nome.

### Informação

O manifesto final (após seleção/customização) é armazenado em variável para ser usado no passo de geração (FH-202, FH-203).

## Acceptance criteria

- [ ] Manifesto sugerido baseado no tipo detectado
- [ ] Opção de ver lista completa de manifestos
- [ ] Customização: adicionar/remover livros do catálogo
- [ ] Customização: mudar versões (mini/nano/full) por livro
- [ ] Opção de salvar manifesto customizado como novo arquivo
- [ ] Manifesto final é passado adiante no fluxo do catch

## Blocked by

- FH-006 (manifestos precisam estar no lugar certo)
