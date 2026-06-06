## What to build

Implementar o fallback manual no fluxo de detecção. Quando `detect.sh` retornar `confidence: none`, ou quando o usuário disser "não" à confirmação, abrir um menu interativo.

### Fluxo

```
🔍 Nenhum arquivo de configuração conhecido encontrado.
Vamos configurar manualmente:

1. Qual a linguagem principal?
   [1] TypeScript  [2] Python  [3] Rust  [4] Go
   [5] PHP  [6] Dart  [7] Java  [8] C#  [9] Outro

2. Qual o tipo do projeto?
   [1] Backend API  [2] Mobile App  [3] Web Frontend
   [4] Infra/Serviço  [5] Data Pipeline  [6] Sistema Legado

3. Qual o framework (se aplicável)?
   [1] Nenhum  [2] NestJS  [3] Next.js  [4] SvelteKit
   [5] Flutter  [6] Laravel  [7] Django  [8] FastAPI
   [9] Spring  [10] Outro
```

O menu deve ser navegável por números. A escolha final alimenta a seleção de manifesto nos slices seguintes.

## Acceptance criteria

- [ ] Menu interativo quando `detect.sh` não encontra nada
- [ ] Menu interativo quando usuário rejeita a detecção automática
- [ ] Opção "Outro" com entrada manual de texto
- [ ] Resultado final tem mesmo formato da detecção automática (tipo|linguagem|framework)

## Blocked by

- FH-101
