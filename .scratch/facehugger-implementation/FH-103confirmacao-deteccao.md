## What to build

Adicionar a etapa de confirmação ao fluxo de detecção. Após `detect.sh` retornar um resultado (com confiança alta ou média), mostrar ao usuário e pedir confirmação.

### Fluxo

```
🔍 Projeto detectado: ../meu-projeto
  ├── Tipo: backend-api
  ├── Linguagem: TypeScript
  ├── Framework: NestJS v10
  └── Confiança: alta

📋 Confirma a detecção? [Y/n]
```

- Se `Y` (ou Enter): prossegue com o tipo detectado
- Se `n`: chama o fallback manual (FH-102)
- Se confiança for `medium` (ex: só `package.json` sem framework): mostrar `Confiança: média` e já perguntar se quer confirmar ou revisar

### Integração

Este slice depende do FH-101 (motor) e FH-103 (fallback). Quando integrado, o fluxo fica:

```
detect.sh → confirmação → [ok] → próximo passo
                         → [n] → fallback manual → próximo passo
```

## Acceptance criteria

- [ ] Confirmação "Detectei X. Confirma? [Y/n]" após detecção
- [ ] Enter = Y (default)
- [ ] Se não, chama fallback manual (FH-102)
- [ ] Confiança "média" exibe aviso adicional

## Blocked by

- FH-101
- FH-102
