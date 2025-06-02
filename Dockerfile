# Start from official n8n image
FROM n8nio/n8n:latest

# Switch to root to install software
USER root

# Install FFmpeg (use apk for Alpine Linux)
RUN apk update && apk add ffmpeg

# Switch back to default n8n user
USER node
EXPOSE 5678