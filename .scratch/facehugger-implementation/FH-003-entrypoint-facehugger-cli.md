## What to build

Criar o entrypoint CLI `facehugger` na raiz do repositório — um script bash executável.

### Comportamento inicial

```bash
./facehugger --help
# 🎭 Facehugger v0.1.0
# Uso: ./facehugger catch <caminho-do-projeto> [opções]
#
# Opções:
#   catch <path>        Configura um projeto alvo
#   --help, -h          Mostra esta ajuda
#   --version, -v       Mostra a versão
#   --dry-run           Mostra o que seria gerado sem escrever
#   --config <nome>     Usa um perfil de config específico

./facehugger catch ../meu-projeto
# 🎭 Facehugger acoplando...
# 🔍 Detectando ../meu-projeto...
```

### Estrutura do script

- `set -euo pipefail`
- `FACEHUGGER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"` — resolve path absoluto
- Funções: `show_help()`, `show_version()`, `detect_project()`, `catch()`
- Por enquanto, `catch()` chama os módulos em `core/` (que serão implementados nos slices seguintes)

### Saída esperada nesse slice

O comando `./facehugger catch <path>` deve:
1. Mostrar o banner 🎭
2. Verificar que o path alvo existe
3. Mostrar "Modo catch: [modo]" (lendo de `core/configs/default.yaml`)
4. Sair com "Motor de detecção: não implementado ainda"

## Acceptance criteria

- [ ] `./facehugger --help` mostra ajuda formatada
- [ ] `./facehugger --version` mostra versão
- [ ] `./facehugger --dry-run catch <path>` mostra o que faria sem escrever
- [ ] `./facehugger catch <path>` valida path e lê config padrão
- [ ] `./facehugger` sem argumentos mostra help
- [ ] Script é executável (`chmod +x`)

## Blocked by

- FH-001
