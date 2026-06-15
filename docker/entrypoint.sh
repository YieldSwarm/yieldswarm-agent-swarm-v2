#!/bin/bash
set -e

echo "🚀 Starting Ollama serve in background..."
ollama serve &

sleep 8

echo "📅 Pre-pulling production models (llama3.1:8b + qwen2.5:7b)..."
ollama pull llama3.1:8b || true
ollama pull qwen2.5:7b || true

echo "🔥 Launching telemetry server and worker..."
node telemetry-server.js &
node worker.js

wait
