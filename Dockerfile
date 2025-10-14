 # Dockerfile (safe/minimal)
FROM n8nio/n8n:latest

# Work as root only while copying files
USER root

# Ensure target dirs exist
RUN mkdir -p /workflows

# Copy workflows (must exist in the repo; keep at least one file inside)
COPY n8n/workflows/ /workflows/

# Copy entrypoint and make it executable
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Persist n8n user data on Render disk (set in render.yaml)
ENV N8N_USER_FOLDER=/data

# Drop privileges back to node (n8n image default)
USER node

# Start through our tiny wrapper
ENTRYPOINT ["/docker-entrypoint.sh"]
