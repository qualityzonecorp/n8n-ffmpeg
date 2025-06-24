# 1. Use base Node.js image
FROM node:18

# 2. Set essential environment variables
ENV NODE_ENV=production \
    N8N_HOST=0.0.0.0 \
    N8N_PORT=5678 \
    N8N_PERSONALIZATION_ENABLED=false

# 3. Install ffmpeg, libass, curl, and bc
RUN apt-get update && \
    apt-get install -y ffmpeg libass9 curl bc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 4. Install n8n globally
RUN npm install -g n8n

# 5. Set working directory for app runtime
WORKDIR /home/node

# 6. Expose persistent data volume for credentials, workflows, binaries
VOLUME ["/home/node/.n8n"]

# 7. Expose n8n port
EXPOSE 5678

# 8. Start n8n
CMD ["n8n"]
