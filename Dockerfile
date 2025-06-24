# Use a base Node.js image compatible with n8n
FROM node:18

# Set environment variables (useful for n8n)
ENV NODE_ENV=production
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678

# Install required packages for video rendering
RUN apt-get update && \
    apt-get install -y ffmpeg libass9 curl bc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy package files if using n8n from source (optional)
# COPY package*.json ./
# RUN npm install

# Or install n8n globally if not using source
RUN npm install -g n8n

# Copy custom workflows or data if you want
# COPY .n8n /home/node/.n8n

# Make sure port is exposed
EXPOSE 5678

# Start n8n on container boot
CMD ["n8n"]
