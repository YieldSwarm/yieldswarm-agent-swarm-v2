# YieldSwarm Deployment Guide (Akash + HashiCorp)

## 1. Prerequisites
- GitHub Codespace or local terminal with Docker
- Akash wallet funded with uAKT (for escrow + fees)
- Terraform Cloud account with organization "HelixChainProd" and workspace "Helixchainprod"

## 2. Akash Deployment (GPU Workers)

```bash
# In GitHub Codespace or terminal
chmod +x scripts/akash-deploy.sh
./scripts/akash-deploy.sh
```

This script will:
- Create the deployment from deploy/deploy-swarm-monolith.yaml
- Wait for bids
- Select best audited provider with RTX 3090
- Create lease
- Send manifest

After success, note the DSEQ and provider address. Check status:
```bash
provider-services query market lease status --dseq <DSEQ> --provider <PROVIDER> --output json | jq .
```

Get worker URLs:
```bash
provider-services query market lease status --dseq <DSEQ> --provider <PROVIDER> --output json | jq '.services.worker.uris'
```

Update `app/arena/page.tsx` with the real worker URLs so the frontend shows live telemetry.

## 3. HashiCorp / Terraform Cloud

1. Login to Terraform Cloud
2. Select organization "HelixChainProd" and workspace "Helixchainprod"
3. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill values
4. Run:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

This provisions multi-cloud resources (Azure VMSS, GCP instances, etc.) as defined in your Terraform config.

## 4. Building Images
GitHub Actions automatically builds and pushes to GHCR when you push to main.
You can also build locally:
```bash
docker build -f docker/Dockerfile.worker -t ghcr.io/yieldswarm/yieldswarm-worker:latest .
docker push ghcr.io/yieldswarm/yieldswarm-worker:latest
```

## 5. Frontend (Vercel)
Push to main triggers Vercel deploy if repo is connected to yieldswarm-v2.vercel.app project.

## Security Notes
- Never commit real private keys, mnemonics, or API tokens.
- Use Terraform Cloud variables or a secret manager for sensitive values.
- Wallet operations stay in your terminal/Codespace only.