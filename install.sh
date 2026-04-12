#!/usr/bin/env bash
set -euo pipefail

REPO="lucianfialho/paper7"
INSTALL_DIR="${HOME}/.local/bin"
BIN_NAME="paper7"

echo "Installing paper7..."

mkdir -p "$INSTALL_DIR"

curl -sL "https://raw.githubusercontent.com/${REPO}/main/paper7.sh" -o "${INSTALL_DIR}/${BIN_NAME}"
chmod +x "${INSTALL_DIR}/${BIN_NAME}"

# Check if ~/.local/bin is in PATH
if ! echo "$PATH" | grep -q "${INSTALL_DIR}"; then
  echo ""
  echo "Add ~/.local/bin to your PATH:"
  echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc"
  echo ""
fi

echo "paper7 installed to ${INSTALL_DIR}/${BIN_NAME}"
echo "Run: paper7 search \"attention mechanism\""
