#!/bin/sh
set -e

# Render provides $PORT; n8n must listen on it
: "${PORT:=5678}"
export N8N_PORT="$PORT"

# Import any baked workflows
if [ -d /workflows ] && [ "$(ls -A /workflows 2>/dev/null)" ]; then
  echo "Importing workflows from /workflows…"
  n8n import:workflow --input=/workflows --separate || true
fi

echo "Starting n8n on port ${N8N_PORT}…"
exec n8n start
