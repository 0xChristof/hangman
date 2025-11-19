# Hangman Solana Smart Contract

## Wymagania wstępne

Przed kompilacją projektu musisz zainstalować:

### 1. Rust i Cargo
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

### 2. Solana CLI
```bash
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
```

Dodaj Solana do PATH:
```bash
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
```

### 3. Anchor Framework
```bash
cargo install --git https://github.com/coral-xyz/anchor avm --locked --force
avm install latest
avm use latest
```

Dodaj Anchor do PATH:
```bash
export PATH="$HOME/.avm/bin:$PATH"
```

**Uwaga:** Dodaj powyższe linie do `~/.zshrc` lub `~/.bashrc`, aby były dostępne w każdej sesji terminala.

### 4. Node.js i zależności
```bash
npm install
# lub
yarn install
```

## Kompilacja projektu

**WAŻNE:** Jeśli `anchor build` nie działa, wykonaj jedną z poniższych opcji:

### Opcja 1: Użyj skryptu setup-env.sh (tymczasowe dla bieżącej sesji)
```bash
source setup-env.sh
anchor build
```

### Opcja 2: Skonfiguruj PATH ręcznie (tymczasowe dla bieżącej sesji)
```bash
source "$HOME/.cargo/env"
export PATH="$HOME/.avm/bin:$PATH"
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
anchor build
```

### Opcja 3: Trwała konfiguracja (zalecane)
Konfiguracja została już dodana do `~/.zshrc`. Jeśli otworzysz **nowy terminal**, wszystko będzie działać automatycznie.

Jeśli nadal nie działa, uruchom:
```bash
source ~/.zshrc
anchor build
```

### Budowanie programu Solana:
```bash
anchor build
```

To polecenie:
- Kompiluje program Rust do pliku `.so`
- Generuje IDL (Interface Definition Language) w `target/idl/hangman.json`
- Generuje typy TypeScript w `target/types/hangman.ts`

### Uruchamianie testów:
```bash
anchor test
```

### Deploy na Devnet:
```bash
anchor deploy
```

## Struktura projektu

- `programs/hangman/src/lib.rs` - Kod programu Solana
- `tests/hangman.ts` - Testy TypeScript
- `Anchor.toml` - Konfiguracja Anchor
- `target/` - Pliki skompilowane (generowane automatycznie)

## Przydatne komendy

- `anchor build` - Kompilacja programu
- `anchor test` - Uruchomienie testów
- `anchor deploy` - Deploy na skonfigurowany klaster (domyślnie Devnet)
- `anchor keys list` - Lista programów i ich kluczy
- `solana config get` - Sprawdzenie konfiguracji Solana CLI

