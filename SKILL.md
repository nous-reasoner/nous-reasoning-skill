---
name: nous-reasoning
description: >
  Mine NOUS by solving NP-complete 3-SAT problems. Optimized ProbSAT solver
  at ~8,900 SAT/s. Cross-platform: Linux, macOS, Windows (WSL).
  No full node or Go compiler required — downloads pre-built binary.
metadata:
  openclaw:
    emoji: "🧠"
    install:
      - id: download-miner
        kind: shell
        command: ./install.sh
        bins: ["~/.nous/nous-miner"]
        label: "Download NOUS miner binary"
allowed-tools: Bash Read Write
---

# NOUS Reasoning Skill

Mine NOUS — the first cryptocurrency where every block requires
solving an NP-complete problem. No full node required; the miner
connects to a public RPC endpoint and solves 3-SAT formulas locally.

## What is NOUS

NOUS is a proof-of-work blockchain where mining = solving randomly
generated 3-SAT formulas. Instead of brute-force hashing (Bitcoin),
each block attempt requires genuine logical reasoning.

- Block time: 150 seconds
- Reward: 1 NOUS per block, forever (no halving)
- Consensus: Cogito Consensus (3-SAT + SHA-256 + ASERT difficulty)
- SAT parameters: 256 variables, 986 clauses (ratio 3.85)
- Solver: ProbSAT (optimized, ~8,900 SAT/s)

**Public RPC:** http://rpc.nouschain.org/api

## Setup

### Install

```bash
~/.nous/nous-miner version 2>/dev/null || ./install.sh
```

### Create a wallet

```bash
~/.nous/nous-miner wallet create
```

Save the private key — it is NOT stored anywhere.

## Commands

All commands output JSON by default (for agent parsing).

### Start mining

```bash
# Foreground (Ctrl+C to stop)
~/.nous/nous-miner start --address=nous1q...

# Background (daemon mode)
~/.nous/nous-miner start --address=nous1q... --daemon
```

### Stop mining

```bash
~/.nous/nous-miner stop
```

### Check status

```bash
~/.nous/nous-miner status
```

Returns JSON: `{"mining": true/false, "block_height": N, "difficulty": N, "peers": N}`

### Check balance

```bash
~/.nous/nous-miner balance --address=nous1q...
```

Returns JSON: `{"address": "...", "balance": "42.50000000", "unit": "NOUS"}`

### Derive address from private key

```bash
~/.nous/nous-miner wallet address --privkey=HEX
```

### Send NOUS

```bash
~/.nous/nous-miner send --from-privkey=HEX --to=nous1q... --amount=5.0
```

Agent usage (skip confirmation): add `--yes`

### Benchmark

```bash
~/.nous/nous-miner benchmark --rounds=50
```

### Version

```bash
~/.nous/nous-miner version
```

## Display Format

When reasoning starts, tell the user:

```
NOUS Reasoner started!
  Mode: RPC-based (no full node required)
  Each block attempt solves a 256-variable, 986-clause 3-SAT formula.
  Reward: 1 NOUS per block (150 second target).

  Say "check mining status" or "stop reasoning".
```

## Troubleshooting

- **Can't connect:** verify RPC is reachable: `curl -s http://rpc.nouschain.org/api -d '{"method":"getmininginfo","params":[],"id":1}'`
- **No blocks found:** normal with higher difficulty. Check status for SAT/s progress.
- **Daemon logs:** `tail -20 ~/.nous/miner.log`

## Safety

- Private keys are shown once at creation — save them securely.
- CPU-based solver, uses all cores by default (configurable with `--threads`).
- Coinbase maturity: mined coins require 100 confirmations before spending.
