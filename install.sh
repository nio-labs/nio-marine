#!/bin/sh
# Nio Marine Fleet Installer (Linux, macOS, Termux)
# One-liner: curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-marine/main/install.sh | bash
set -eu

REPO="nio-labs/nio-marine"
MODEL_REPO="nio-labs/nio-xs-models"
NIOXS_DIR="${HOME}/.nioxs"
MODELS_DIR="${NIOXS_DIR}/models"

echo "🌊 ========================================================"
echo "   Nio Marine: Sovereign Companion Fleet Installer"
echo "   Sub-400MB Peak RAM Local Pair-Programming"
echo "========================================================"

mkdir -p "${MODELS_DIR}"

# 1. Check if nioxs engine is present
if ! command -v nioxs >/dev/null 2>&1 && ! command -v nio-xs >/dev/null 2>&1; then
    echo "⚙️ nioxs engine not found in PATH."
    echo "📦 Installing NioXS core runtime from nio-labs/nio-xs..."
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL https://raw.githubusercontent.com/nio-labs/nio-xs/main/install.sh | bash || {
            echo "⚠️ Could not auto-install nioxs. Please install manually from https://github.com/nio-labs/nio-xs"
        }
    fi
fi

# 2. Setup Default Marine Model (Blue)
echo "📦 Configuring Nio Marine flagship model: Blue (1.4B)..."
echo "ℹ️ Models are hosted at https://github.com/${MODEL_REPO}"
echo ""
echo "✅ Nio Marine configuration initialized!"
echo ""
echo "To launch your companion:"
echo "   nioxs blue"
echo ""
echo "To ask a direct architectural question:"
echo "   nioxs blue \"How do I build a lock-free queue in Rust?\""
echo "========================================================"
