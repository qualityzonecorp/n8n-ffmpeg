# Start from official n8n image
FROM n8nio/n8n:latest

# Switch to root to install software
USER root

# Install FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean

# Switch back to default n8n user
USER node
