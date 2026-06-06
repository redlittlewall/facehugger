#!/usr/bin/env bash
#
# 🎭 Facehugger — Motor de Detecção
#
# Uso: ./detect.sh <caminho-do-projeto>
# Retorna: tipo|linguagem|framework|confianca
# Exemplo: backend-api|TypeScript|NestJS|high
#
# Se não detectar: none|||none

set -euo pipefail

TARGET_DIR="$1"
DETECTOR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RULES_FILE="$DETECTOR_DIR/rules.yaml"

if [ ! -d "$TARGET_DIR" ]; then
  echo "none|||none"
  exit 1
fi

# Detecta um arquivo no diretório alvo (maxdepth 1)
detect_file() {
  local pattern="$1"
  if [[ "$pattern" == *\** ]]; then
    find "$TARGET_DIR" -maxdepth 1 -type f -name "$pattern" 2>/dev/null | head -1 || true
  else
    test -f "$TARGET_DIR/$pattern" && echo "$TARGET_DIR/$pattern" || true
  fi
}

# Extrai patterns de arquivo de uma linha como:   - files: ["a.json", "b.yaml"]
extract_file_patterns() {
  local line="$1"
  # Remove tudo antes de [ e depois de ]
  local inside="${line#*\[}"
  inside="${inside%\]*}"
  # Split por vírgula e limpa
  local IFS=','
  for item in $inside; do
    # Remove aspas e espaços
    item="${item//\"/}"
    item="${item//\'/}"
    item="${item## }"
    item="${item%% }"
    [ -n "$item" ] && echo "$item"
  done
}

# Lê as regras do YAML e testa cada uma
state="idle"
current_type=""
current_lang=""
current_framework=""
current_confidence=""

while IFS= read -r line; do
  # Detecta início de um detector:   - files: [...]
  if [[ "$line" =~ ^[[:space:]]*-[[:space:]]files: ]]; then
    # Se já estávamos acumulando um detector, testa ele
    if [ "$state" = "accumulating" ]; then
      # Pula — não encontrou todos os arquivos
      state="idle"
    fi

    # Extrai os patterns de arquivo desta linha
    all_found=true
    while IFS= read -r pattern; do
      result=$(detect_file "$pattern")
      if [ -z "$result" ]; then
        all_found=false
      fi
    done < <(extract_file_patterns "$line")

    if [ "$all_found" = true ]; then
      state="accumulating"
    else
      state="idle"
    fi
    continue
  fi

  # Se estamos acumulando (todos os arquivos foram encontrados), lê metadados
  if [ "$state" = "accumulating" ]; then
    if [[ "$line" =~ ^[[:space:]]*type:[[:space:]](.+) ]]; then
      current_type="${BASH_REMATCH[1]}"
    elif [[ "$line" =~ ^[[:space:]]*language:[[:space:]](.+) ]]; then
      current_lang="${BASH_REMATCH[1]}"
      [ "$current_lang" = '""' ] && current_lang=""
    elif [[ "$line" =~ ^[[:space:]]*framework:[[:space:]](.+) ]]; then
      current_framework="${BASH_REMATCH[1]}"
      current_framework="${current_framework//\"/}"
      current_framework="${current_framework//\'/}"
    elif [[ "$line" =~ ^[[:space:]]*confidence:[[:space:]](.+) ]]; then
      current_confidence="${BASH_REMATCH[1]}"
      # Se temos confiança, o detector está completo — output!
      if [ -n "$current_type" ] && [ -n "$current_confidence" ]; then
        echo "${current_type}|${current_lang}|${current_framework}|${current_confidence}"
        exit 0
      fi
    fi
  fi
done < "$RULES_FILE"

echo "none|||none"
