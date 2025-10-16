FROM n8nio/n8n:latest

USER root
RUN mkdir -p /workflows && chown -R node:node /workflows
COPY n8n/workflows/ /workflows/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENV N8N_USER_FOLDER=/data
USER node
ENTRYPOINT ["/docker-entrypoint.sh"]
