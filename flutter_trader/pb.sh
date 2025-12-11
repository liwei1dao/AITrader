#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$ROOT_DIR/pb/proto"
OUT_DIR="$ROOT_DIR/lib/core/network/pb"
mkdir -p "$OUT_DIR"
export PATH="$HOME/.pub-cache/bin:$PATH"
if ! command -v protoc >/dev/null 2>&1; then echo "protoc not found"; exit 1; fi
if ! command -v protoc-gen-dart >/dev/null 2>&1; then
  if ! command -v dart >/dev/null 2>&1; then echo "dart not found"; exit 1; fi
  echo "Installing protoc_plugin..."
  dart pub global activate protoc_plugin
fi
find "$SRC_DIR" -name '*.proto' -print0 | xargs -0 protoc --dart_out="$OUT_DIR" -I="$SRC_DIR"
