# Use a base Node.js image compatible with n8n
FROM node:18

# Set environment variables
ENV NODE_ENV=production
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

# Install required packages for video rendering
RUN apt-get update && \
    apt-get install -y ffmpeg libass9 curl bc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install n8n globally
RUN npm install -g n8n

# Expose the port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
