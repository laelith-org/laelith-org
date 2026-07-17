#!/usr/bin/env bash

#------------------------------------------------------------------------------
# Builds this Hugo site on Render, pinning the exact Hugo version via the
# HUGO_VERSION env var set in render.yaml (Render has no native way to pick
# a Hugo version otherwise).
#------------------------------------------------------------------------------

set -euo pipefail

build_temp_dir=$(mktemp -d)
trap 'rm -rf "${build_temp_dir}"' EXIT

echo "Installing Hugo ${HUGO_VERSION}..."
curl -sfL --output-dir "${build_temp_dir}" -O "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
mkdir -p "${HOME}/.local/hugo"
tar -C "${HOME}/.local/hugo" -xf "${build_temp_dir}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"

HUGO_BIN="${HOME}/.local/hugo/hugo"

echo "Hugo: $("${HUGO_BIN}" version)"

"${HUGO_BIN}" --gc --minify
