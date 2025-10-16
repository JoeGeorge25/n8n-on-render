 #!/bin/sh
set -e

echo "Starting n8n with auto-import from /workflows..."

# Import any .json files if present (ignore if folder empty)
if [ -d "/workflows" ]; then
  n8n import:workflow --input=/workflows --separate || true
fi

# Start n8n
exec n8n start
