FROM n8nio/n8n:latest

USER root
RUN mkdir -p /workflows
COPY n8n/workflows/ /workflows/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# n8n stores user data here; mount a disk later if you upgrade plan
ENV N8N_USER_FOLDER=/data

USER node
ENTRYPOINT ["/docker-entrypoint.sh"]
 

 
