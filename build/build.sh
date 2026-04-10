#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

MANIFEST="${ROOT}/kit/manifest.txt"
TEMPLATE="${ROOT}/templates/pandoc/onboarding-kit.latex"
DIST="${ROOT}/dist"
MODULES="${DIST}/modules"

mkdir -p "$MODULES"

FILES=()
while IFS= read -r line || [[ -n "$line" ]]; do
  [[ "$line" =~ ^[[:space:]]*# ]] && continue
  [[ -z "${line// }" ]] && continue
  FILES+=("$line")
done < "$MANIFEST"

if [[ ${#FILES[@]} -eq 0 ]]; then
  echo "No markdown files listed in kit/manifest.txt" >&2
  exit 1
fi

for rel in "${FILES[@]}"; do
  if [[ ! -f "$ROOT/$rel" ]]; then
    echo "Missing file from manifest: $rel" >&2
    exit 1
  fi
done

PANDOC_BASE=(
  pandoc
  --from markdown+yaml_metadata_block+raw_tex
  --pdf-engine=xelatex
  --template="$TEMPLATE"
  --resource-path="$ROOT:$ROOT/kit/markdown:$ROOT/assets"
  -V geometry:margin=2.2cm
)

idx=0
for rel in "${FILES[@]}"; do
  idx=$((idx + 1))
  base="$(basename "$rel" .md)"
  padded=$(printf '%02d-%s' "$idx" "$base")
  out="${MODULES}/${padded}.pdf"
  echo "Building module: $rel -> $out"
  "${PANDOC_BASE[@]}" "$ROOT/$rel" -o "$out"
done

COMBINED="${DIST}/onboarding-kit-complete.pdf"
echo "Building combined bundle -> $COMBINED"
INPUTS=()
for rel in "${FILES[@]}"; do
  INPUTS+=("$ROOT/$rel")
done
"${PANDOC_BASE[@]}" "${INPUTS[@]}" -o "$COMBINED"

echo "Done."
