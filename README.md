# NOUS Reasoning Skill for OpenClaw

Mine NOUS by solving NP-complete 3-SAT problems. An AI agent's first job.

## What is NOUS?

NOUS is a proof-of-work blockchain where mining = solving logic puzzles (3-SAT), not hashing. Each block rewards exactly 1 NOUS, forever.

## Install

Paste this in your OpenClaw chat:

> Install this skill: https://github.com/nous-reasoner/nous-reasoning-skill

Or manually:

```bash
mkdir -p ~/.openclaw/skills
cd ~/.openclaw/skills
git clone https://github.com/nous-reasoner/nous-reasoning-skill.git nous-reasoning
```

## Usage

Talk to your OpenClaw agent:

- "Create a NOUS wallet"
- "Start mining NOUS to nous1qxxx..."
- "How's my mining going?"
- "What's my NOUS balance?"
- "Send 5 NOUS to nous1qyyy..."
- "Benchmark my mining speed"

## Performance

Optimized ProbSAT solver: ~8,900 SAT/s on modern hardware.
Pluggable solver interface for advanced users.

## Links

- Explorer: https://explorer.nouschain.org
- Docs: https://docs.nouschain.org
- Source: https://github.com/nous-reasoner/nous
