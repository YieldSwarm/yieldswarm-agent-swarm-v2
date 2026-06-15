# CURSOR AGENT SWARM PROMPTS
**YieldSwarm Trident V3.0 → Layer 35 → Iteration 100**

Use these prompts with multiple Cursor Cloud Agents in parallel. Each prompt is self-contained and references the source-of-truth files already in the repo.

**How to use with 100 Cloud Agents**:
1. Open Cursor
2. Create new Cloud Agent (Codex 5.3 High or equivalent)
3. Paste one prompt per agent
4. Let them work in parallel on different parts of the stack
5. Merge their output into main

---

## 1. AKASH + DEPIN LAYER (GPU Workers)

**Prompt A1**:
Read deploy/deploy-swarm-monolith.yaml, docker/Dockerfile.worker, docker/entrypoint.sh, and scripts/akash-deploy.sh. Improve and harden the Akash SDL for production RTX 3090 clusters. Add resource requests for multiple replicas, proper placement attributes for audited providers with NVIDIA GPUs, persistent storage, and health checks. Also improve the Dockerfile with multi-stage build, proper CUDA runtime, and robust error handling in entrypoint.sh. Output the final production versions of these three files.

**Prompt A2**:
Create a robust Akash lease monitoring and auto-healing script. It should poll lease status every 60s, detect when workers go down, and automatically create new leases on the best available RTX 3090 provider if needed. Integrate with the existing akash-deploy.sh logic.

---

## 2. SMART CONTRACTS + TOKENOMICS

**Prompt B1**:
Read the tokenomics section in docs/YieldSwarm_v1_v2_Trident_Layer35_Blueprint.md. Create the production Solidity contract GreatDeltaEmissionRouter.sol with the dynamic Mandelbrot PoW reward formula, celestial multiplier, and hardened 50/30/15/5 zero-dust treasury splitter. Include events, access control via 2-of-3 multi-sig, and reorg protection. Also create the deployment script and Hardhat/Foundry config.

**Prompt B2**:
Build the on-chain 169 Deity Registry and 10,080 Agent Mutation Registry contracts. Each deity and mutated agent must have a soulbound identity, performance score, metal skin tier, and ZK-proof archival pointer. Include minting (Council-gated) and updating functions.

---

## 3. AGENT MESH + 10,080 MUTATED AGENTS

**Prompt C1**:
Create the full /agents directory structure with 169 Single-Origin Deity identity manifests (JSON) and the spawning/heartbeat/mutation engine. Use the Gospel coffee metaphor for tiered compute allocation. Implement the 420-second heartbeat and Council-gated wallet creation.

**Prompt C2**:
Build the agent mutation and Arena leaderboard system. Agents mutate based on performance. Top performers get metal skin upgrades. Include ZK-proof generation for pruned agents and the public leaderboard API that serves paginated results.

---

## 4. MULTI-CLOUD + HASHICORP

**Prompt D1**:
Create complete Terraform modules for multi-cloud fallback capacity (Azure VMSS, GCP, RunPod, Vultr). Include variables, outputs, and a root module that can be applied via Terraform Cloud workspace "Helixchainprod". Reference terraform.tfvars.example.

**Prompt D2**:
Build HashiCorp Packer templates that create golden images for the worker nodes across clouds. Include NVIDIA drivers, Ollama, Node.js, and the telemetry agent pre-installed.

---

## 5. FRONTEND + TELEMETRY (ARENA + PORTAL)

**Prompt E1**:
Completely rebuild app/arena/page.tsx into a production-grade live telemetry dashboard. It must poll real Akash worker URLs (injected via env), display VRAM, temperature, loaded models, agent count, and treasury velocity. Use the 80ms guardrail aesthetic and Gospel coffee visual language.

**Prompt E2**:
Build the full ValhallA portal + Universal Passport system. Include user onboarding, agent spawning interface, and connection to the 169 Deity Registry.

---

## 6. ORACLES + PRECESSIONAL CALENDAR

**Prompt F1**:
Implement the Precessional Aquarius Calendar Oracle. It pulls JPL HORIZONS data every 420 seconds and calculates the long-cycle axial precession multiplier for the reward formula. Expose it via API and smart contract oracle.

**Prompt F2**:
Build the Kaleidoscope Layer data particle accelerator that shards Mandelbrot block output into multi-rail vectors (Hydrogen, Helium, Lithium... up to Tree of Life reassembly).

---

## 7. AUTOMATION + CRONS + SECURITY

**Prompt G1**:
Create the full ATOMIC_PULSE self-audit system and YSLR Scanner that runs every 15 minutes on the HELIX chain. Include quantum-shielded logging and 14-Council cooperative decrypt dispatch.

**Prompt G2**:
Build the White Hat Security Swarm with post-quantum encryption, constant-time execution, replay protection, and SHIELD_AUDIT logging for every agent action.

---

## 8. ITERATION 100 SOVEREIGN STATE

**Prompt H1**:
Implement the final Iteration 100 sovereign self-governed loops: autonomous agent mutation, self-healing Akash leases, dynamic treasury rebalancing based on live APY, and the Great Delta Grid talent/compute marketplace. The system must be able to run with zero human intervention after initial deployment.

**Prompt H2**:
Create the final monitoring and $5M vault telemetry dashboard that aggregates real revenue from mining, DeFi vaults, Arena trading, bounties, and agent marketplace into one live view with compounding projections.

---

## MASTER COORDINATION PROMPT (Run this last or on a lead agent)

Read all the output from the other agents. Merge everything into a coherent mono-repo. Fix any conflicts, ensure the 80ms guardrail and 50/30/15/5 split are enforced everywhere, update the Arena frontend to use real worker URLs, and produce a final DEPLOY.md with the exact sequence of commands to go from zero to live Akash + multi-cloud deployment heading to $5M vault.

---

**Total Prompts in this pack: 18 high-value focused prompts** (you can duplicate and vary them across 100 Cloud Agents if desired). All prompts are designed to be run in parallel.