# Struktura projektu Anchor

## Dlaczego są 2 pliki Cargo.toml?

To jest **standardowa i poprawna** struktura dla projektów Anchor. Oba pliki mają różne role:

### 1. `Cargo.toml` (w głównym katalogu)
**Rola:** Workspace Cargo.toml - zarządza całym workspace Rust

```toml
[workspace]
members = [
    "programs/*"  # Wszystkie programy w katalogu programs/
]
```

**Zawiera:**
- Definicję workspace Rust
- Wspólne profile kompilacji (release, debug)
- Listę wszystkich programów w projekcie

### 2. `programs/hangman/Cargo.toml`
**Rola:** Konfiguracja konkretnego programu Solana

**Zawiera:**
- Metadane pakietu (nazwa, wersja)
- Zależności programu (anchor-lang, anchor-spl)
- Features (funkcje) programu
- Typ biblioteki (cdylib, lib)

## Pełna struktura projektu Anchor

```
smart-contracts/
├── Anchor.toml              # Konfiguracja Anchor (klaster, programy, testy)
├── Cargo.toml              # Workspace Cargo.toml (zarządza wszystkimi programami)
├── Cargo.lock              # Zablokowane wersje zależności (generowane automatycznie)
├── package.json            # Zależności Node.js dla testów
├── tsconfig.json           # Konfiguracja TypeScript
├── programs/               # Katalog z programami Solana
│   └── hangman/
│       ├── Cargo.toml      # Cargo.toml dla programu hangman
│       └── src/
│           └── lib.rs      # Kod źródłowy programu
├── tests/                  # Testy TypeScript
│   └── hangman.ts
└── target/                 # Pliki skompilowane (generowane automatycznie)
    ├── deploy/             # Skompilowane programy (.so)
    ├── idl/                # IDL (Interface Definition Language)
    └── types/              # Typy TypeScript wygenerowane z IDL
```

## Analogia

Możesz myśleć o tym jak o:
- **Workspace Cargo.toml** = `package.json` w monorepo (zarządza wszystkimi pakietami)
- **Program Cargo.toml** = `package.json` w konkretnym pakiecie

## Dodawanie nowych programów

Jeśli chcesz dodać nowy program:

1. Utwórz katalog: `programs/moj-program/`
2. Dodaj `Cargo.toml` w tym katalogu
3. Dodaj kod w `programs/moj-program/src/lib.rs`
4. Workspace automatycznie go wykryje (dzięki `programs/*` w głównym Cargo.toml)

## Ważne

- **NIE USUWAJ** żadnego z plików Cargo.toml - oba są potrzebne!
- Główny Cargo.toml zarządza workspace
- Cargo.toml w programs/ definiuje konkretny program
- To jest standardowa struktura Anchor - nie zmieniaj jej

