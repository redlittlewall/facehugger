#!/usr/bin/env bash
#
# 🎭 Facehugger — Atualiza todos os submodules
#
set -euo pipefail

FACEHUGGER_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$FACEHUGGER_DIR"

echo "📦 Atualizando submodules..."
git submodule update --remote --recursive --init

echo "✅ Submodules atualizados!"
echo ""
echo "  skills/mattpocock/       ← Matt Pocock"
echo "  vendor/agent-rules-books/ ← Regras de livros"
