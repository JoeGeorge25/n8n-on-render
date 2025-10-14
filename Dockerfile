FROM n8nio/n8n:latest

USER root
RUN apt-get update && apt-get install -y jq curl && rm -rf /var/lib/apt/lists/*

# include workflows in the image (must exist in the repo)
RUN mkdir -p /workflows
COPY n8n/workflows/ /workflows/

# n8n data will live on Render disk mounted at /data
ENV N8N_USER_FOLDER=/data

USER node
# import workflows at runtime, then start n8n
CMD ["sh","-lc","n8n import:workflow --input=/workflows --separate || true; n8n start"]

 
