#!/usr/bin/env bash
set -e

# Ensure data dir exists (Render persistent disk will be mounted here)
mkdir -p /data

# Optional: auto-import any workflows in /workflows at boot.
# Controlled by env flags so you can turn it off/on without code changes.
if [ "${AUTO_IMPORT_WORKFLOWS:-true}" = "true" ] && [ -d "/workflows" ]; then
  echo "Auto-importing workflows from /workflows ..."
  # "--separate" expects individual JSON files; n8n will create/update as needed.
  # Use "--overwrite" cautiously (default false).
  OVERWRITE_FLAG=""
  if [ "${IMPORT_OVERWRITE:-false}" = "true" ]; then
    OVERWRITE_FLAG="--overwrite"
  fi
  # If there are no JSON files, this will just do nothing.
  n8n import:workflow --separate --input=/workflows ${OVERWRITE_FLAG} || true
fi

# Expose a health check log
echo "Starting n8n..."
# Chain to the official n8n entrypoint (provided by base image)
exec /docker-entrypoint.sh n8n
