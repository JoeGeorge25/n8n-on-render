#!/bin/sh
set -e

# Render gives $PORT; n8n must bind to it
: "${PORT:=5678}"
export N8N_PORT="$PORT"

# make sure /data is writable when a disk is mounted
if [ -d /data ]; then
  chown -R node:node /data || true
fi

# import any baked workflows
if [ -d /workflows ] && [ "$(ls -A /workflows 2>/dev/null)" ]; then
  echo "Importing workflows from /workflows…"
  n8n import:workflow --input=/workflows --separate || true
fi

echo "Starting n8n on port ${N8N_PORT}…"
exec n8n start
