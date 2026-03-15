---
name: nous-reasoning
description: "Solve NP-complete 3-SAT problems on the NOUS network and earn NOUS tokens as reward. Use when the user asks about NOUS reasoning, solving SAT problems, checking solver status, or managing NOUS addresses."
version: 1.0.0
metadata:
  openclaw:
    emoji: "🧠"
---

# NOUS Reasoning

Solve NP-complete 3-SAT problems on the NOUS decentralized reasoning network. The network rewards solvers with NOUS tokens for each successfully solved problem set.

The solver binary is called `nous-reasoner`. It should be located at `$HOME/.nous/nous-reasoner` (Linux/macOS) or `%USERPROFILE%\.nous\nous-reasoner.exe` (Windows).

## Setup

Before using any command, check if the solver is installed:

```bash
$HOME/.nous/nous-reasoner version
```

If the binary is not found, install it:

**Linux x86_64:**
```bash
mkdir -p $HOME/.nous && curl -L -o $HOME/.nous/nous-reasoner https://github.com/nous-reasoner/nous/releases/download/nous-reasoner-v1.0.0/nous-reasoner-linux-amd64 && chmod +x $HOME/.nous/nous-reasoner
```

**macOS Apple Silicon:**
```bash
mkdir -p $HOME/.nous && curl -L -o $HOME/.nous/nous-reasoner https://github.com/nous-reasoner/nous/releases/download/nous-reasoner-v1.0.0/nous-reasoner-darwin-arm64 && chmod +x $HOME/.nous/nous-reasoner
```

**macOS Intel:**
```bash
mkdir -p $HOME/.nous && curl -L -o $HOME/.nous/nous-reasoner https://github.com/nous-reasoner/nous/releases/download/nous-reasoner-v1.0.0/nous-reasoner-darwin-amd64 && chmod +x $HOME/.nous/nous-reasoner
```

**Windows (PowerShell):**
```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.nous"; Invoke-WebRequest -Uri "https://github.com/nous-reasoner/nous/releases/download/nous-reasoner-v1.0.0/nous-reasoner-windows-amd64.exe" -OutFile "$env:USERPROFILE\.nous\nous-reasoner.exe"
```

## When to use this skill

Use this skill when the user mentions any of:
- NOUS reasoning or NOUS network
- Solving 3-SAT or NP-complete problems
- Starting or stopping a solver
- Checking solver status or performance
- Creating a NOUS address
- Checking NOUS balance
- Sending NOUS
- Benchmarking solver performance

## Commands

### Create a new address

```bash
$HOME/.nous/nous-reasoner wallet create
```

Outputs a private key and a nous1... address. **Warn the user to save their private key. It is not stored anywhere.**

### Start solving

```bash
$HOME/.nous/nous-reasoner start --address=NOUS_ADDRESS --rpc=http://rpc.nouschain.org/api --daemon
```

Optional: `--threads=N` to limit CPU cores.

### Stop solving

```bash
$HOME/.nous/nous-reasoner stop
```

### Check status

```bash
$HOME/.nous/nous-reasoner status --rpc=http://rpc.nouschain.org/api
```

Returns JSON with solving status, performance rate (SAT/s), network height, difficulty, and peers.

### Check balance

```bash
$HOME/.nous/nous-reasoner balance --address=NOUS_ADDRESS --rpc=http://rpc.nouschain.org/api
```

### Send NOUS

```bash
$HOME/.nous/nous-reasoner send --from-privkey=KEY --to=ADDRESS --amount=AMOUNT --rpc=http://rpc.nouschain.org/api --yes
```

Always confirm transaction details with the user before executing.

### Benchmark

```bash
$HOME/.nous/nous-reasoner benchmark --rounds=20
```

Typical performance: ~8,900 SAT/s on modern hardware.

## Rules

- Never store or log private keys
- Default RPC: http://rpc.nouschain.org/api
- Binary path: `$HOME/.nous/nous-reasoner` (Unix) or `%USERPROFILE%\.nous\nous-reasoner.exe` (Windows)
- If binary not found, guide the user through installation first
- Block reward is 1 NOUS per solved problem set, with ~150 second intervals

## Resources

- Explorer: https://explorer.nouschain.org
- Docs: https://docs.nouschain.org
- Source: https://github.com/nous-reasoner/nous
