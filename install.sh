#!/bin/bash
set -e

MINER_VERSION="v1.2.1"
INSTALL_DIR="$HOME/.nous"
MINER_BIN="$INSTALL_DIR/nous-miner"
GITHUB_BASE="https://github.com/nous-reasoner/nous/releases/download/${MINER_VERSION}"

echo "Installing NOUS Reasoning Skill ${MINER_VERSION}..."

OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

case "${OS}_${ARCH}" in
    linux_x86_64)
        FILENAME="nous-miner-linux-amd64"
        ;;
    darwin_arm64)
        FILENAME="nous-miner-darwin-arm64"
        ;;
    darwin_x86_64)
        FILENAME="nous-miner-darwin-amd64"
        ;;
    *)
        echo "Error: Unsupported platform: ${OS} ${ARCH}"
        echo "Supported: Linux x86_64, macOS arm64, macOS x86_64"
        echo "Windows users: download nous-miner-windows-amd64.exe from"
        echo "  ${GITHUB_BASE}/nous-miner-windows-amd64.exe"
        exit 1
        ;;
esac

mkdir -p "$INSTALL_DIR"

DOWNLOAD_URL="${GITHUB_BASE}/${FILENAME}"
echo "Downloading ${FILENAME}..."
curl -L --fail -o "$MINER_BIN" "$DOWNLOAD_URL"

if [ $? -ne 0 ]; then
    echo "Error: Download failed. Check your network and try again."
    exit 1
fi

chmod +x "$MINER_BIN"

echo ""
$MINER_BIN version
echo ""
echo "Installation complete: $MINER_BIN"
echo ""
echo "Quick start:"
echo "  # Create a wallet"
echo "  $MINER_BIN wallet create"
echo ""
echo "  # Start mining"
echo "  $MINER_BIN start --address=YOUR_NOUS_ADDRESS"
echo ""
echo "  # Check status"
echo "  $MINER_BIN status"
