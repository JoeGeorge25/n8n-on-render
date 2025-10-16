FROM n8nio/n8n:latest

# (Optional) include seed workflows; they won’t run unless you import in the UI
USER root
RUN mkdir -p /workflows && chown -R node:node /workflows
COPY n8n/workflows/ /workflows/

# n8n uses /data for persistent files if/when you attach a disk later
ENV N8N_USER_FOLDER=/data

# Use the image’s default entrypoint (starts n8n)
USER node
# Do not set ENTRYPOINT or CMD; base image already runs: n8n start
