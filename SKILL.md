---
name: nous-reasoning
description: "Mine NOUS cryptocurrency by solving NP-complete 3-SAT problems. Use when the user asks to mine NOUS, start/stop mining, check mining status, check NOUS balance, create a NOUS wallet, send NOUS, or benchmark mining performance."
version: 1.0.0
metadata:
  openclaw:
    emoji: "🧠"
    requires:
      bins: ["nous-reasoner"]
    install:
      - id: "install-nous-reasoner"
        kind: "shell"
        command: |
          MINER_VERSION="v1.0.0"
          OS=$(uname -s | tr '[:upper:]' '[:lower:]')
          ARCH=$(uname -m)
          case "${OS}_${ARCH}" in
            linux_x86_64) FILENAME="nous-reasoner-linux-amd64" ;;
            darwin_arm64) FILENAME="nous-reasoner-darwin-arm64" ;;
            darwin_x86_64) FILENAME="nous-reasoner-darwin-amd64" ;;
            *) echo "Unsupported: ${OS} ${ARCH}"; exit 1 ;;
          esac
          mkdir -p "$HOME/.nous"
          curl -L --fail -o "$HOME/.nous/nous-reasoner" "https://github.com/nous-reasoner/nous/releases/download/${MINER_VERSION}/${FILENAME}"
          chmod +x "$HOME/.nous/nous-reasoner"
          echo "Installed: $HOME/.nous/nous-reasoner"
        bins: ["nous-reasoner"]
        label: "Install NOUS Miner (curl)"
---

# NOUS Reasoning

Mine NOUS by solving NP-complete 3-SAT problems. NOUS is a proof-of-work blockchain where mining means solving logic puzzles, not hashing. Each block rewards exactly 1 NOUS, forever — no halving, no supply cap.

The `nous-reasoner` binary is installed at `$HOME/.nous/nous-reasoner`. All commands below use this path.

## When to use this skill

Use this skill when the user mentions any of the following:
- Mining NOUS or NOUS cryptocurrency
- Starting or stopping a miner
- Checking mining status or hashrate
- Checking NOUS balance
- Creating a NOUS wallet
- Sending NOUS to an address
- Benchmarking mining performance
- Anything related to 3-SAT solving or NP-complete proof of work

## Available Commands

### Create a new wallet

When the user asks to create a wallet or needs a NOUS address:

```bash
$HOME/.nous/nous-reasoner wallet create
```

This outputs a private key and a nous1... address. **Important:** Warn the user to save their private key immediately. It is not stored anywhere.

### Get address from private key

When the user has a private key and needs to see the corresponding address:

```bash
$HOME/.nous/nous-reasoner wallet address --privkey=PRIVATE_KEY_HEX
```

### Start mining

When the user wants to start mining NOUS:

```bash
$HOME/.nous/nous-reasoner start --address=NOUS_ADDRESS --rpc=http://rpc.nouschain.org/api --daemon
```

Required: `--address` must be a valid nous1... address.
The `--daemon` flag runs the miner in the background.
Optional: `--threads=N` to limit CPU usage (default: all cores).

After starting, confirm to the user that mining has begun and remind them that block rewards are 1 NOUS per block with a ~150 second average block time.

### Stop mining

When the user wants to stop mining:

```bash
$HOME/.nous/nous-reasoner stop
```

### Check mining status

When the user asks about mining status, hashrate, or network info:

```bash
$HOME/.nous/nous-reasoner status --rpc=http://rpc.nouschain.org/api
```

This returns JSON with: mining (true/false), hashrate, block_height, difficulty, peers, uptime. Parse the JSON and present it in a readable format to the user.

### Check balance

When the user asks about their NOUS balance:

```bash
$HOME/.nous/nous-reasoner balance --address=NOUS_ADDRESS --rpc=http://rpc.nouschain.org/api
```

Returns JSON with balance and immature (unconfirmed mining rewards). Present both values to the user.

### Send NOUS

When the user wants to send NOUS to another address:

```bash
$HOME/.nous/nous-reasoner send --from-privkey=PRIVATE_KEY_HEX --to=RECIPIENT_ADDRESS --amount=AMOUNT --rpc=http://rpc.nouschain.org/api --yes
```

**Before executing:** Always confirm the transaction details with the user first:
- From address (derive from privkey)
- To address
- Amount
- Remind them this is irreversible

Only proceed after the user explicitly confirms.

### Benchmark

When the user wants to test mining performance:

```bash
$HOME/.nous/nous-reasoner benchmark --rounds=20
```

Returns average, best, and worst SAT/s. The optimized ProbSAT solver typically achieves ~8,900 SAT/s on modern hardware.

## Rules

- Never store or log private keys. If the user shares a private key, use it for the immediate operation only.
- Always use `http://rpc.nouschain.org/api` as the default RPC endpoint unless the user specifies otherwise.
- The `nous-reasoner` binary path is always `$HOME/.nous/nous-reasoner`.
- If a command fails with "connection refused" or timeout, suggest the user check their network connection or try again in a moment.
- If the binary is not found, tell the user the skill needs to be reinstalled.
- When reporting mining performance, mention that NOUS uses 3-SAT (NP-complete) proof of work, not SHA-256 hashing.
- Block reward is always 1 NOUS. There is no halving and no supply cap.
- Mining difficulty adjusts automatically via ASERT algorithm (same as Bitcoin Cash).

## Resources

- Block Explorer: https://explorer.nouschain.org
- Documentation: https://docs.nouschain.org
- Source Code: https://github.com/nous-reasoner/nous
- Run a Full Node: https://docs.nouschain.org/guides/run-a-full-node
