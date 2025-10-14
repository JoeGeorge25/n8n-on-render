#!/usr/bin/env bash
set -euo pipefail

# Render provides $PORT; n8n defaults to 5678
export N8N_PORT=${PORT:-5678}

echo "Importing workflows from /workflows (if any)…"
n8n import:workflow --input=/workflows --separate || true

echo "Starting n8n on port ${N8N_PORT}…"
exec n8n start
