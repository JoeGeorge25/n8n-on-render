 #!/bin/sh
set -e

echo "✅ Starting n8n container..."

if [ -d "/workflows" ]; then
  echo "📁 Importing workflows..."
  n8n import:workflow --input=/workflows --separate || true
fi

echo "🚀 Launching n8n..."
exec n8n start
