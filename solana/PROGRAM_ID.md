# Program ID - Wyjaśnienie

## Co to jest Program ID?

**Program ID** to unikalny identyfikator (adres publiczny) Twojego programu Solana. Jest to 32-bajtowy klucz publiczny zapisany w formacie base58 (44 znaki).

## Skąd się wzięło to ID?

### Historia tego konkretnego ID:

1. **Podczas inicjalizacji projektu** (gdy Anchor CLI nie był dostępny), wygenerowałem Program ID używając Node.js:
   ```javascript
   const { Keypair } = require('@solana/web3.js');
   const kp = Keypair.generate();
   console.log(kp.publicKey.toBase58());
   // Wynik: Hp8S9gQjhCVctpLA2tbcDN59Gqc4Vr9xKbJSFWuqa2C6
   ```

2. **To ID zostało użyte w:**
   - `programs/hangman/src/lib.rs` - w `declare_id!()`
   - `Anchor.toml` - w sekcji `[programs.localnet]`

3. **Keypair został wygenerowany później** przez Anchor podczas `anchor build`:
   - Plik: `target/deploy/hangman-keypair.json`
   - Adres z tego keypair: `91kKNMwRfngRgNTPgcBsjbfamFQMiZo8iW9Gmkv3UE1S`

## Problem: ID nie pasuje do keypair!

**UWAGA:** Obecnie Program ID w kodzie (`Hp8S9gQjhCVctpLA2tbcDN59Gqc4Vr9xKbJSFWuqa2C6`) **nie pasuje** do adresu keypair (`91kKNMwRfngRfngRgNTPgcBsjbfamFQMiZo8iW9Gmkv3UE1S`).

## Jak to naprawić?

### Opcja 1: Synchronizacja z Anchor (ZALECANE)

Anchor może automatycznie wygenerować i zsynchronizować Program ID:

```bash
# Usuń stary keypair (jeśli istnieje)
rm target/deploy/hangman-keypair.json

# Wygeneruj nowy keypair i zsynchronizuj ID
anchor keys sync

# To zaktualizuje:
# - programs/hangman/src/lib.rs (declare_id!)
# - Anchor.toml (programs.localnet)
# - Wygeneruje target/deploy/hangman-keypair.json
```

### Opcja 2: Ręczna synchronizacja

Jeśli chcesz użyć istniejącego keypair:

```bash
# 1. Sprawdź adres z keypair
solana address -k target/deploy/hangman-keypair.json

# 2. Zaktualizuj lib.rs
# Zmień declare_id!("...") na adres z keypair

# 3. Zaktualizuj Anchor.toml
# Zmień programs.localnet.hangman na ten sam adres
```

## Jak działa Program ID?

1. **Podczas kompilacji:**
   - Anchor używa Program ID do generowania IDL
   - Program ID jest "wbudowany" w skompilowany program (.so)

2. **Podczas deploy:**
   - Program jest deployowany pod adresem określonym przez Program ID
   - Keypair (`hangman-keypair.json`) jest używany do podpisania transakcji deploy

3. **Po deploy:**
   - Program jest dostępny pod adresem Program ID
   - Klienci używają tego ID do wywoływania instrukcji programu

## Ważne zasady:

1. **Program ID MUSI być identyczny w:**
   - `lib.rs` (declare_id!)
   - `Anchor.toml` (programs.localnet)
   - Adres keypair (jeśli używasz keypair)

2. **Nie zmieniaj Program ID po deploy:**
   - Jeśli już zdeployowałeś program, zmiana ID wymaga redeploy
   - Stary program pozostanie pod starym adresem

3. **Dla nowych projektów:**
   - Użyj `anchor init` - automatycznie wygeneruje wszystko poprawnie
   - Lub użyj `anchor keys sync` do synchronizacji

## Sprawdzenie aktualnego stanu:

```bash
# Sprawdź Program ID w kodzie
grep "declare_id" programs/hangman/src/lib.rs

# Sprawdź Program ID w Anchor.toml
grep "hangman = " Anchor.toml

# Sprawdź adres keypair
solana address -k target/deploy/hangman-keypair.json

# Wszystkie trzy powinny być identyczne!
```

