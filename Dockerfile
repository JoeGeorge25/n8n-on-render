 FROM n8nio/n8n:latest

USER root
RUN mkdir -p /workflows
COPY n8n/workflows/ /workflows/
COPY docker-entrypoint.sh /docker-entrypoint.sh

# normalize Windows line endings and make executable
RUN sed -i 's/\r$//' /docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

ENV N8N_USER_FOLDER=/data
USER node
ENTRYPOINT ["/docker-entrypoint.sh"]
