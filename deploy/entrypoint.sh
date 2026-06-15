#!/bin/bash
set -e

MODEL=${MODEL:-llama3.1:8b}

ollama serve &

sleep 5
ollama pull $MODEL || true

# Start telemetry server (simple)
python3 -m http.server 8080 --directory /app/telemetry || true

wait