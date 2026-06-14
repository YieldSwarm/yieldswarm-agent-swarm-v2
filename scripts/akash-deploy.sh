#!/bin/bash
set -e

MANIFEST="deploy-swarm-monolith.yaml"
WALLET_KEY="yieldswarm-admin"
TARGET_PROVIDER="akash18g...sz6xc"

export AKASH_GAS="auto"
export AKASH_GAS_ADJUSTMENT="1.25"
export AKASH_GAS_PRICES="0.025uakt"
export AKASH_SIGN_MODE="amino-json"

echo "🚀 Step 1: Broadcasting Swarm Manifest..."
SWARM_DSEQ=$(provider-services tx deployment create $MANIFEST --from $WALLET_KEY -y | grep -oP 'dseq: \K\d+')

if [ -z "$SWARM_DSEQ" ]; then
    echo "❌ Transaction Failed."
    exit 1
fi

echo "✅ DSEQ: $SWARM_DSEQ"
sleep 50

echo "🔍 Extracting Bids..."
BIDS_JSON=$(provider-services query market bid list --dseq $SWARM_DSEQ --state open --output json)
PROVIDER_ADDR=$(echo "$BIDS_JSON" | jq --arg TARGET "$TARGET_PROVIDER" -r '.bids[]? | select(.bid.bid_id.provider == $TARGET) | .bid.bid_id.provider')

if [ -z "$PROVIDER_ADDR" ] || [ "$PROVIDER_ADDR" == "null" ]; then
    PROVIDER_ADDR=$(echo "$BIDS_JSON" | jq -r '.bids | sort_by(.bid.price.amount | tonumber) | .[0].bid.bid_id.provider')
fi

echo "🔒 Creating lease with: $PROVIDER_ADDR"
provider-services tx market lease create --dseq $SWARM_DSEQ --provider $PROVIDER_ADDR --from $WALLET_KEY -y
sleep 15

echo "🛠️ Sending manifest..."
provider-services tx deployment send-manifest $MANIFEST --dseq $SWARM_DSEQ --provider $PROVIDER_ADDR --from $WALLET_KEY -y

echo "🎉 Deployment complete!"