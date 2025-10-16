 FROM n8nio/n8n:latest

USER root
# seed folder (optional, but we’ll import from it on first boot)
RUN mkdir -p /workflows && chown -R node:node /workflows
COPY n8n/workflows/ /workflows/

# entrypoint wrapper for one-time import
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# n8n user data path (works with a mounted disk at /data)
ENV N8N_USER_FOLDER=/data

USER node
ENTRYPOINT ["/docker-entrypoint.sh"]
