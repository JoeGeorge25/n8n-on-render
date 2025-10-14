FROM n8nio/n8n:latest

# copy as root
USER root
RUN mkdir -p /workflows
COPY n8n/workflows/ /workflows/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# n8n data will live on /data (Render disk if you use one)
ENV N8N_USER_FOLDER=/data

# run as node (default user in image)
USER node
ENTRYPOINT ["/docker-entrypoint.sh"]
 
