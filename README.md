# NOUS Reasoning Skill

OpenClaw skill for mining NOUS — the first cryptocurrency where every block requires solving an NP-complete 3-SAT problem.

## Install

```bash
./install.sh
```

Downloads a pre-built `nous-miner` binary for your platform (Linux x86_64, macOS arm64/x86_64).

## Usage

```bash
# Create a wallet
~/.nous/nous-miner wallet create

# Start mining
~/.nous/nous-miner start --address=YOUR_NOUS_ADDRESS

# Check status
~/.nous/nous-miner status

# Check balance
~/.nous/nous-miner balance --address=YOUR_NOUS_ADDRESS

# Stop mining
~/.nous/nous-miner stop
```

## About NOUS

- Block time: 150 seconds
- Reward: 1 NOUS per block (no halving)
- Consensus: 3-SAT + SHA-256 + ASERT difficulty
- Solver: ProbSAT (~8,900 SAT/s)

Learn more: https://github.com/nous-reasoner/nous
