#!/bin/bash
# YieldSwarm Akash Deployment Script - Run this in your GitHub Codespace terminal
# Wallet import and key operations MUST stay in your local/Codespace terminal only. Never paste mnemonics here.

set -e

MANIFEST="deploy/deploy-swarm-monolith.yaml"
WALLET="yieldswarm-admin"

# 1. Ensure provider-services is available (run once in Codespace)
if ! command -v provider-services &> /dev/null; then
  echo "Installing provider-services..."
  curl -sfL https://raw.githubusercontent.com/akash-network/node/master/install.sh | bash
  echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
  source ~/.bashrc
fi

provider-services version

# 2. Create deployment (you will be prompted for confirmation)
echo "Broadcasting manifest..."
DSEQ=$(provider-services tx deployment create $MANIFEST --from $WALLET --gas auto --fees 12000uakt -y | grep -oP 'dseq: \K\d+')

echo "DSEQ: $DSEQ"
echo "Waiting 45s for bids..."
sleep 45

# 3. Find best bid (filter for audited providers with GPU)
BEST_BID=$(provider-services query market bid list --dseq $DSEQ --state open --output json | jq -r '.bids | sort_by(.bid.price.amount | tonumber) | .[0]')
PROVIDER=$(echo $BEST_BID | jq -r '.bid.bid_id.provider')

if [ -z "$PROVIDER" ]; then
  echo "No bids found. Check credits and manifest."
  exit 1
fi

echo "Selected provider: $PROVIDER"

# 4. Create lease
provider-services tx market lease create --dseq $DSEQ --provider $PROVIDER --from $WALLET -y

sleep 15

# 5. Send manifest
echo "Sending manifest to provider..."
provider-services tx deployment send-manifest $MANIFEST --dseq $DSEQ --provider $PROVIDER --from $WALLET -y

echo "🎉 Deployment live. Check lease status with:"
echo "provider-services query market lease status --dseq $DSEQ --provider $PROVIDER --from $WALLET --output json | jq ."
