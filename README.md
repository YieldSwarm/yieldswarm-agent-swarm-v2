# YieldSwarm v2.0 — Agent Swarm OS + Multi-Cloud DePIN Yield Infrastructure

**Status**: Active Development | Real Infrastructure Shipping

YieldSwarm is building the autonomous yield layer for DePIN + AI agents across Akash, HashiCorp, Azure, GCP, Vast.ai and RunPod.

## Current Focus (v2.0)

- Multi-cloud GPU worker deployment (Akash first)
- Ollama-powered inference swarm
- Next.js Arena frontend with live telemetry
- HashiCorp Packer + Terraform foundation
- GitHub Actions CI/CD

## Repository Structure

```
yieldswarm-agent-swarm-v2/
├── deploy/                    # Akash SDL + Docker + entrypoint
├── infra/
│   ├── packer/               # Golden image builds
│   ├── terraform/            # Multi-cloud provisioning
│   └── boundary/             # Secure access
├── apps/
│   └── arena/                # Next.js frontend (Vercel)
├── agents/                    # Runtime + telemetry
├── .github/workflows/         # CI/CD
└── README.md
```

## Quick Start (Akash)

See `deploy/README.md` for full instructions.

## Active Repos

- This repo (v2.0 core)
- v2.0 (previous frontend experiments)
- v1.0 (legacy)

We are consolidating into this mono-repo for v2.0 and beyond.