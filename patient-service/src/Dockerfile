FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy only dependency manifests first (better cache utilization)
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy application source code
COPY . .

# Expose patient service port
EXPOSE 3000

# Start the service
CMD ["node", "src/index.js"]
