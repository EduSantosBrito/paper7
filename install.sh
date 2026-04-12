#!/usr/bin/env bash
set -euo pipefail

REPO="lucianfialho/paper7"
INSTALL_DIR="/usr/local/bin"
BIN_NAME="paper7"

echo "Installing paper7..."

# Download
curl -sL "https://raw.githubusercontent.com/${REPO}/main/paper7.sh" -o "/tmp/${BIN_NAME}"
chmod +x "/tmp/${BIN_NAME}"

# Install (may need sudo)
if [ -w "$INSTALL_DIR" ]; then
  mv "/tmp/${BIN_NAME}" "${INSTALL_DIR}/${BIN_NAME}"
else
  sudo mv "/tmp/${BIN_NAME}" "${INSTALL_DIR}/${BIN_NAME}"
fi

echo "paper7 installed to ${INSTALL_DIR}/${BIN_NAME}"
echo "Run: paper7 search \"attention mechanism\""
