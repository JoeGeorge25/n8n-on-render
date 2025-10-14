FROM n8nio/n8n:latest

USER root
RUN apt-get update && apt-get install -y jq curl && rm -rf /var/lib/apt/lists/*

# Copy workflows and entrypoint
RUN mkdir -p /workflows /entry
COPY n8n/workflows /workflows
COPY docker-entrypoint.sh /entry/entry.sh
RUN chmod +x /entry/entry.sh

# n8n user folder lives on the Render disk at /data (declared in render.yaml)
ENV N8N_USER_FOLDER=/data

USER node
ENTRYPOINT ["/entry/entry.sh"]

 
