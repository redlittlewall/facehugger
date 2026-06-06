## What to build

Implementar o motor de detecção de tipo de projeto em `core/detectors/`.

### `core/detectors/rules.yaml`
```yaml
detectors:
  - files: ["pubspec.yaml"]
    type: mobile-app
    language: Dart
    framework: Flutter
    confidence: high
  - files: ["package.json", "nest-cli.json"]
    type: backend-api
    language: TypeScript
    framework: NestJS
    confidence: high
  - files: ["package.json", "svelte.config.*"]
    type: web-frontend
    language: TypeScript
    framework: SvelteKit
    confidence: high
  - ... (completar com todos os da tabela)
```

### `core/detectors/detect.sh`
Script que:
1. Recebe um diretório alvo como argumento
2. Varre as regras em `rules.yaml` na ordem de especificidade
3. Retorna o tipo detectado + linguagem + framework + confiança
4. Se nada for encontrado, retorna `confidence: none`

### Saída esperada
```bash
./core/detectors/detect.sh /caminho/para/projeto
# → backend-api|TypeScript|NestJS|high
```

## Acceptance criteria

- [ ] `core/detectors/rules.yaml` com todas as regras da tabela de detecção
- [ ] `core/detectors/detect.sh` funcional
- [ ] Detecta corretamente: NestJS, Flutter, SvelteKit, Next.js, Rust, Go, PHP, NGINX
- [ ] Retorna `confidence: none` quando não encontra nada
- [ ] Fácil de adicionar novas regras (só editar rules.yaml)

## Blocked by

- FH-003 (entrypoint precisa chamar detect.sh)
