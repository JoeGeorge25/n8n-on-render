# Use official n8n image
FROM n8nio/n8n:latest

# Become root to add scripts/files
USER root

# Create a place for optional seed workflows
RUN mkdir -p /workflows && chown -R node:node /workflows

# Add our entrypoint wrapper (to optionally auto-import workflows)
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh && chown node:node /docker-entrypoint.sh

# Switch back to node (n8n runs as node user)
USER node

# Default folders n8n expects:
# /data will be your Render persistent disk mount
ENV N8N_USER_FOLDER=/data

# Start via our wrapper (which then execs the standard n8n entrypoint)
ENTRYPOINT ["/docker-entrypoint.sh"]
