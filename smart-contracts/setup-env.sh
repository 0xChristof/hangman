#!/bin/bash
# Skrypt do konfiguracji środowiska dla projektu Hangman Solana

echo "Konfiguracja środowiska dla projektu Hangman..."

# Ładowanie Cargo
if [ -f "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
    echo "✓ Cargo załadowany"
else
    echo "⚠ Cargo nie znaleziony. Zainstaluj Rust: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
fi

# Dodanie Anchor do PATH
if [ -d "$HOME/.avm/bin" ]; then
    export PATH="$HOME/.avm/bin:$PATH"
    echo "✓ Anchor dodany do PATH"
else
    echo "⚠ Anchor nie znaleziony. Zainstaluj: cargo install --git https://github.com/coral-xyz/anchor avm --locked --force && avm install latest"
fi

# Dodanie Solana CLI do PATH
if [ -d "$HOME/.local/share/solana/install/active_release/bin" ]; then
    export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
    echo "✓ Solana CLI dodany do PATH"
else
    echo "⚠ Solana CLI nie znaleziony. Zainstaluj: sh -c \"\$(curl -sSfL https://release.solana.com/stable/install)\""
fi

echo ""
echo "Sprawdzanie dostępności narzędzi:"
echo "================================"

if command -v cargo &> /dev/null; then
    echo "✓ Cargo: $(cargo --version)"
else
    echo "✗ Cargo: nie znaleziony"
fi

if command -v anchor &> /dev/null; then
    echo "✓ Anchor: $(anchor --version)"
else
    echo "✗ Anchor: nie znaleziony"
fi

if command -v solana &> /dev/null; then
    echo "✓ Solana CLI: $(solana --version)"
else
    echo "✗ Solana CLI: nie znaleziony"
fi

echo ""
echo "Aby używać tych ustawień w bieżącej sesji, uruchom:"
echo "  source setup-env.sh"
echo ""
echo "Aby dodać do ~/.zshrc (trwałe):"
echo "  echo 'source $(pwd)/setup-env.sh' >> ~/.zshrc"

