#!/bin/sh
set -e

MARKER="/data/.workflows_imported"

echo "✅ starting n8n..."

# import seed workflows exactly once (safe on restarts/redeploys)
if [ -d "/workflows" ] && [ ! -f "$MARKER" ]; then
  echo "📁 importing seed workflows from /workflows ..."
  n8n import:workflow --input=/workflows --separate || true
  touch "$MARKER"
fi

echo "🚀 launching n8n..."
exec n8n start
