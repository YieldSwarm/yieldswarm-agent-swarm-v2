#!/bin/bash
set -e

echo "🚀 Starting YieldSwarm GPU Worker..."

ollama serve &
sleep 10

echo "📥 Pre-loading models..."
ollama pull llama3.1:8b
ollama pull qwen2.5:7b

echo "✅ Models loaded. Starting telemetry..."

node /app/dist/telemetry-server.js &

exec node /app/dist/worker.js