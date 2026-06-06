## What to build

Implementar o loop de multi-projeto: após finalizar o catch de um projeto, perguntar se o usuário quer configurar outro.

### Fluxo

```
🎯 Facehugger complete! ../meu-projeto está pronto.

Quer configurar outro projeto? [Y/n]
```

- Se Y: voltar ao início do fluxo, perguntar novo path
- Se n: encerrar com mensagem de despedida
- Se Enter: default Y

### Comportamento

- O histórico da sessão (modo de execução, config usada) persiste pro próximo projeto
- Config não persiste entre sessões (stateless)

## Acceptance criteria

- [ ] Pergunta "Quer configurar outro projeto?" ao final
- [ ] Enter = Y (default)
- [ ] Novo ciclo mantém a mesma config da sessão
- [ ] Se n, mensagem de despedida

## Blocked by

- FH-304 (rename)
- FH-305 (detecção pré-existente)
